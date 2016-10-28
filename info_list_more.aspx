<%@ Page Language="C#" AutoEventWireup="true" CodeFile="info_list_more.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="Styles/Site.css" type="text/css" />
    <link rel="stylesheet" href="Styles/base.css" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource runat="server" ID="zoneNet1" OnSelected="zoneNet1_Selected"></asp:SqlDataSource>

        <div style="margin: 30px auto; width: 600px;">
            <div class="xczp_right fr">
                <div class="newsBoxT" style="text-align: left;">
                    <em id="infoType" runat="server"></em>
                </div>

                <div class="newsLists">
                    <ul>
                        <asp:Repeater ID="Repeater1" runat="server">
                            <HeaderTemplate>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li>
                                    <p><a href="info_read.aspx?id=<%#DataBinder.Eval(Container.DataItem, "I00")%>" title="<%#DataBinder.Eval(Container.DataItem, "I02")%> " target="_self"><font color=''><%# DataBinder.Eval(Container.DataItem, "I02")%></font></a></p>
                                    <span><%# string.Format("{0:d}",DataBinder.Eval(Container.DataItem, "I06"))%></span>
                                </li>
                            </ItemTemplate>
                            <FooterTemplate>
                            </FooterTemplate>
                        </asp:Repeater>
                        <br />
                        <webdiyer:AspNetPager ID="AspNetPager1" runat="server" HorizontalAlign="Center" OnPageChanged="AspNetPager1_PageChanged"
                            Width="100%" PageSize="10" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PrevPageText="上一页"
                            ShowMoreButtons="true" ShowPageIndexBox="Auto" UrlPaging="True" AlwaysShow="true">
                        </webdiyer:AspNetPager>
                        <br />
                    </ul>

                    <div class="aCoverLine2"></div>

                </div>

            </div>
        </div>
    </form>
</body>
</html>
