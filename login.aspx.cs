using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {      
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["user_id"] != null)
        {
            Response.Write("<script>alert('您已登录，请退出后再操作!');</script>");
            return;
        }

        Session.Clear();
        SqlConnection sqlconn = new SqlConnection();
        sqlconn.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
        var cmd = new SqlCommand("SELECT * FROM TableUser where U17=1 and U02=@02 and U03=@03", sqlconn);//U17状态码，1为有效
        cmd.Parameters.AddWithValue("@02", UserName.Text);
        cmd.Parameters.AddWithValue("@03", System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(this.PassWord.Text.ToString(), "MD5"));
        sqlconn.Open();
        SqlDataReader read = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        if (read.Read())
        {
            Session["user_id"] = read["U00"].ToString();
            Session["user_name"] = read["U04"].ToString();
            Session["user_authority"] = read["U01"].ToString();
            Session["user_type"] = read["U16"].ToString();
            read.Close();
            switch (Session["user_type"].ToString()) {
                case "1":
                    Response.Redirect("~/index.html");
                    break;
                case "2":
                    Response.Redirect("~/admin/admin_index.html");
                    break;
                case "3":
                    Response.Redirect("~/admin/admin_index.html");
                    break;
                case "4":
                    Response.Redirect("~/admin/admin_index.html");
                    break;

            }
        }
        else
        {
        read.Close();
        this.Label1.Text = "用户名或密码有误！";
        }
    }
}