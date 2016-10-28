<%@ Page Language="C#" EnableSessionState="ReadOnly" Async="true" %>

<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <script runat="server">

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //用户登录验证
                pyrc.zoneNet login = new pyrc.zoneNet();
                //login.tempsession();//测试用
                login.loginCheck();
                login.authority(3);
            }
            if (this.IsPostBack)
            {
                //  上传大小验证
                if (this.fileUpload.PostedFile != null && this.fileUpload.PostedFile.ContentLength > 0

                    && this.fileUpload.PostedFile.ContentLength < 1048576 * 2)//  1048576=1024*1024=1M
                {
                    //  设置路径、生成文件名
                    string path = this.Server.MapPath("~/upfile");
                    string fileName = Path.GetFileName(this.fileUpload.PostedFile.FileName);
                    Random r = new Random();
                    string aLastName = fileName.Substring(fileName.LastIndexOf("."), (fileName.Length - fileName.LastIndexOf("."))).ToLower();   //扩展名
                    string upFileName = DateTime.Now.ToString("yyyyMMddHHmmss") + r.Next(10000, 99999).ToString() + aLastName;

                    // 保存文件
                    this.fileUpload.PostedFile.SaveAs(Path.Combine(path, upFileName));
                    // 上传类型验证，需要等文件上传到服务器后才能验证
                    if (!IsAllowedExtension(Path.Combine(path, upFileName)))
                    {
                        // 删除.
                        File.Delete(Path.Combine(path, upFileName));
                        string j = "window.parent.alertMsg('不支持此类型文件上传！');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "p", j, true);
                    }
                    else
                    {
                        //   
                        string j1 = "window.parent.setValue('picName', '" + upFileName + "');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "p1", j1, true);
                        string j2 = "window.parent.setValue('disName', '" + fileName + "');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "p2", j2, true);
                        string js = "window.parent.onComplete('parent', '" + fileName + "上传成功！');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "progress", js, true);
                    }
                }
                else
                {
                    if (this.fileUpload.PostedFile.ContentLength >= 1048576 * 2)//1048576=1024*1024=1M
                    {
                        const string js = "window.parent.onComplete('error', '超出上传文件限制大小，请重新选择');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "progress", js, true);
                    }
                    else
                    {
                        const string js = "window.parent.onComplete('error', '上传文件出错');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "progress", js, true);
                    }
                }
            }
        }

        //判断文件类型
        public static bool IsAllowedExtension(string filePath)
        {
            string aLastName = filePath.Substring(filePath.LastIndexOf("."), (filePath.Length - filePath.LastIndexOf("."))).ToLower();   //扩展名
            if (aLastName == ".jpg" || aLastName == ".png" || aLastName == "jpeg" || aLastName == ".tif" || aLastName == ".tiff" || aLastName == ".pdf" || aLastName == ".doc" || aLastName == ".ppt" || aLastName == ".xls" || aLastName == ".docx" || aLastName == ".xlsx" || aLastName == ".pptx" || aLastName == ".rar" || aLastName == ".zip")
            {

                System.IO.FileStream fs = new System.IO.FileStream(filePath, System.IO.FileMode.Open, System.IO.FileAccess.Read);
                System.IO.BinaryReader r = new System.IO.BinaryReader(fs);
                string fileclass = "";
                //这里的位长要具体判断. 
                byte buffer;
                try
                {
                    buffer = r.ReadByte();
                    fileclass = buffer.ToString();
                    buffer = r.ReadByte();
                    fileclass += buffer.ToString();

                }
                catch
                {
                    throw;
                }
                r.Close();
                fs.Close();
                if (fileclass == "255216" || fileclass == "13780" || fileclass == "3780" || fileclass == "7373" || fileclass == "8075" || fileclass == "208207" || fileclass == "8297")
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
            /*文件扩展名说明
             * 255216 jpg
             * 208207 doc xls ppt wps
             * 8075 docx pptx xlsx zip
             * 5150 txt
             * 8297 rar
             * 7790 exe
             * 3780 pdf      
             * 
             * 4946/104116 txt
             * 7173        gif 
             * 255216      jpg
             * 13780       png
             * 6677        bmp
             * 239187      txt,aspx,asp,sql
             * 208207      xls.doc.ppt
             * 6063        xml
             * 6033        htm,html
             * 4742        js
             * 8075        xlsx,zip,pptx,mmap,zip
             * 8297        rar   
             * 01          accdb,mdb
             * 7790        exe,dll
             * 5666        psd 
             * 255254      rdp 
             * 10056       bt种子 
             * 64101       bat 
             * 4059        sgf    
             */

        }

    </script>
    <style type="text/css">
        BODY {
            margin: 0;
            padding: 0;
            background-color: #F0F8FF;
        }
    </style>
</head>
<body>
    <form id="form" runat="server" enctype="multipart/form-data">
        <asp:ScriptManager ID="scriptManager" runat="server" />
        <script type="text/javascript">
            function pageLoad(sender, args) {
                window.parent.register(
                    $get('<%= this.form.ClientID %>'),
                $get('<%= this.fileUpload.ClientID %>')
            );
            }
            //客户端检查上传文件类型和大小
            var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
            function fileCheck(target, id) {
                var fileSize = 0;
                var filetypes = [".jpg", ".png", "jpeg", ".tif", ".tiff", ".pdf", ".doc", ".ppt", ".xls", ".docx", ".xlsx", ".pptx", ".rar", ".zip"];
                var filepath = target.value;
                var filemaxsize = 1024 * 2;//2M 
                if (filepath) {
                    var isnext = false;
                    var fileend = filepath.substring(filepath.indexOf(".")).toLowerCase();
                    if (filetypes && filetypes.length > 0) {
                        for (var i = 0; i < filetypes.length; i++) {
                            if (filetypes[i] == fileend) {
                                isnext = true;
                                break;
                            }
                        }
                    }
                    if (!isnext) {
                        alert("不支持此类型文件上传！");
                        target.value = "";
                        return false;
                    }
                } else {
                    return false;
                }
                if (isIE && !target.files) {
                    var filePath = target.value;
                    var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
                    if (!fileSystem.FileExists(filePath)) {
                        alert("附件不存在，请重新输入！");
                        return false;
                    }
                    var file = fileSystem.GetFile(filePath);
                    fileSize = file.Size;
                } else {
                    fileSize = target.files[0].size;
                }

                var size = fileSize / 1024;
                if (size > filemaxsize) {
                    alert("附件大小不能大于" + filemaxsize / 1024 + "M！");
                    target.value = "";
                    return false;
                }
                if (size <= 0) {
                    alert("附件大小不能为0M！");
                    target.value = "";
                    return false;
                }
            }
        </script>
        <div>
            <asp:FileUpload ID="fileUpload" runat="server" Width="100%" onchange="fileCheck(this);" />
        </div>
    </form>
</body>
</html>
