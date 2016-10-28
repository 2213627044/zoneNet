<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="password_change.aspx.cs" Inherits="password_change" %>

<html>
<head>
    <title>修改密码</title>
    <link href="Styles/dntmanager.css" rel="stylesheet" type="text/css" />

    <meta http-equiv="X-UA-Compatible" content="IE=7" />
</head>
<body style="background: white;">
    <form id="Form1" method="post" runat="server">
        <div style="margin: 0px 0px; max-width: 1280px;">
            <div style="width: 450px; margin: 50px auto; overflow: hidden;">
                <ul>
                    <li class="LoginTop">
                        <img src="Images/login-top.gif" /></li>
                    <li class="FormNav">
                        <dl>
                            <dd>
                                <label>原密码:</label><asp:TextBox ID="password_old" runat="server" TextMode="Password" size="20" Width="150"></asp:TextBox></dd>
                            <dd>
                                <label>新密码:</label><asp:TextBox ID="password_new" runat="server" TextMode="Password" size="20" Width="150"></asp:TextBox></dd>
                            <dd>
                                <label>确　认:</label><asp:TextBox ID="password_confirm" runat="server" TextMode="Password" size="20" Width="150"></asp:TextBox>
                                <asp:Label ID="Label1" runat="server" Text="" ForeColor="#ff0000"></asp:Label></dd>
                            <dd>
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="修改" Style="width: 60px; height: 26px; cursor: pointer; margin-left: 65px;" /></dd>
                        </dl>
                    </li>
                    <li>
                        <img src="Images/login-bottom.gif" /></li>
                </ul>
            </div>
        </div>
    </form>
</body>
</html>
