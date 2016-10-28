<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<HTML>
<HEAD>
<title>登录</title>
<link href="Styles/dntmanager.css" rel="stylesheet" type="text/css" />

<meta http-equiv="X-UA-Compatible" content="IE=7" />
</head>
<BODY style="background:#f4f6f7;">
	<FORM id="Form1" method="post" runat="server">
	 <div id="LoginBar">
		<ul>
			<li class="LoginTop"><img src="Images/login-top.gif"/></li>
			<li class="FormNav">
				<dl>
					<dt><label>用户名:</label><asp:TextBox id="UserName" runat="server" size="20" Width="150" ></asp:TextBox>
					<dd><label>密　码:</label><asp:TextBox id="PassWord" runat="server" TextMode="Password" size="20" Width="150"></asp:TextBox>
                    <asp:Label
                            ID="Label1" runat="server" Text="" ForeColor="#ff0000"></asp:Label>
					
													
					<dd><asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="width:60px; height:26px; border:0; background:url(Images/button.gif) no-repeat left top; cursor:pointer; margin-left:65px;"/></dd>
					
				</dl>
			</li>
			<li><img src="Images/login-bottom.gif"/></li>
		</ul>
	 </div>
	 </FORM>
	
 </BODY>
</HTML>