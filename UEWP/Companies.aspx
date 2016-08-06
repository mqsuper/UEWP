<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="Companies.aspx.cs" Inherits="UEWP.Companies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/Company/Company.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="lefNavigator" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="w3-container">
        <asp:GridView runat="server" ID="gvCompanies" AutoGenerateColumns="false" CssClass="w3-table w3-striped w3-hover-gray w3-border">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <input class="w3-btn w3-round" value="View" style="width: 80px;" onclick="openCompanyDialog();" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CompanyName" HeaderText="Company Name" />
                <asp:BoundField DataField="CompanyAddress" HeaderText="Company Address" />
                <asp:BoundField DataField="CompanyPhone" HeaderText="Company Phone" />
                <asp:BoundField DataField="CompanyContactor" HeaderText="Company Contactor" HeaderStyle-CssClass="w3-hide-small" ItemStyle-CssClass="w3-hide-small" />
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
