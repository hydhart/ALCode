pageextension 50140 ItemCardExt extends "Item Card"
{
    actions
    {
        addbefore(AdjustInventory)
        {
            action(DownloadPicture)
            {
                CaptionML= ENU= 'Download Picture';
                Image = Picture;                
                ApplicationArea = All;

                trigger OnAction()
                var
                    DownloadMgt: Codeunit HttpDownloadMgt;
                    TempBlob: Record TempBlob temporary;
                    InStr: InStream;
                begin
                    DownloadMgt.DownloadPicture('http://vjeko.com/demo/bicycle.jpg', TempBlob);
                    TempBlob.Blob.CreateInStream(InStr);
                    Rec.Picture.ImportStream(InStr, 'Default Image');
                    CurrPage.Update(true);
                end;                
            }
        }
    }
}