pageextension 50102 ItemList extends "Item List"
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

            action("test")
            {
                CaptionML = ENG='tes button',
                            ENU='tes button';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Action;
                ApplicationArea = All;

                trigger
                OnAction();
                begin          
                   Message('tes berhasil');
                end;
            }
        }
    }
    
    var
        myInt: Integer;
}