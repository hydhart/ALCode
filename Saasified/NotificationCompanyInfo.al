codeunit 50101 "Notification Company Info"
{
    procedure ShowCompanyInfoWizard(TheNotification: Notification)    
    begin
        Page.Run(Page::CompanyInfoWizard);
    end;

    [EventSubscriber(ObjectType::Page, 42, 'OnOpenPageEvent', '', false, false)]
    local procedure CheckCompanyInfo_OnOpenSalesOrder(var Rec: Record "Sales Header")
    var
        CompanyInformation: Record "Company Information";
        TheNotification: Notification;
    begin
        if CompanyInformation.get() then
            if (CompanyInformation.Name <> '') and (CompanyInformation."E-Mail" <> '') then
                exit;
        
        TheNotification.Id := '59269934-0412-473f-9edc-0c5e73f39477';
        TheNotification.Scope := NotificationScope::LocalScope;
        TheNotification.Message := 'Company Information is missing.';
        TheNotification.AddAction('Open Company Information', 50101, 'ShowCompanyInfoWizard');
        TheNotification.Send;
    end;
}