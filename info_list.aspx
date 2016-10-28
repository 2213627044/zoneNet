<%@ Page Language="C#" AutoEventWireup="true" CodeFile="info_list.aspx.cs" Inherits="list" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="Styles/Site.css" type="text/css" />
    <link rel="stylesheet" href="Styles/base.css" type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource runat="server" ID="zoneNet1"></asp:SqlDataSource>
        <asp:SqlDataSource runat="server" ID="zoneNet2"></asp:SqlDataSource>
        <asp:SqlDataSource runat="server" ID="zoneNet3"></asp:SqlDataSource>
        <asp:SqlDataSource runat="server" ID="zoneNet4"></asp:SqlDataSource>
        <div class="infolist" style="margin: 10px 0px; min-width:800px;max-width:1280px;">
            <div class="newsBox heightLim fl">
                <div class="newsBoxT">
                    <em id="Em1" runat="server"></em>
                    <a id="A1" runat="server">更多&gt;&gt;</a>
                </div>
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
                </ul>
            </div>
            <div class="newsBox heightLim fl">
                <div class="newsBoxT">
                    <em id="Em2" runat="server"></em>
                    <a id="A2" runat="server">更多&gt;&gt;</a>
                </div>
                <ul>
                    <asp:Repeater ID="Repeater2" runat="server">
                        <HeaderTemplate>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>
                                <p><a href="info_read.aspx?id=<%#DataBinder.Eval(Container.DataItem, "I00")%>" title="<%#DataBinder.Eval(Container.DataItem, "I02")%> "target="_self"><font color=''><%# DataBinder.Eval(Container.DataItem, "I02")%></font></a></p>
                                <span><%# string.Format("{0:d}",DataBinder.Eval(Container.DataItem, "I06"))%></span>
                            </li>
                        </ItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:Repeater>
                </ul>
            </div>
            <div class="newsBox heightLim fl">
                <div class="newsBoxT">
                    <em id="Em3" runat="server"></em>
                    <a id="A3" runat="server">更多&gt;&gt;</a>
                </div>
                <ul>
                    <asp:Repeater ID="Repeater3" runat="server">
                        <HeaderTemplate>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>
                                <p><a href="info_read.aspx?id=<%#DataBinder.Eval(Container.DataItem, "I00")%>" title="<%#DataBinder.Eval(Container.DataItem, "I02")%> "target="_self"><font color=''><%# DataBinder.Eval(Container.DataItem, "I02")%></font></a></p>
                                <span><%# string.Format("{0:d}",DataBinder.Eval(Container.DataItem, "I06"))%></span>
                            </li>
                        </ItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:Repeater>
                </ul>
            </div>
            <div class="newsBox heightLim fl">
                <div class="newsBoxT">
                    <em id="Em4" runat="server"></em>
                    <a id="A4" runat="server">更多&gt;&gt;</a>
                </div>
                <ul>
                    <asp:Repeater ID="Repeater4" runat="server">
                        <HeaderTemplate>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>
                                <p><a href="info_read.aspx?id=<%#DataBinder.Eval(Container.DataItem, "I00")%>" title="<%#DataBinder.Eval(Container.DataItem, "I02")%> "target="_self"><font color=''><%# DataBinder.Eval(Container.DataItem, "I02")%></font></a></p>
                                <span><%# string.Format("{0:d}",DataBinder.Eval(Container.DataItem, "I06"))%></span>
                            </li>
                        </ItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </div>
    </form>
</body>
</html>
