<%@ Page Language="C#" AutoEventWireup="true" CodeFile="statistics.aspx.cs" Inherits="statistics" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="../Scripts/WebCalendar.js" charset="GBK"></script>
    <style type="text/css">
        table.gridtable {
            margin: 0px auto;
            width: 750px;
            font-family: verdana,arial,sans-serif;
            font-size: 15px;
            color: #333333;
            border-width: 1px;
            border-color: #666666;
            border-collapse: collapse;
        }

            table.gridtable th {
                border-width: 1px;
                padding: 8px;
                border-style: solid;
                border-color: #666666;
                background-color: #dedede;
            }

            table.gridtable td {
                border-width: 1px;
                padding: 8px;
                border-style: solid;
                border-color: #666666;
                background-color: #ffffff;
                text-align: center;
            }
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div style="width: 750px; margin-top: 30px; margin-left: auto; margin-right: auto; margin-bottom: 10px; text-align: left; font-size: 15px;">
                <p style="text-align: center; font-size: 20px; font-family: 'Microsoft YaHei'">受理情况统计</p>
                时间段：<input type="text" placeholder="" name="startTime" value="" maxlength="100" id="Text1" runat="server" onclick="SelectDate(this,'yyyy-MM-dd')" readonly="true" style="width: 90px; cursor: pointer" />
                至
                <input type="text" placeholder="" name="startTime" value="" maxlength="100" id="Text2" runat="server" onclick="SelectDate(this,'yyyy-MM-dd')" readonly="true" style="width: 90px; cursor: pointer" />
                <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click" />
            </div>
            <table class="gridtable">
                <tr>
                    <th>待办</th>
                    <th>办理中</th>
                    <th>结案</th>
                    <th>合计</th>
                </tr>
                <tr>
                    <td><span id="span1" runat="server"></span></td>
                    <td><span id="span2" runat="server"></span></td>
                    <td><span id="span3" runat="server"></span></td>
                    <td><span id="span4" runat="server"></span></td>
                </tr>
            </table>
        </div>
        <div>
            <div style="width: 750px; margin-top: 60px; margin-left: auto; margin-right: auto; margin-bottom: 10px; text-align: left; font-size: 15px;">
                <p style="text-align: center; font-size: 20px; font-family: 'Microsoft YaHei'">问题类别统计</p>
                时间段：<input type="text" placeholder="" name="startTime" value="" maxlength="100" id="Text3" runat="server" onclick="SelectDate(this,'yyyy-MM-dd')" readonly="true" style="width: 90px; cursor: pointer" />
                至
                <input type="text" placeholder="" name="startTime" value="" maxlength="100" id="Text4" runat="server" onclick="SelectDate(this,'yyyy-MM-dd')" readonly="true" style="width: 90px; cursor: pointer" />
                <asp:Button ID="Button2" runat="server" Text="查询" OnClick="Button2_Click" />
            </div>
            <div id="div1" runat="server"></div>
        </div>
    </form>
</body>
</html>
