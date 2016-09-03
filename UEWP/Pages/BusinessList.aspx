<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="BusinessList.aspx.cs" Inherits="UEWP.Web.Pages.BusinessList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/Business/BizManagement.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="lefNavigator" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script>
        var btnRefresh = '<%=btnRefresh.ClientID%>';
    </script>
   
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
        <input type="button" class="w3-btn w3-white w3-border w3-border-blue w3-round" id="btnAddBiz" value="+增加" />
        <asp:Button ID="btnRefresh" runat="server" OnClick="btnRefresh_Click" Style="display: none" />
        <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="Upanel">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnRefresh" />
            </Triggers>
            <ContentTemplate>
                <asp:GridView runat="server" ID="gvBiz" AllowPaging="true" PageSize="8"
                    AutoGenerateColumns="false" CssClass="w3-table w3-striped w3-hover-gray "
                    OnPageIndexChanging="gvBiz_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="" ItemStyle-CssClass="hidden w3-hide-small" HeaderStyle-CssClass="hidden" />
                        <asp:BoundField DataField="Name" HeaderText="名称" />
                        <asp:BoundField DataField="Description" HeaderText="邮箱" />
                        <asp:BoundField DataField="IsActive" HeaderText="状态" />

                        <asp:TemplateField>
                            <ItemTemplate>
                                <input class="w3-btn w3-round" value="查看" style="width: 80px;" onclick="openCompanyDialog();" />

                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle CssClass="w3-pagination w3-border-bottom  w3-round pager" HorizontalAlign="Center" />
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>
