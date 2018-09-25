table 50115 ALIssue
{   
    fields
    {
        field(1;id; Integer)
        {
            Caption= 'Id';
        }
        field(2; number; Integer)
        {
            Caption= 'Number';
        }
        field(3; title; Text[250])
        {
            Caption= 'Title';
        }
        field(4; created_at; DateTime)
        {
            Caption= 'Created at';
        }
        field(5; user; Text[50])
        {
            Caption= 'User';
        }
        field(6; state; Text[30])
        {
            Caption= 'State';
        }
        field(7; html_url; Text[250])
        {
            Caption= 'Url';
        }
    }
    
    keys
    {
        key(PK; id)
        {
            Clustered = true;
        }
    }

    procedure RefreshIssues()
    var
        RefreshALIssue: Codeunit RefreshALIssueCode;
    begin
        RefreshALIssue.Refresh;
    end;
}