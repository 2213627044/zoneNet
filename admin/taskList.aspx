<%@ Page Language="C#" AutoEventWireup="true" CodeFile="taskList.aspx.cs" Inherits="admin_taskList" %>

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
        <div style="margin: 30px auto; width: 700px;">
            <table border="0" cellpadding="0" cellspacing="1" class="baseTable">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <HeaderTemplate>
                            <tr class="text">
                                <th style="width:100px;" ">问题类别</th>
                                <th style="width:200px;">标题</th>
                                <th style="width:100px;">提交时间</th>
                                <th style="width:100px;">处理状态</th>
                                <th style="width:100px;">操作</th>
                            </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr style="text-align:center;"  >
                                <td style="width:100px;"><%#DataBinder.Eval(Container.DataItem, "Q01")%></td>
                                <td style="width:200px;"><%#DataBinder.Eval(Container.DataItem, "B03")%></td>
                                <td style="width:100px;"><%#string.Format("{0:g}",DataBinder.Eval(Container.DataItem, "B05"))%></td>
                                <td style="width:100px;"><%#DataBinder.Eval(Container.DataItem, "D03").ToString()=="0"?"结案":DataBinder.Eval(Container.DataItem, "D03").ToString()==Session["user_id"].ToString()?"待办":"已办"%></td>
                                <td style="width:100px;" valign="middle">
                                    <a href="taskHandle.aspx?id=<%#DataBinder.Eval(Container.DataItem, "B00")%>&m=<%#DataBinder.Eval(Container.DataItem, "D03").ToString()=="0"?"1":DataBinder.Eval(Container.DataItem, "D03").ToString()==Session["user_id"].ToString()?"0":"1"%>" target="_self"><%#DataBinder.Eval(Container.DataItem, "D03").ToString()=="0"?"查看":DataBinder.Eval(Container.DataItem, "D03").ToString()==Session["user_id"].ToString()?"处理":"查看"%></a>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:Repeater>
                    <tr style="text-align:center;" >
                        <td>
                           
                        </td>
                        <td colspan="6">
                            <webdiyer:AspNetPager ID="AspNetPager1" runat="server" HorizontalAlign="Center" OnPageChanged="AspNetPager1_PageChanged"
                                Width="100%" PageSize="10" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PrevPageText="上一页"
                                ShowMoreButtons="true" ShowPageIndexBox="Auto" UrlPaging="True" AlwaysShow="true">
                            </webdiyer:AspNetPager>
                        </td>
                    </tr>

            </table>
        </div>
    </form>
</body>
</html>