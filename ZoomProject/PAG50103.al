pageextension 50103 BankAccount extends "Bank Account List"
{
    actions
    {
        addlast(Processing)
        {
            action("Zoom In")
            {
                CaptionML = ENG='Show All Fields',
                            ENU='Show All Fields';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Database;
                ApplicationArea = All;
            }
        }
    }
}