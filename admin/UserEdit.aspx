<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserEdit.aspx.cs" Inherits="admin_UserEdit"  MaintainScrollPositionOnPostback="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../Styles/table.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin: 30px auto; width: 350px;">
            <table style="width:350px;">
                <tr class="tr1">
                    <td class="td1">用户类别：</td>
                    <td class="td2">
                        <asp:DropDownList ID="U16" runat="server" AppendDataBoundItems="true">
                            <asp:ListItem Value="0">请选择</asp:ListItem>
                        </asp:DropDownList><span style="color:red;">&nbsp;*</span>
                    </td>
                </tr>
                <tr class="tr1">
                    <td class="td1">姓名：</td>
                    <td class="td2">
                        <asp:TextBox ID="U04" runat="server"></asp:TextBox><span style="color:red;">&nbsp;*</span></td>
                </tr>
                <tr class="tr1">
                    <td class="td1">账号：</td>
                    <td class="td2">
                        <asp:TextBox ID="U02" runat="server"></asp:TextBox><span style="color:red;">&nbsp;*</span></td>
                </tr>
                <tr class="tr1">
                    <td class="td1">密码：</td>
                    <td class="td2">
                        <asp:TextBox ID="U03" runat="server"></asp:TextBox><span style="color:red;">&nbsp;*</span><asp:Label ID="Label1" runat="server" Text="密码为空时默认不作修改" Visible="False" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr class="tr1">
                    <td class="td1">单位：</td>
                    <td class="td2">
                        <asp:TextBox ID="U05" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="tr1">
                    <td class="td1">职务：</td>
                    <td class="td2">
                        <asp:TextBox ID="U06" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="tr1">
                    <td class="td1">固话：</td>
                    <td class="td2">
                        <asp:TextBox ID="U07" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="tr1">
                    <td class="td1">手机：</td>
                    <td class="td2">
                        <asp:TextBox ID="U08" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="tr1">
                    <td class="td1">传真：</td>
                    <td class="td2">
                        <asp:TextBox ID="U09" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="tr1">
                    <td class="td1">邮箱：</td>
                    <td class="td2">
                        <asp:TextBox ID="U10" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="tr1">
                    <td class="td1">QQ：</td>
                    <td class="td2">
                        <asp:TextBox ID="U11" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="tr1">
                    <td class="td1">地址：</td>
                    <td class="td2">
                        <asp:TextBox ID="U12" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="tr1">
                    <td class="td1">邮编：</td>
                    <td class="td2">
                        <asp:TextBox ID="U13" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="tr1">
                    <td class="td1">备注：</td>
                    <td class="td2">
                        <textarea id="U15" style="width: 143px; height: 50px;" runat="server"></textarea></td>
                </tr>
                <tr class="tr1">
                    <td class="td1"></td>
                    <td class="td2">
                        <asp:Button ID="Button1" runat="server" Text="保存" OnClick="Button1_Click" /></td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
