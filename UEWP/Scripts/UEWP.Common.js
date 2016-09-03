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