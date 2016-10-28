<%@ Page Language="C#" AutoEventWireup="true" CodeFile="apply.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="apply" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Styles/table.css" rel="stylesheet" />
<%--    <link href="Styles/clearbox.css" rel="stylesheet" />
    <script src="Scripts/clearbox.js"></script>--%>
    <script type="text/javascript">
        function del(id) {
            var a = PageMethods.del(id);
            $get('Button2').click();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <asp:SqlDataSource ID="zoneNet" runat="server"></asp:SqlDataSource>
        <div style="margin :0px 0px;max-width:1280px;">
            <div style="margin: 5px auto; width: 700px;">
                <h2>业务咨询</h2>
            </div>
            <div style="margin: 5px auto; width: 700px;">
                <table style="width: 700px;">
                    <tr class="tr1">
                        <td class="td1">问题类别：</td>
                        <td class="td2">
                            <asp:DropDownList ID="B02" runat="server" AppendDataBoundItems="true" CssClass="text">
                                <asp:ListItem Value="0">请选择</asp:ListItem>
                            </asp:DropDownList><span style="color:red;">&nbsp;*</span>
                        </td>
                    </tr>
                    <tr class="tr1">
                        <td class="td1">标题：</td>
                        <td class="td2">
                            <asp:TextBox ID="B03" runat="server" Width="530" CssClass="text"></asp:TextBox><span style="color:red;">&nbsp;*</span></td>
                    </tr>
                    <tr class="tr1">
                        <td class="td1">说明：</td>
                        <td class="td2">
                            <textarea id="B04" style="width: 530px; height: 100px;" runat="server" class="text"></textarea><span style="color:red;">&nbsp;*</span></td>
                    </tr>
                    <tr class="tr1">
                        <td class="td1">附件：</td>
                        <td class="td2">
                            <iframe src="Upfile.aspx" marginwidth="0" marginheight="0" frameborder="0" style="width: 250px; height: 65px;" scrolling="no"></iframe>
                            <asp:Repeater ID="Repeater1" runat="server">
                                <HeaderTemplate>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <br />
                                    <a href="/upfile/<%#DataBinder.Eval(Container.DataItem, "F02")%>" target="_blank"><%#DataBinder.Eval(Container.DataItem, "F05")%></a>
                                    <a href="javascript:void(0)" onclick="del(<%#DataBinder.Eval(Container.DataItem, "F00")%>)">删除</a>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:Repeater>
                        </td>
                    </tr>
                    <tr class="tr1">
                        <td class="td2" colspan="2" style="text-align: center;">
                            <asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click" /></td>
                    </tr>
                </table>
                <asp:Label ID="Label1" runat="server" Text="" Style="display: none;"></asp:Label>
                <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" Style="display: none;" />
            </div>
        </div>
    </form>
</body>
</html>
