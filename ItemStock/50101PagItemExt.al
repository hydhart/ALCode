pageextension 50101 ItemStockPage extends "Item List"
{
    layout
    {
        addafter(Inventory)
        {
            field("Out of Stock"; "Out of Stock")
            {

            }
        }
    }

    actions
    {
        addfirst(Processing)
        {
            action("Check Inventory")
            {
                Image = Alerts;

                trigger
                OnAction()
                begin
                    if checkInv.Check() then begin
                        Message('Item List Updated');
                        CurrPage.Update();
                    end;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        checkInv.Check();
        CurrPage.Update();
    end;

    var
        checkInv: Codeunit "Check Inventory";
}