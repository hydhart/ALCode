page 50115 ALIssueList
{
    PageType = List;
    SourceTable = ALIssue;
    Editable = false;
    SourceTableView = order(descending);
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(id; id)
                {
                    Caption = 'id';
                    ApplicationArea = All;
                }
                field(number; number)
                {
                    Caption = 'number';
                    ApplicationArea = All;
                }
                field(title; title)
                {
                    Caption = 'title';
                    ApplicationArea = All;
                }
                field(created_at; created_at)
                {
                    Caption = 'created at';
                    ApplicationArea = All;
                }
                field(user; user)
                {
                    Caption = 'user';
                    ApplicationArea = All;
                }
                field(state; state)
                {
                    Caption = 'state';
                    ApplicationArea = All;
                }
                field(html_url; html_url)
                {
                    Caption = 'URL';
                    ApplicationArea = All;
                    ExtendedDatatype = URL;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(RefreshALIssueList)
            {
                Caption = 'Refresh AL Issue';
                Promoted = true;
                PromotedCategory = Process;
                Image = RefreshLines;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    RefreshIssues();
                    CurrPage.Update();
                    if findfirst then;
                end;
            }
        }
    }
}