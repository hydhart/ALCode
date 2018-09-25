page 50110 CompanyInfoWizard
{
    PageType = NavigatePage;
    SourceTable = "Company Information";
    CaptionML = ENU='Company Information';
    
    layout
    {
        area(content)
        {
            group(StandardBanner)
            {
                Editable= false;
                Visible=TopBannerVisible AND (CurrentStep < 3);
                field(MediaResourcesStandard;MediaResourcesStandard."Media Reference")
                {
                    Editable = false;
                    ShowCaption = false;
                }
            }
            group(FinishedBanner)
            {
                Editable= false;
                Visible= TopBannerVisible AND (CurrentStep = 3);
                field(MediaResourcesDone;MediaResourcesDone."Media Reference")
                {
                    Editable= false;
                    ShowCaption= false;
                }
            }
            group(Step1)
            {
                Visible = CurrentStep = 1;
                group(CompanyName)
                {
                    CaptionML = ENU='Company Name';
                    InstructionalTextML = ENU = 'Provide the name of your Company';
                    field(Name;Name)
                    {
                        ApplicationArea = All;
                    }
                }
            }
            group(Step2)
            {
                Visible = CurrentStep = 2;
                group(emailaddress)
                {
                    CaptionML = ENU = 'Email Address';
                    field("E-Mail";"E-Mail")
                    {
                        ApplicationArea = All;
                    }
                }
            }
            group(Step3)
            {
                Visible=CurrentStep=3;
                group(Alldone)
                {
                    CaptionML = ENU='All done';
                    InstructionalTextML = ENU = 'Thank you! All information is now ready';
                }
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionBack)
            {
                ApplicationArea = Basic;
                CaptionML = ENU='Back';
                Enabled = ActionBackAllowed;
                Image = PreviousRecord;
                InFooterBar = true;
                trigger OnAction()
                begin
                    TakeStep(-1);
                end;
            }
            action(ActionNext)
            {
                ApplicationArea = Basic;
                CaptionML = ENU='Next';
                Enabled = ActionNextAllowed;
                Image = NextRecord;
                InFooterBar = true;    
                trigger OnAction()
                begin
                    TakeStep(1);
                end;            
            }
            action(ActionFinish)
            {
                ApplicationArea = Basic;
                CaptionML = ENU='Finish';
                Enabled = ActionFinishAllowed;
                Image = Approve;
                InFooterBar = true;
                trigger OnAction()
                begin
                    CurrPage.Close();
                end;             
            }
        }
    }

    local procedure SetControl()
    begin
        ActionBackAllowed := CurrentStep > 1;
        ActionNextAllowed := CurrentStep < 3;
        ActionFinishAllowed := CurrentStep = 3;    
    end;

    local procedure TakeStep(Step:  Integer)
    begin
        CurrentStep += Step;
        SetControl();
    end;

    trigger OnInit()
    begin
        LoadTopBanner();
    end;

    trigger OnOpenPage()
    begin
        CurrentStep := 1;
        SetControl();
    end;

    local procedure LoadTopBanner()
    begin
        if MediaRepositoryStandard.Get('AssistedSetup-NoText-400px.png', Format(CurrentClientType())) and
            MediaRepositoryDone.Get('AssistedSetupDone-NoText-400px.png', Format(CurrentClientType()))
        then
        if MediaResourcesStandard.Get(MediaRepositoryStandard."Media Resources Ref") and
            MediaResourcesDone.Get(MediaRepositoryDone."Media Resources Ref")
        then
            TopBannerVisible := MediaResourcesDone."Media Reference".HasValue();            
    end;

    var
        CurrentStep: Integer;
        ActionBackAllowed: Boolean;
        ActionNextAllowed: Boolean;
        ActionFinishAllowed: Boolean;
        MediaRepositoryStandard: Record "Media Repository";
        MediaRepositoryDone: Record "Media Repository";
        MediaResourcesStandard: Record "Media Resources";
        MediaResourcesDone: Record "Media Resources";
        TopBannerVisible: Boolean;
}