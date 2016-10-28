<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserList.aspx.cs" Inherits="admin_UserList" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="../Styles/table.css" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript">
        function delete_confirm(e) {
            if (event.srcElement.outerText == "删除") {
                event.returnValue = confirm("删除是不可恢复的，你确认要删除吗？");
            }
        }
        document.onclick = delete_confirm;
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource runat="server" ID="zoneNet1" OnSelected="zoneNet1_Selected"></asp:SqlDataSource>
            <div style="margin: 30px auto; width: 800px;">
            <table border="0" cellpadding="0" cellspacing="1" class="baseTable" style="width:800px;">
                <tbody>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <HeaderTemplate>
                            <tr class="text">
                                <th style= "width:110px;">用户类别</th>
                                <th style= "width:70px;">账号</th>
                                <th style= "width:70px;">姓名</th>
                                <th style= "width:260px;">单位</th>
                                <th style= "width:100px;">固话</th>
                                <th style= "width:100px;">手机</th>
                                <th style= "width:80px;">处理</th>
                            </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr style="text-align:center;" class="text">
                                <td style= "width:110px;"><%#DataBinder.Eval(Container.DataItem, "A01")%></td>
                                <td style= "width:70px;"><%#DataBinder.Eval(Container.DataItem, "U02")%></td>
                                <td style= "width:70px;"><%#DataBinder.Eval(Container.DataItem, "U04")%></td>
                                <td style= "width:260px;"><%#DataBinder.Eval(Container.DataItem, "U05")%></td>
                                <td style= "width:100px;"><%#DataBinder.Eval(Container.DataItem, "U07")%></td>
                                <td style= "width:100px;"><%#DataBinder.Eval(Container.DataItem, "U08")%></td>
                                <td style= "width:80px;text-align:center;">
                                    <a href="UserEdit.aspx?id=<%#DataBinder.Eval(Container.DataItem, "U00")%>" target="_self">修改</a>
                                    <a href="UserList.aspx?m=2&id=<%#DataBinder.Eval(Container.DataItem, "U00")%>">删除</a>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:Repeater>

                    <tr style="text-align: center;" class="text">
                        <td>
                            <a href="UserEdit.aspx">新增</a>
                        </td>
                        <td colspan="6">
                            <webdiyer:AspNetPager ID="AspNetPager1" runat="server" HorizontalAlign="Center" OnPageChanged="AspNetPager1_PageChanged"
                                Width="100%" PageSize="10" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PrevPageText="上一页"
                                ShowMoreButtons="true" ShowPageIndexBox="Auto" UrlPaging="True" AlwaysShow="true">
                            </webdiyer:AspNetPager>
                        </td>
                    </tr>
                </tbody>
            </table>
            <br />

        </div>
    </form>
</body>
</html>
