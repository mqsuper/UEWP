<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="UEWP.Web.Pages.UserList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<script src="../Scripts/User/ResponsiveDialog.js"></script>--%>
    <script src="../Scripts/User/UserManagement.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="lefNavigator" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        var btnRefresh = '<%=btnRefresh.ClientID%>';
    </script>
    <style>
       
     
    </style>
    <div id="divUserList" runat="server">
        <header class="w3-container w3-teal">
            <span class="w3-opennav w3-xlarge w3-hide-large" onclick="w3_open()">&#9776;</span>
        </header>
        <div class="w3-container">
            <br />
            关键字：
        <input type="text" class=" w3-border w3-round" style="max-width: 300px; height: 30px;" id="txtKeyword" runat="server" />
            <input type="button" class="w3-btn w3-white w3-border w3-border-blue w3-round" id="btnSearch" value="搜索" />
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <br />
            <br />
            <input type="button" class="w3-btn w3-white w3-border w3-border-blue w3-round" id="btnAddUser" value="+增加" />
            <asp:Button ID="btnRefresh" runat="server" OnClick="btnRefresh_Click" Style="display: none" />
            <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="Upanel">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnRefresh" />
                </Triggers>
                <ContentTemplate>
                    <asp:GridView runat="server" ID="gvUsers" AllowPaging="true" PageSize="8"
                        AutoGenerateColumns="false" CssClass="w3-table w3-striped w3-hover-gray "
                        OnPageIndexChanging="gvUsers_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="" ItemStyle-CssClass="hidden w3-hide-small" HeaderStyle-CssClass="hidden" />
                            <asp:BoundField DataField="CompanyID" HeaderText="" ItemStyle-CssClass="hidden w3-hide-small" HeaderStyle-CssClass="hidden" />
                            <asp:BoundField DataField="Name" HeaderText="名称" />
                            <asp:BoundField DataField="Email" HeaderText="邮箱" />
                            <asp:BoundField DataField="Phone" HeaderText="联系方式" />
                            <asp:BoundField DataField="IsActive" HeaderText="状态" />

                            <asp:TemplateField>
                                <ItemTemplate>
                                    <input class="w3-btn w3-round" value="权限" style="width: 80px;" onclick="openRoleAssignDialog(this);" />

                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="w3-pagination w3-border-bottom  w3-round pager" HorizontalAlign="Center" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

    </div>

    <div id="divInformationPanel" class="w3-panel w3-red" style="height: 40px;" runat="server">
    </div>
    <div style="display: none;">
        <input type="text" id="hiddenUserID" />
        <input type="text" id="hiddenCompanyID" />
    </div>
    <div id="divRoleAssignDialog"></div>
    <div class="w3-container" id="divUserInformationContainer" style="display: none;">
         <header class="w3-teal w3-padding  w3-padding-top w3-padding-bottom w3-round">用户信息</header>
        <label class="w3-label w3-text-teal w3-left"><b>用户名</b></label>
        <input class="w3-input w3-border w3-light-grey" type="hidden" id="txtUserID" />
        <input class="w3-input w3-border w3-light-grey" type="text" id="txtUserName" />
        <label class="w3-label w3-text-teal w3-left"><b>邮箱</b></label>
        <input class="w3-input w3-border w3-light-grey" type="text" id="txtUserEmail" />
        <label class="w3-label w3-text-teal w3-left"><b>联系方式</b></label>
        <input class="w3-input w3-border w3-light-grey" type="text" id="txtUserPhone" />
        <label class="w3-label w3-text-teal w3-left"><b>年龄</b></label>
        <input class="w3-input w3-border w3-light-grey" type="text" id="txtUserAge" />
        <label class="w3-label w3-text-teal w3-left"><b>用户状态</b></label>
        <input class="w3-input w3-border w3-light-grey" type="checkbox" id="chkUserIsActive" />
        <div class="w3-container w3-center">
            <input type="button" class="w3-btn w3-white w3-border w3-border-blue w3-round" id="btnSaveUserAction" value="保存" />
            <input type="button" class="w3-btn w3-white w3-border w3-border-blue w3-round" id="btnCanSaveUserAction" value="取消" />
        </div>

    </div>

</asp:Content>
