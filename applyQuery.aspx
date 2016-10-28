<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applyQuery.aspx.cs" Inherits="applyQuery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="~/Styles/table.css" rel="stylesheet" />

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource runat="server" ID="zoneNet1"></asp:SqlDataSource>
        <asp:SqlDataSource runat="server" ID="zoneNet2"></asp:SqlDataSource>
        <div style="margin: 0px 0px; max-width: 1280px;">
            <div style="margin: 5px auto; width: 700px;">
                <h2>办理情况</h2>
            </div>
            <div style="margin: 5px auto; width: 700px;">
                <table>
                    <tr class="tr1">
                        <td class="td1">问题类别：</td>
                        <td class="td2">
                            <asp:Label ID="Q01" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr class="tr1">
                        <td class="td1">标题：</td>
                        <td class="td2">
                            <asp:Label ID="B03" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr class="tr1">
                        <td class="td1">提交时间：</td>
                        <td class="td2">
                            <asp:Label ID="B05" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr class="tr1">
                        <td class="td1">内容：</td>
                        <td class="td2">
                            <textarea id="B04" style="width: 580px; height: 100px;" runat="server" readonly="readonly" class="text"></textarea></td>
                    </tr>
                    <tr class="tr1">
                        <td class="td1">提交附件：</td>
                        <td class="td2">
                            <asp:Repeater ID="Repeater1" runat="server">
                                <HeaderTemplate>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <p><a href="/upfile/<%#DataBinder.Eval(Container.DataItem, "F02")%>" target="_blank"><%#DataBinder.Eval(Container.DataItem, "F05")%></a></p>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:Repeater>
                        </td>
                    </tr>
                    <tr class="tr1">
                        <td class="td1">处理状态：</td>
                        <td class="td2">
                            <asp:Label ID="C01" runat="server" Text=""></asp:Label></td>
                    </tr>
                </table>

                <div id="div2" runat="server">
                    <table>
                        <tr class="tr1">
                            <td class="td1">回复时间：</td>
                            <td class="td2">
                                <asp:Label ID="B11" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr class="tr1">
                            <td class="td1">回复内容：</td>
                            <td class="td2">
                                <textarea id="B10" style="width: 580px; height: 100px;" runat="server" readonly="readonly"></textarea></td>
                        </tr>
                        <tr class="tr1">
                            <td class="td1">回复附件：</td>
                            <td class="td2">
                                <asp:Repeater ID="Repeater2" runat="server">
                                    <HeaderTemplate>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <p><a href="../upfile/<%#DataBinder.Eval(Container.DataItem, "F02")%>" target="_blank"><%#DataBinder.Eval(Container.DataItem, "F05")%></a></p>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="margin: 10px auto; width: 50px;">
                    <input id="Button1" type="button" value="返回" onclick="javascript: history.back();" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
