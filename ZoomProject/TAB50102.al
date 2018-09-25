tableextension 50102 ItemNew extends Item
{
    fields
    {
        field(50000; Test; Boolean)
        {

        }
        modify(Description)
        {
            trigger
            OnAfterValidate();
            begin
                Test := true;
                if Modify() then 
                   Message('sukses')
                else
                    Message('gagal');
            end;
        }
    }
}