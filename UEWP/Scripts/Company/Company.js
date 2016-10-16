
//CallAjax(callType, callUrl, callParas, succeedFun, failedFun)

var divCompanyInformationContainerID = "divCompanyInformationContainer";
var btnSaveComActionID = "btnSaveComAction";
var btnCancelComActionID = "btnCancelComAction";
$(document).ready(function () {
    //绑定增加，编辑，删除事件
    $("#btnAddCompany").click(function () {
        openW3SSDialog(divCompanyInformationContainerID);
    });
    $("#" + btnSaveComActionID).click(function () {
        addCompany();
    });
    $("#" + btnCancelComActionID).click(function () {
        closeW3SSDialog(divCompanyInformationContainerID);
    });
    //搜索
    $("#btnSearCompany").click(function () {
        $("#" + btnRefreshCompanyGrid).click();
    });

});

function openCompanyDialog() {
    openW3SSDialog(divCompanyInformationContainerID);
}

function approveApplication(companyID) {
    if (confirm("通过企业申请吗？")) {
        alert("OK");
    }
}
function addCompany() {
    var compandyID=$("#txtCompanyID").val();   
    var newCom = {
        ID: compandyID == "" ? -1 : parseInt(compandyID),
        Name: $("#txtCompanyName").val(),
        Phone: $("#txtCompanyPhone").val(),
        Address: $("#txtCompanyAddress").val(),
        Contactor: $("#txtCompanyContactor").val(),
        IsActive: $("#chkCompanyIsActive").prop("checked")
    };
    var callData = "{newCom:" + JSON.stringify(newCom) + "}";
    var callUrl = "Companies.aspx/AddCompany";
    CallAjax(postType, callUrl, callData, addCompanySucceed, addCompanyFailed);
}
function addCompanySucceed(result) {
    alert(result.Message);
    closeW3SSDialog(divCompanyInformationContainerID);
    $("#" + btnRefreshCompanyGrid).click();
    //alert(result);
}
function addCompanyFailed(result) {
    //alert(result);
}
