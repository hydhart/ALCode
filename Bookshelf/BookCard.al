page 50100 "Book Card"
{
    PageType = Card;
    SourceTable = Book;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field(Title; Title)
                {
                    ApplicationArea = All;
                }
            }
            group(Detail)
            {
                Caption = 'Detail';
                field(Author; Author)
                {
                    ApplicationArea = All;
                }
                field(HardCover; HardCover)
                {
                    ApplicationArea = All;
                }
                field("Page Count"; "Page Count")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}