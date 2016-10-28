<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applyHandle.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="admin_applyHandle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../Styles/table.css" rel="stylesheet" />
<%--    <link href="../Styles/clearbox.css" rel="stylesheet" />
    <script src="../Scripts/clearbox.js"></script>--%>
    <script type="text/javascript">
        function del(id) {
            var a = PageMethods.del(id);
            $get('Button2').click();
        }
    </script>
    <style type="text/css">
        #exchage {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 200px;
            height: 100px;
            margin-top: -50px;
            margin-left: -100px;
            border: 1px solid red;
            line-height: 30px;
            font-size: 16px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <asp:SqlDataSource runat="server" ID="zoneNet1"></asp:SqlDataSource>
        <asp:SqlDataSource runat="server" ID="zoneNet2"></asp:SqlDataSource>
        <asp:SqlDataSource runat="server" ID="zoneNet3"></asp:SqlDataSource>
        <div style="margin: 30px auto; width: 700px;">
            <table>
                <tr class="tr1">
                    <td class="td1">单位：</td>
                    <td class="td2">
                        <asp:Label ID="U05" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr class="tr1">
                    <td class="td1">联系人：</td>
                    <td class="td2">
                        <asp:Label ID="U04" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr class="tr1">
                    <td class="td1">职务：</td>
                    <td class="td2">
                        <asp:Label ID="U06" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr class="tr1">
                    <td class="td1">固话：</td>
                    <td class="td2">
                        <asp:Label ID="U07" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr class="tr1">
                    <td class="td1">手机：</td>
                    <td class="td2">
                        <asp:Label ID="U08" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr class="tr1">
                    <td class="td1">问题类别：</td>
                    <td class="td2">
                    <asp:DropDownList ID="B02" runat="server"></asp:DropDownList></td>
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
                        <textarea id="B04" style="width: 500px; height: 50px;" runat="server" readonly="readonly"></textarea></td>
                </tr>
                <tr class="tr1">
                    <td class="td1">提交附件：</td>
                    <td class="td2">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <HeaderTemplate>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <a href="/upfile/<%#DataBinder.Eval(Container.DataItem, "F02")%>" target="_blank"><%#DataBinder.Eval(Container.DataItem, "F05")%></a><br />
                            </ItemTemplate>
                            <FooterTemplate>
                            </FooterTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
                <tr class="tr1">
                    <td class="td1">处理过程：</td>
                    <td class="td2">
                       <asp:Repeater ID="Repeater3" runat="server">
                            <HeaderTemplate>
                            </HeaderTemplate>
                            <ItemTemplate>
                              <p> 
                                  <%#DataBinder.Eval(Container.DataItem, "D04")%>&nbsp;&nbsp;<span style="color:#335EA8;"><%#DataBinder.Eval(Container.DataItem, "U04")%>&nbsp;<%#string.Format("{0:g}",DataBinder.Eval(Container.DataItem, "D05"))%></span>
                              </p> 
                            </ItemTemplate>
                            <FooterTemplate>
                            </FooterTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
               <tr class="tr1">
                    <td class="td1">当前经办人：</td>
                    <td class="td2">
                        <asp:Label ID="D03" runat="server" Text=""></asp:Label></td>
                </tr>                <tr class="tr1">
                    <td class="td1">回复时间：</td>
                    <td class="td2">
                        <asp:Label ID="B11" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr class="tr1">
                    <td class="td1">回复内容：</td>
                    <td class="td2">
                        <textarea id="B10" style="width: 500px; height: 50px;" runat="server"></textarea></td>
                </tr>
                <tr class="tr1">
                    <td class="td1">内部备注：</td>
                    <td class="td2">
                        <textarea id="B12" style="width: 500px; height: 50px;" runat="server"></textarea></td>
                </tr>
                <tr class="tr1">
                    <td class="td1">回复附件：</td>
                    <td class="td2">
                        <div id="iframe1" runat="server">
                            <iframe src="Upfile.aspx" marginwidth="0" marginheight="0" frameborder="0" style="width: 430px; height: 65px;" scrolling="no"></iframe>
                        </div>
                        <asp:Repeater ID="Repeater2" runat="server">
                            <HeaderTemplate>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <a href="../upfile/<%#DataBinder.Eval(Container.DataItem, "F02")%>" target="_blank"><%#DataBinder.Eval(Container.DataItem, "F05")%></a>
                                <%if (Request.QueryString["m"] ==null||Request.QueryString["m"] == "0") { %>
                                <a href="#" onclick="del(<%#DataBinder.Eval(Container.DataItem, "F00")%>);return false;">删除</a>
                                <%} %>
                                <br />
                            </ItemTemplate>
                            <FooterTemplate>
                            </FooterTemplate>
                        </asp:Repeater>
                        <asp:Label ID="Label1" runat="server" Text="传值upfile.aspx" Style="display: none;"></asp:Label>
                        <asp:Button ID="Button2" runat="server" Text="删除刷新" OnClick="Button2_Click" Style="display: none;" />
                    </td>
                </tr>
                <tr class="tr1" id="exChange" runat="server">
                    <td class="td1">流转：</td>
                    <td class="td2">
                        <asp:DropDownList ID="U00" runat="server" AppendDataBoundItems="true">
                            <asp:ListItem Value="0">请选择</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;流转意见：<textarea id="D04" runat="server" style="width:340px; height: 50px;"></textarea> &nbsp;<asp:Button ID="Button3" runat="server" Text="发送" OnClick="Button3_Click" />

                    </td>
                </tr>

            </table>
            <div style="width: 180px; margin: 5px auto;">
                <asp:Button ID="Button4" runat="server" Text="保存" OnClick="Button4_Click" />&nbsp;
                <asp:Button ID="Button1" runat="server" Text="提交结案" OnClick="Button1_Click" />
            </div>
        </div>

    </form>
</body>
</html>
