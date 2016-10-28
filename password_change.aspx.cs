using System;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;

public partial class password_change : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //用户登录验证
            pyrc.zoneNet login = new pyrc.zoneNet();
            //login.tempsession();//测试用
            login.loginCheck();
            login.authority(1);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string EncryptPWD1 = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(this.password_old.Text.ToString(), "MD5");
        string EncryptPWD2 = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(this.password_new.Text.ToString(), "MD5");
        int id = System.Int32.Parse(Session["user_id"].ToString());
        SqlConnection sqlconn = new SqlConnection();
        sqlconn.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
        var cmd = new SqlCommand("SELECT * FROM TableUser where U00=" + id, sqlconn);
        sqlconn.Open();
        SqlDataReader read = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        if (read.Read())
        {
            if (read["U03"].ToString() == EncryptPWD1)
            {
                read.Close();
                if (this.password_new.Text == this.password_confirm.Text)
                {
                    pyrc.zoneNet login = new pyrc.zoneNet();
                    string sql = "update [TableUser] set U03=@1 where U00=@2";
                    string[] param = new string[] { sql, EncryptPWD2, id.ToString()};
                    int a = pyrc.zoneNet.sqlExecuteCmd(param);
                    Response.Write("<script>alert('提交成功!');window.location.href='password_change.aspx'</script>");
                    Response.End();
                }
                else
                {
                    this.Label1.Text = "输入密码不一致！";
                }
            }
            else
            {
                read.Close();
                this.Label1.Text = "原密码输入有误！";
            }
        }
    }
}