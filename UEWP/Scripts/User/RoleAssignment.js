var userID;
var companyID;
var chkCompanyAdmin;
$(document).ready(function () {

    userID = $("#hiddenUserID").val();
    companyID = $("#hiddenCompanyID").val();
    chkCompanyAdmin = $("#chkCompanyAdmin");
    loadExistedRoleInfo();
    checkedCompanyAdmin(chkCompanyAdmin);
    chkCompanyAdmin.click(function () {
        checkedCompanyAdmin(this);
    });

    //绑定保存业务权限的事件
    $("#btnSaveRoleAssignment").click(function () {
        var checkedBizIDs = getCheckedBusiness();
        var isCompanyAdmin = $("#chkCompanyAdmin").prop("checked");
        saveRoleAssignment(checkedBizIDs, isCompanyAdmin);
    });

    //帮点关掉窗口事件
    //帮点关掉窗口事件
    $("#btnCancelRoleAssignment").click(function () {
        closeRoleAssignmentDialog();
    });
});
function closeRoleAssignmentDialog()
{
    $('#divRoleAssignDialog').dialog('close');
}
function checkedCompanyAdmin(obj) {
    //选中admin的时候， 其他业务都不能选择
    if ($(obj).prop("checked")) {
        $("#businessList .CHKbusiness").each(function () {
            var currentBizCHK = $(this);
            currentBizCHK.attr('disabled', "disabled");
            if (currentBizCHK.prop("checked")) {
                currentBizCHK.prop("checked", false);
                currentBizCHK.removeAttr("checked");
            }
        });
    }
    else { //去掉Admin的时候， 开方其他业务的选择
        $("#businessList .CHKbusiness").each(function () {
            var currentBizCHK = $(this);
            if (typeof (currentBizCHK.attr('disabled')) != "undefined") {
                currentBizCHK.removeAttr('disabled')
            }
        });
    }
}
function loadExistedRoleInfo() {

    var callUrl = "AssignRole.aspx/GetRoleInformationonAllBusiness";
    var callData = "{'userID':'" + userID + "','compandyID':" + companyID + "}";
    CallAjax(postType, callUrl, callData, loadSucceed, loadFailed);
}
function saveRoleAssignment(checkedBizIDs, isCompanyAdmin) {
    var callUrl = "AssignRole.aspx/SaveRoleAssignment";
    var callData = "{'bizIDs':" + JSON.stringify(checkedBizIDs) + " , 'isCompanyAdmin':" + isCompanyAdmin + ",'userID':'" + userID + "','companyID':" + companyID + "}";
    alert(callData);
    CallAjax(postType, callUrl, callData, saveRoleAssignmentSucceed, saveRoleAssignmentFailed);
}
function saveRoleAssignmentSucceed(result) {
    //$("#businessList").html(result);
}
function saveRoleAssignmentFailed(result) {
    //alert(result);
}


function getCheckedBusiness() {
    var allBizIDs = [];
    if (chkCompanyAdmin.prop("checked")) {
        return allBizIDs;
    }
    $("#businessList .CHKbusiness").each(function () {
        var currentBizCHK = $(this);
        if (currentBizCHK.prop("checked")) {
            //alert(currentBizCHK.attr("businessID"));
            allBizIDs.push(currentBizCHK.attr("businessID"));
        }
    });
    return allBizIDs;
}


function loadSucceed(result) {
    debugger;
    $("#businessList").html(result);
    var enterpriseAdminCHK = $("#chkCompanyAdmin");
    //  alert(isEnterpriseAdmin);
    if (typeof (isEnterpriseAdmin) != "undefined" && isEnterpriseAdmin == 'True') {
        enterpriseAdminCHK.prop("checked", true);
    }
    else {
        if (typeof (enterpriseAdminCHK.attr("checked")) != "undefined")
            enterpriseAdminCHK.removeAttr("checked");
    }
    closeRoleAssignmentDialog();
}
function loadFailed(result) {
    //alert(result);
}
