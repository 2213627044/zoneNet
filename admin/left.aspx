<%@ Page Language="C#" AutoEventWireup="true" CodeFile="left.aspx.cs" Inherits="admin_left" %>

<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>左导航</title>
    <link rel="stylesheet" type="text/css" href="../Styles/left.css" />
</head>
<body>
    <div id="LoginName" runat="server" style="margin:10px 0px 0px 5px;"></div>
    <div class="wmenu" id="div1">
        <dl>
            <dt id="dt1" runat="server" visible="false"> <a href="taskList.aspx" target="mainframe">业务处理</a></dt>
            <dt id="dt2" runat="server" visible="false"> <a href="#">业务管理</a></dt>
            <dd id="dd2" runat="server" visible="false"><a href="applyManage.aspx" target="mainframe">&gt;&gt;业务列表</a></dd>
            <dd id="dd3" runat="server" visible="false"><a href="statistics.aspx" target="mainframe">&gt;&gt;业务统计</a></dd>
        </dl>
    </div>
    <div class="wmenu" id="div2">
        <dl>
            <dt id="dt3" runat="server" visible="false"><a href="../info_list.aspx" target="mainframe">业务资讯</a></dt>
            <dt id="dt4" runat="server" visible="false"><a href="NewsEdit/asp.net/NewsList.aspx" target="mainframe">资讯管理</a></dt>
        </dl>
    </div>
    <div class="wmenu" id="div3">
        <dl>
            <dt><a href="#">系统管理</a></dt>
            <dd id="dd1" runat="server" visible="false"><a href="UserList.aspx" target="mainframe">&gt;&gt;用户管理</a></dd>
            <dd><a href="../password_change.aspx" target="mainframe">&gt;&gt;修改密码</a></dd>
            <dd><a href="../quit.aspx" target="_parent">&gt;&gt;退出系统</a></dd>
        </dl>
    </div>
    <script type="text/javascript" src="../Scripts/jquery-1.4.1.min.js"></script>
    <script type="text/javascript">
        $('.wmenu dl dt').click(function () {
           // $(this).toggleClass('icotop');
            $(this).siblings('dd').toggleClass('hidden');
        });
    </script>
</body>
</html>