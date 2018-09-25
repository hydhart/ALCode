codeunit 50101 MyNewCodeunit
{
    trigger OnRun()
    begin
        
    end;

    [EventSubscriber(ObjectType::Table, 18, 'OnAfterInsertEvent', '', true, true)]
    local procedure CustomerOnAfterInsert(var Rec: Record Customer;RunTrigger: Boolean)
    begin
        Message('some message');
    end;
}