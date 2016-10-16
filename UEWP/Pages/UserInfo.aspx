<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserInfo.aspx.cs" Inherits="UEWP.Web.Pages.UserInfo" %>

<div class="w3-container" id="divUserInformationContainer">    
    <table class="w3-table w3-bordered w3-border ">
        <tr>
            <td style="width: 40%" colspan="2">用户信息</td>

        </tr>
        <tr>
            <td>  <label class="w3-label w3-text-teal w3-left"><b>用户名</b></label>
                <input class="w3-input w3-border w3-light-grey" type="text"   id="txtUserID" />
                <%--hidden="hidden"--%>
            </td>
            <td><input class="w3-input w3-border w3-light-grey" type="text"  id="txtUserName" /></td>
        </tr>
        <tr>
             <td>  <label class="w3-label w3-text-teal w3-left"><b>邮箱</b></label></td>
           <td><input class="w3-input w3-border w3-light-grey" type="text"  id="txtUserEmail" /></td>
        </tr>
        <tr>
            <td>  <label class="w3-label w3-text-teal w3-left"><b>联系方式</b></label></td>
            <td><input class="w3-input w3-border w3-light-grey" type="text"  id="txtUserPhone" /></td>
        </tr>
        <tr>
           <td>  <label class="w3-label w3-text-teal w3-left"><b>年龄</b></label></td>
          <td><input class="w3-input w3-border w3-light-grey" type="text"  id="txtUserAge" /></td>
        </tr>
        <tr>
           <td>  <label class="w3-label w3-text-teal w3-left"><b>用户状态</b></label></td>
          <td><input class="w3-input w3-border w3-light-grey" type="text"  id="txtUserIsActive" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <div class="w3-container w3-center">
                    <input type="button" class="w3-btn w3-white w3-border w3-border-blue w3-round" id="btnSaveUserAction" value="保存" />
                    <input type="button" class="w3-btn w3-white w3-border w3-border-blue w3-round" id="btnCanSaveUserAction" value="取消" />
                </div>
            </td>
        </tr>
    </table>
</div>
