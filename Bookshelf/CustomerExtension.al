tableextension 50100 CustomerBookExtension extends Customer
{
    fields
    {
        field(50100; "Favourite Book No."; Code[20])
        {
            Caption = 'Favourite Book No.';
            TableRelation = Book;            
        }
    }

}