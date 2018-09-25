codeunit 50100 CompanyInfoAssistedSetup
{
    [EventSubscriber(ObjectType::Table, 1808, 'OnRegisterAssistedSetup', '', false, false)]
    local procedure "AggregatedAssistedSetup.OnRegisteredAssistedSetup"(var TempAggregatedAssistedSetup: Record "Aggregated Assisted Setup" temporary)
    var
        CompanyInformation: Record "Company Information";
    begin
        TempAggregatedAssistedSetup.AddExtensionAssistedSetup(Page::CompanyInfoWizard,
                                                            'Setup Company Information',
                                                            true,
                                                            CompanyInformation.RecordId(),
                                                            GetCompanyInformationSetupStatus(TempAggregatedAssistedSetup),
                                                            '');
    end;

    local procedure GetCompanyInformationSetupStatus(AggregatedAssistedSetup: Record "Aggregated Assisted Setup"): Integer
    var
        CompanyInformation: Record "Company Information";
    begin
        with AggregatedAssistedSetup do begin
            if CompanyInformation.get then
                if (CompanyInformation.Name='') or (CompanyInformation."E-Mail" = '') then
                    Status := Status::"Not Completed"
                else
                    Status := Status::Completed
            else
                Status := Status::"Not Completed";
            exit(Status);
        end;
    end;
}