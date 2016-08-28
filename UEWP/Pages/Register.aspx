<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="UEWP.Pages.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../CSS/W3/W3.css" rel="stylesheet" />
</head>
<body>
    <center>
    <div class="w3-container " style="max-width: 600px;">
        <div class="w3-container w3-teal">
            <h2>注册</h2>
        </div>
        <form id="form1" runat="server" class="w3-container">
          

            <label class="w3-label w3-text-teal w3-left"><b>姓名</b></label>
            <input class="w3-input w3-border w3-light-grey" type="text" runat="server" id="txtUserName" />

            <label class="w3-label w3-text-teal w3-left"><b>邮箱</b></label>
            <input class="w3-input w3-border w3-light-grey" type="text"  runat="server" id="txtUserEmail" />
            <label class="w3-label w3-text-teal w3-left"><b>企业名称</b></label>
            <input class="w3-input w3-border w3-light-grey" type="text"  runat="server" id="txtCompanyName" />
            <label class="w3-label w3-text-teal w3-left"><b>企业电话</b></label>
            <input class="w3-input w3-border w3-light-grey" type="text"  runat="server" id="txtCompanyPhone" />
            <label class="w3-label w3-text-teal w3-left"><b>企业地址</b></label>
            <textarea class="w3-input w3-border w3-light-grey"  runat="server" id="txtCompanyAddress" ></textarea>      
            <br />    
            <asp:Button ID="btnRegister" runat="server"  Text="注册" class="w3-btn w3-blue-grey" OnClick="btnRegister_Click" />
            
        </form>
    </div>
        </center>
</body>
</html>
