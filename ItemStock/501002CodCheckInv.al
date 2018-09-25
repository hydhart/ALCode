codeunit 50102 "Check Inventory"
{
    //#region fungsi Check
    procedure Check() : Boolean
    var
        item:Record Item;

    begin
        item.Reset;
        item.SetAutoCalcFields(Inventory);
        if item.FindFirst then
        begin            
            repeat
                if item.Inventory < item."Safety Stock Quantity" then
                    item."Out of Stock" := true
                else
                    item."Out of Stock" := false;
                item.Modify;                
            until item.Next=0;
            exit(true);
        end
        else 
            exit(false);
    end;
    //#endregion fungsi Check
}