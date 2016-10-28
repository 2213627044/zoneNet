<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeFile="NewsEdit.aspx.cs" Inherits="NewsEdit" %>

<!doctype html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>KindEditor ASP.NET</title>
    <link rel="stylesheet" href="../themes/default/default.css" />
    <link rel="stylesheet" href="../plugins/code/prettify.css" />
    <script charset="utf-8" src="../kindeditor.js"></script>
    <script charset="utf-8" src="../lang/zh_CN.js"></script>
    <script charset="utf-8" src="../plugins/code/prettify.js"></script>
    <script>
        KindEditor.ready(function (K) {
            var editor1 = K.create('#I03', {
                cssPath: '../plugins/code/prettify.css',
                uploadJson: '../asp.net/upload_json.ashx',
                fileManagerJson: '../asp.net/file_manager_json.ashx',
                allowFileManager: true,
                afterCreate: function () {
                    var self = this;
                    K.ctrl(document, 13, function () {
                        self.sync();
                        K('form[name=TableInfo]')[0].submit();
                    });
                    K.ctrl(self.edit.doc, 13, function () {
                        self.sync();
                        K('form[name=TableInfo]')[0].submit();
                    });
                }
            });
            prettyPrint();
        });
    </script>
</head>
<body>
    <div style="margin: 30px auto; width: 700px;">

        <form id="TableInfo" runat="server">
            类别：<asp:DropDownList ID="I01" runat="server" AppendDataBoundItems="True">
                <asp:ListItem Value="0">请选择</asp:ListItem>
            </asp:DropDownList><span style="color:red;">&nbsp;*</span>
            <p>
                标题：<asp:TextBox ID="I02" runat="server" Width="500px"></asp:TextBox><span style="color:red;">&nbsp;*</span>
            <p>
                <textarea id="I03" cols="100" rows="8" style="width: 700px; height: 400px; visibility: hidden;" runat="server"></textarea><span style="color:red;">&nbsp;*</span>
                <br />
                <asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click" />
        </form>
    </div>
</body>
</html>
