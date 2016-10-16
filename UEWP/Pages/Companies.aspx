<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="Companies.aspx.cs" Inherits="UEWP.Web.Pages.Companies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/Company/Company.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="lefNavigator" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        var btnRefreshCompanyGrid='<%=btnRefreshCompanies.ClientID%>';
    </script>

    <div id="divCompanyList" runat="server">
        <header class="w3-container w3-teal">
            <span class="w3-opennav w3-xlarge w3-hide-large" onclick="w3_open()">&#9776;</span>

        </header>
        <div class="w3-container">
            <br />
            关键字：
            <input type="text" class=" w3-border w3-round" style="max-width: 300px; height: 30px;" id="txtKeyword" runat="server" />
            <input type="button" class="w3-btn w3-white w3-border w3-border-blue w3-round" id="btnSearCompany" value="搜索" />
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <br />
            <br />
            <input type="button" class="w3-btn w3-white w3-border w3-border-blue w3-round" id="btnAddCompany" value="+增加" />
            <asp:Button ID="btnRefreshCompanies" runat="server" OnClick="btnRefreshCompanies_Click" Style="display: none" />
            <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="UP_gridview">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnRefreshCompanies" />
                </Triggers>
                <ContentTemplate>
                    <asp:GridView runat="server" ID="gvCompanies" AllowPaging="true" PageSize="8"
                        AutoGenerateColumns="false" CssClass="w3-table w3-striped w3-hover-gray "
                        OnPageIndexChanging="gvCompanies_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="" ItemStyle-CssClass="hidden w3-hide-small" HeaderStyle-CssClass="hidden" />
                            <asp:BoundField DataField="Name" HeaderText="名称" />
                            <asp:BoundField DataField="Address" HeaderText="地址" />
                            <asp:BoundField DataField="Phone" HeaderText="联系方式" />
                            <asp:BoundField DataField="Contactor" HeaderText="联系人" HeaderStyle-CssClass="w3-hide-small" ItemStyle-CssClass="w3-hide-small" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <input class="w3-btn w3-round" value="查看" style="width: 80px;" onclick="openCompanyDialog();" />
                                    <input class="w3-btn w3-round" value="通过" style="width: 80px;" onclick="approveApplication('<%#  Eval("ID") %>    ');" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="w3-pagination w3-border-bottom  w3-round pager" HorizontalAlign="Center" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="divCompanyInformationContainer" class="w3-modal w3-round">
            <div class="w3-modal-content w3-round">
                <div class="w3-container w3-padding">
                    <span onclick="document.getElementById('divCompanyInformationContainer').style.display='none'"
                        class="w3-closebtn">&times;</span>

                    <header class="w3-teal w3-padding  w3-padding-top w3-padding-bottom w3-round">公司信息</header>
                    <input class="w3-input w3-border w3-light-grey" type="hidden" id="txtCompanyID" />
                    <label class="w3-label w3-text-teal w3-left"><b>公司名称</b></label>
                    <input type="text" class="w3-input w3-border w3-round" id="txtCompanyName" />
                    <label class="w3-label w3-text-teal w3-left"><b>公司地址</b></label>
                    <input type="text" class="w3-input w3-border w3-round" id="txtCompanyAddress" />
                    <label class="w3-label w3-text-teal w3-left"><b>公司联系人</b></label>
                    <input type="text" class="w3-input w3-border w3-round" id="txtCompanyContactor" />
                    <label class="w3-label w3-text-teal w3-left"><b>公司联系方式</b></label>
                    <input type="text" class="w3-input w3-border w3-round" id="txtCompanyPhone" />
                    <label class="w3-label w3-text-teal w3-left"><b>状态</b></label>
                    <input class="w3-input w3-border w3-light-grey" type="checkbox" id="chkCompanyIsActive" />
                    <br />
                    <div class="w3-container w3-center">
                        <input type="button" class="w3-btn w3-white w3-border w3-border-blue w3-round" id="btnSaveComAction" value="保存" />
                        <input type="button" class="w3-btn w3-white w3-border w3-border-blue w3-round" id="btnCancelComAction" value="取消" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="divInformationPanel" class="w3-panel w3-pale-yellow w3-leftbar w3-border-yellow w3-display-middle" style="height: 40px" runat="server"></div>

</asp:Content>
