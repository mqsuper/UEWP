
//CallAjax(callType, callUrl, callParas, succeedFun, failedFun)

$(document).ready(function () {
    //绑定增加，编辑，删除事件
    $("#btnAddCompany").click(function () {
        addCompany();
    });

    //搜索
    $("#btnSearCompany").click(function () {
        $("#" + btnRefreshCompanyGrid).click();
    });
    
});

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
function addCompany()
{
    var callUrl = "Companies.aspx/AddCompany";
    var callData = "";
    CallAjax(postType, callUrl, callData, addCompanySucceed, addCompanyFailed);
}
function addCompanySucceed(result)
{
    alert(result.Message);  
    $("#"+btnRefreshCompanyGrid).click();
    //alert(result);
}
function addCompanyFailed(result)
{
    //alert(result);
}
