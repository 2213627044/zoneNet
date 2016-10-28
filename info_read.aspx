<%@ Page Language="C#" AutoEventWireup="true" CodeFile="info_read.aspx.cs" Inherits="info_read" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="Styles/Site.css" type="text/css" />
    <link rel="stylesheet" href="Styles/base.css" type="text/css" />
    <title>正文</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin: 30px auto; width: 748px;">
            <div class="zcgh newsArticle fl article_h">
                <h2 id="title1" runat="server"></h2>
                <div class="aside" id="title2" runat="server">
                </div>
                <div class="article" id="content" runat="server">
                </div>
            </div>
            <div style="margin: 5px auto; width: 50px;">
                <input id="Button1" type="button" value="返回" onclick="javascript: history.back();" />
            </div>

        </div>

    </form>
</body>
</html>
