<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssignRole.aspx.cs" Inherits="UEWP.Web.Pages.AssignRole" %>

<script src="../Scripts/User/RoleAssignment.js"></script>

<div class="w3-container">

    <script>
        var isEnterpriseAdmin='<%=isEnterpriseAdmin %>';
    </script>
    <table class="w3-table w3-bordered w3-border ">
        <tr>
            <td style="width:40%">公司管理员</td>
            <td style="width:60%">
                <input type="checkbox"  id="chkCompanyAdmin"><label class="w3-validate"></label></td>
        </tr>
        <tr>
            <td>业务模块权限</td>
            <td>
                <div id="businessList">
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div class="w3-container w3-center">
                    <input type="button" class="w3-btn w3-white w3-border w3-border-blue w3-round" id="btnSaveRoleAssignment" value="保存" />
                    <input type="button" class="w3-btn w3-white w3-border w3-border-blue w3-round" id="btnCancelRoleAssignment" value="取消" />
                </div>
            </td>
        </tr>
    </table>
</div>

