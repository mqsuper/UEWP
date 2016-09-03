$(document).ready(function () {
    //绑定增加，编辑，删除事件
    $("#btnAddBiz").click(function () {
        addBiz();
    });

    //搜索
    $("#btnSearch").click(function () {
        $("#" + btnRefresh).click();
    });

});
function addBiz() {
    var callUrl = "BusinessList.aspx/Add";
    var callData = "";
    CallAjax(postType, callUrl, callData, addSucceed, addFailed);
}
function addSucceed(result) {
    alert(result.Message);
    $("#" + btnRefresh).click();
    //alert(result);
}
function addFailed(result) {
    //alert(result);
}

