<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsList.aspx.cs" Inherits="NewsEdit_NewsList" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="~/Styles/table.css" type="text/css" />
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
        <div style="margin: 30px auto; width: 700px;">

            <table border="0" cellpadding="0" cellspacing="1" style="margin: 10px auto; width: 700px;" class="baseTable">
                <tbody>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <HeaderTemplate>
                            <tr class="text">
                                <th width="100">类别</th>
                                <th width="350">标题</th>
                                <th width="100">发布日期</th>
                                <th width="120">处理</th>
                            </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr align="center" class="text">
                                <td width="100"><%#DataBinder.Eval(Container.DataItem, "T01")%></td>
                                <td><%#DataBinder.Eval(Container.DataItem, "I02")%></td>
                                <td width="80"><%#DataBinder.Eval(Container.DataItem, "I06")%></td>
                                <td width="120" valign="middle">
                                    <a href="NewsEdit.aspx?id=<%#DataBinder.Eval(Container.DataItem, "I00")%>" target="_self">修改</a>
                                    <a href="NewsList.aspx?m=2&id=<%#DataBinder.Eval(Container.DataItem, "I00")%>">删除</a>
                                    <a href="../../../info_read.aspx?id=<%#DataBinder.Eval(Container.DataItem, "I00")%>" target="_self">查看</a>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:Repeater>
                    <tr class="text">
                        <td width="100" style="text-align:center"><a href="NewsEdit.aspx" target="_self">新增</a></td>
                        <td width="570" colspan="3">
                            <webdiyer:AspNetPager ID="AspNetPager1" runat="server" HorizontalAlign="Center" OnPageChanged="AspNetPager1_PageChanged"
                                Width="100%" PageSize="20" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PrevPageText="上一页"
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
