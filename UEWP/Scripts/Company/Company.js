function openCompanyDialog()
{
    var companyModal = $("#divCompanyDetails");
    companyModal.css("display",'block');
}

function approveApplication(companyID)
{
    if (confirm("通过企业申请吗？"))
    {
        alert("OK");
    }
}