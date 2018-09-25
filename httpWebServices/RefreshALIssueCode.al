codeunit 50141 RefreshALIssueCode
{
    procedure Refresh()
    var
        ALIssue : Record ALIssue;
        HttpClient: HttpClient;
        ResponseMessage: HttpResponseMessage;
        JsonToken: JsonToken;
        JsonValue: JsonValue;
        JsonArray: JsonArray;
        JsonObject: JsonObject;
        JsonText: Text;
        i: Integer;
    begin
        ALIssue.DeleteAll();
        
        HttpClient.DefaultRequestHeaders.Add('User-Agent', 'Dynamics 365');
        if not HttpClient.Get('https://api.github.com/repos/Microsoft/AL/issues', ResponseMessage) then
            Error('The call to the web services failed');

        if not ResponseMessage.IsSuccessStatusCode() then
            Error('The web services returned an error message:\\'+
                  'Status Code: %1'+
                  'Description: %2',
                  ResponseMessage.HttpStatusCode,
                  ResponseMessage.ReasonPhrase);

        ResponseMessage.Content.ReadAs(JsonText);

        if not JsonArray.ReadFrom(JsonText) then
            Error('Invalid response, expected an JSON array as root object');

        foreach JsonToken in JsonArray do begin
            JsonObject := JsonToken.AsObject;

            ALIssue.Init;
            if not JsonObject.Get('id', JsonToken) then
                Error('could not find a token with key %1');

            ALIssue.id := JsonToken.AsValue.AsInteger;
            ALIssue.number := GetJsonToken(JsonObject, 'number').AsValue.AsInteger;
            ALIssue.title := GetJsonToken(JsonObject, 'title').AsValue.AsText;
            ALIssue.state := GetJsonToken(JsonObject, 'state').AsValue.AsText;
            ALIssue.created_at := GetJsonToken(JsonObject, 'created_at').AsValue.AsDateTime;
            ALIssue.html_url := GetJsonToken(JsonObject, 'html_url').AsValue.AsText;

            ALIssue.user := SelectJsonToken(JsonObject, '$.user.login').AsValue.AsText;
            ALIssue.Insert;
        end;
    end;    

    local procedure GetJsonToken(JsonObject:JsonObject; TokenKey:Text) JsonToken:JsonToken
    begin
        if not JsonObject.Get(TokenKey, JsonToken) then
            Error('could not find a token with key %1', TokenKey);
    end;

    local procedure SelectJsonToken(JsonObject:JsonObject; Path:Text) JsonToken:JsonToken
    begin
        if not JsonObject.SelectToken(Path, JsonToken) then
            Error('could not find a token with path %1', Path);
    end;
}