
var userDialogID = "divUserInformationContainer";
var btnCanSaveUserActionID = "btnCanSaveUserAction";
$(document).ready(function () {
    //绑定增加，编辑，删除事件
    $("#btnAddUser").click(function () {
        $("#" + userDialogID).dialog({
            autoOpen: false,
            modal:true
        });
        openDialog(userDialogID);
        //addUser();
    });
    $("#btnSaveUserAction").click(function () {
        addUser();
    });
    $("#" + btnCanSaveUserActionID).click(function () {
        closeDialog(userDialogID);
    });
    

    //搜索
    $("#btnSearch").click(function () {
        $("#" + btnRefresh).click();
    });
    
});
function addUser() {
    var newUser = {
        ID:$("#txtUserID").val(),
        Name: $("#txtUserName").val(),
        Phone: $("#txtUserPhone").val(),
        Age: $("#txtUserAge").val(),
        Email: $("#txtUserEmail").val(),
        IsActive: $("#chkUserIsActive").prop("checked")
    };
    var callUrl = "UserList.aspx/AddUser";
    var callData = "{newUser:" + JSON.stringify(newUser) + "}";
    CallAjax(postType, callUrl, callData, addUserSucceed, addUserFailed);
}
function addUserSucceed(result) {
    alert(result.Message);
    closeDialog(userDialogID);
    $("#" + btnRefresh).click();
    //alert(result);
}
function addUserFailed(result) {
    //alert(result);
}

function openRoleAssignDialog(obj)
{
    //get 单机列的userID，公司ID等
    var tds = $(obj).closest('tr').find('td');
    $("#hiddenUserID").val(tds.eq(0).text());
    $("#hiddenCompanyID").val(tds.eq(1).text());
    //var col = tds.eq(0);
    //var spanValue = col.find('span').text();
    
    $('#divRoleAssignDialog').dialog({
        minWidth: 400,
        maxHeight:400,
        autoOpen: false,
        modal: true
    });
   
    openDialog("divRoleAssignDialog");
    $("#divRoleAssignDialog").load("AssignRole.aspx");

}




