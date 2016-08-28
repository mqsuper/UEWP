<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UEWP.Pages.Login" %>

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
            <h2>登录</h2>
        </div>
        <form id="form1" runat="server" class="w3-container">
          
            <label class="w3-label w3-text-teal w3-left"><b>邮箱</b></label>
            <input class="w3-input w3-border w3-light-grey" type="text"  runat="server" id="txtUserEmail" />
            <label class="w3-label w3-text-teal w3-left"><b>密码</b></label>
            <input class="w3-input w3-border w3-light-grey" type="text"  runat="server" id="txtUserPWD" />
          <br />
            <asp:Button ID="btnRegister" runat="server"  Text="登录" class="w3-btn w3-blue-grey"  />
            <a  href="register.aspx" class=" w3-text-blue">注册</a>
             
            
        </form>
    </div>
        </center>
</body>
</html>
