<%@ Page Language="C#" %>

<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Web.Services" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="Styles/upload.css" rel="stylesheet" />
    <script runat="server">

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //用户登录验证
                pyrc.zoneNet login = new pyrc.zoneNet();
                //login.tempsession();//测试用
                login.loginCheck();
                login.authority(1);
            }
        }
        [WebMethod]
        public static bool savePic(string tmpId, string picName, string disName)
        {
            SqlConnection sqlconn = new SqlConnection();
            sqlconn.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sqlconn;
            cmd.CommandText = "insert into [dbo].[TableUpfile](F02,F03,F04,F05,F07) values(@F02,@F03,@F04,@F05,0)";
            cmd.Parameters.AddWithValue("@F02", picName);
            cmd.Parameters.AddWithValue("@F03", DateTime.Now);
            cmd.Parameters.AddWithValue("@F04", tmpId);
            cmd.Parameters.AddWithValue("@F05", disName);
            sqlconn.Open();
            SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);//执行SQL语句
            reader.Close();//关闭执行
            return true;
        }

    </script>
    <style type="text/css">
        BODY {
            font-family: Arial, Sans-Serif;
            font-size: 12px;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="scriptManager" runat="server" EnablePageMethods="true" />

        <script type="text/javascript">

            var intervalID = 0;
            var fileUpload;
            var form;

            // 注册表单       
            function register(form, fileUpload) {
                this.form = form;
                this.fileUpload = fileUpload;
            }

            function onComplete(type, msg) {
                // 重新启用按钮
                $get('upload').disabled = '';
                $get('status').innerText = msg;
                if (type == 'parent') {
                    var b = $get('picName').value;
                    var c = $get('disName').value;
                    var a = window.parent.document.getElementById('Label1').innerText;
                    var d = PageMethods.savePic(a, b, c);
                    window.parent.document.getElementById('Button2').click();
                }
            }

            function setValue(obj, v) {
                $get(obj).value = v;
            }
            function alertMsg(e) {
                alert(e);
                location.reload();
            }
            function formSubmit() {
                if (window.parent.document.getElementById('B02').value == '0') {
                    alert('请选择类别！');
                    return false;
                }
                if (window.parent.document.getElementById("B03").textContent = '') {
                    alert('请输入标题！');
                    return false;
                }
                $get('upload').disabled = 'disabled';
                $get('status').innerText = '正在上传中...';
                form.submit();
            }

        </script>


        <div class="upload">
            <div>
                <iframe id="uploadFrame" frameborder="0" scrolling="no" src="Upload.aspx" width="60px;"></iframe>

                <div id="status" style="display: none;">请选择要上传的文件</div>
                <div id="commands">
                    <input id="upload" type="button" value="上传" onclick="formSubmit();" />
                </div>

            </div>
        </div>


        <div style="visibility: hidden; height: 1px;">
            <input id="picName" type="text" value="" style="height: 1px;" />
            <input id="disName" type="text" value="" style="height: 1px;" />
        </div>
    </form>
</body>
</html>
