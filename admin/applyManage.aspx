<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applyManage.aspx.cs" Inherits="admin_applyManage" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="../Styles/table.css" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
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
                                <th style="width: 100px;">问题类别</th>
                                <th style="width: 250px;">标题</th>
                                <th style="width: 150px;">提交时间</th>
                                <th style="width: 100px;">当前经办人</th>
                                <th style="width: 100px;">处理状态</th>
                                <th style="width: 80px;">操作</th>
                            </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr style="text-align: center;" class="text">
                                <td style="width: 100px;"><%#DataBinder.Eval(Container.DataItem, "Q01")%></td>
                                <td style="width: 250px;"><%#DataBinder.Eval(Container.DataItem, "B03")%></td>
                                <td style="width: 150px;"><%#string.Format("{0:g}",DataBinder.Eval(Container.DataItem, "B05"))%></td>
                                <td style="width: 100px;"><%#DataBinder.Eval(Container.DataItem, "U04")%></td>
                                <td style="width: 100px;"><%#DataBinder.Eval(Container.DataItem, "C01")%></td>
                                <td style="width: 80px; text-align: center;">
                                    <a href="applyHandle.aspx?id=<%#DataBinder.Eval(Container.DataItem, "B00")%>&m=<%#DataBinder.Eval(Container.DataItem, "B08").ToString()=="3"?"1":"0"%>" target="_self"><%#DataBinder.Eval(Container.DataItem, "B08").ToString()=="3"?"查看":"处理"%></a>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:Repeater>
                    <tr style="text-align: center;">
                        <td>
                            <%--<a href="apply.aspx">新增申请</a>--%>
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
    </form>
</body>
</html>
