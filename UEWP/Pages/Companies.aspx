<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="Companies.aspx.cs" Inherits="UEWP.Companies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/Company/Company.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="lefNavigator" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="w3-container w3-teal">
        <span class="w3-opennav w3-xlarge w3-hide-large" onclick="w3_open()">&#9776;</span>
        <h1>公司列表</h1>
    </header>
    <div class="w3-container">
        <asp:GridView runat="server" ID="gvCompanies" AutoGenerateColumns="false" CssClass="w3-table w3-striped w3-hover-gray w3-border">
            <Columns>

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
        </asp:GridView>
    </div>
    <div id="divCompanyDetails" class="w3-modal w3-round">
        <div class="w3-modal-content w3-round">
            <div class="w3-container w3-padding">
                <span onclick="document.getElementById('divCompanyDetails').style.display='none'"
                    class="w3-closebtn">&times;</span>

                <header class="w3-teal w3-padding  w3-padding-top w3-padding-bottom w3-round">Company Detail</header>
                <label>Company Name</label>
                <input type="text" class="w3-input w3-border w3-round" id="txtCompanyName" />
                <label>Company Address</label>
                <input type="text" class="w3-input w3-border w3-round" id="txtCompanyAddress" />
                <br />
                <div class="w3-container w3-center">

                    <input type="button" class="w3-btn UEWPbtnMiddle" value="Edit" id="btnEdit" />
                    <input type="button" class="w3-btn UEWPbtnMiddle" value="Save" id="btnSave" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
