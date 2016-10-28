<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applylist.aspx.cs" Inherits="applylist" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="~/Styles/table.css" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource runat="server" ID="zoneNet1" OnSelected="zoneNet1_Selected"></asp:SqlDataSource>
        <div style="margin :0px 0px;max-width:1280px;">
            <div style="margin: 5px auto; width: 700px;">
                <h2>我的咨询</h2>
            </div>
            <div style="margin: 5px auto; width: 700px; text-align: center;">
                <table border="0" cellpadding="0" cellspacing="1" class="baseTable">
                    <tbody>
                        <asp:Repeater ID="Repeater1" runat="server">
                            <HeaderTemplate>
                                <tr class="text">
                                    <th width="100">问题类别</th>
                                    <th width="200">标题</th>
                                    <th width="100">提交时间</th>
                                    <th width="100">处理状态</th>
                                    <th width="100">操作</th>
                                </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr align="center" class="text">
                                    <td width="100"><%#DataBinder.Eval(Container.DataItem, "Q01")%></td>
                                    <td width="200"><%#DataBinder.Eval(Container.DataItem, "B03")%></td>
                                    <td width="100"><%#DataBinder.Eval(Container.DataItem, "B05")%></td>
                                    <td width="100"><%#DataBinder.Eval(Container.DataItem, "C01")%></td>
                                    <td width="120" valign="middle">
                                        <a href="applyQuery.aspx?id=<%#DataBinder.Eval(Container.DataItem, "B00")%>" target="_self">查看</a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                            </FooterTemplate>
                        </asp:Repeater>

                        <tr align="center" class="text">
                            <td>
                                <a href="apply.aspx">新增</a>
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
            </div>
        </div>
    </form>
</body>
</html>
