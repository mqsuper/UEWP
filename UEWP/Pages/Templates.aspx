<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="Templates.aspx.cs" Inherits="UEWP.Pages.Templates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/Template/Template.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="lefNavigator" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="w3-container   w3-margin-top">
        <ul class="w3-navbar w3-white">
            <li><a href="#" class="w3-border w3-round w3-red tablink w3-hover-light-grey w3-padding" onclick="openTemplateContainer(event, 'divTeplEdit');">编辑模板</a></li>
            <li><a href="#" class="w3-border w3-round tablink w3-hover-light-grey w3-padding" onclick="openTemplateContainer(event, 'divteplView');">查看模板</a></li>
           
        </ul>
        <div id="divTeplEdit" class="w3-round w3-container w3-border  templateContainer w3-padding-bottom">
          <p></p>
            <input type="text" class="w3-border  w3-input w3-light-grey" style="height:300px;" />
             <div class="w3-container w3-right w3-margin-top">
            <input class="w3-btn  UEWPbtnMiddle  w3-round w3-margin-bottom" value="保存模板" />
        <input class=" w3-btn UEWPbtnMiddle w3-round  w3-margin-bottom" value="发布模板" />
        </div>
        </div>

        <div id="divteplView" class="w3-round w3-container w3-border hidden templateContainer">
            <h2>Paris</h2>
            <p>Paris is the capital of France.</p>
        </div>
        
       

    </div>
</asp:Content>
