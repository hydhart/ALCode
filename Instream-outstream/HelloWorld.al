// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{    
    trigger OnOpenPage();
    begin
       if Confirm('Create File?', true) then
        instreamtoFile();
    end;

    local procedure instreamtoFile()
    var
        inStr: InStream;
        outStr: OutStream;
        tempBlob: Record TempBlob temporary;
        CR: Char;
        LF: Char;        
        fileName: Text;
        folderName: Text;
        fileMgt: Codeunit "File Management";

    begin
        fileName := 'tes.txt';
        folderName := 'C:\DEMO';
        CR:= 13;
        LF:= 10;
        tempBlob.Blob.CreateOutStream(outStr);
        outStr.WriteText('First Line'+ CR + LF);
        outStr.WriteText('Second Line'+ CR + LF);
        outStr.WriteText('Third Line'+ CR + LF);
        tempBlob.Blob.CreateInStream(inStr);
        DownloadFromStream(inStr, '',folderName,'All files (*.*) | *.*',fileName);
        Message('berhasil'+CR +LF + 'yess');        
    end;

    local procedure instreamfromURL()
    var
        inStr: InStream;
        outStr: OutStream;
        tempBlob: Record TempBlob temporary;
        myfile: File;
        tex: Text;
        Client: HttpClient;
        Response: HttpResponseMessage;
        
        begin
         if Confirm('create file ?', true) then begin
            //Client.Get('https://www.sample-videos.com/text/Sample-text-file-50kb.txt', Response);
            Client.Get('https://gist.githubusercontent.com/Ram-N/5189462/raw/46db0b43ad7bf9cbd32a8932f3ab981bd4b4da7c/books.xml', Response);                      
            
            Response.Content().ReadAs(InStr);
            tempBlob.Blob.CreateOutStream(OutStr);
            //tempBlob.Blob.CreateOutStream(outStr);
            //outStr.WriteText('tess\n tess2\\ tess3');

            //tex := 'testfile.txt';            
            tex  := 'tes.xml';
            CopyStream(outStr, inStr);
            
            tempBlob.Blob.CreateInStream(inStr);
            DownloadFromStream(inStr, '', '', '', tex);
        end;
    end;
}