var postType = "POST";
var getType = "Get";
function CallAjax(callType, callUrl, callParas, succeedFun, failedFun)
{
	$.ajax({
		type: callType,
		url: callUrl,
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		data: callParas,
		success: function (response) {
			succeedFun(response.d);
		},
		failure: function (response) {
			failedFun(response.d);
		}
	});
}
function openDialog(dialogID)
{
    $('#' + dialogID).dialog('open');
}
function closeDialog(dialogID)
{
    $('#' + dialogID).dialog('close');
}
function openW3SSDialog(dialogID) {
    var w3SSModal = $("#" + dialogID);
    w3SSModal.css("display", 'block');
}
function closeW3SSDialog(dialogID) {
    var w3SSModal = $("#" + dialogID);
    w3SSModal.css("display", 'none');
}
