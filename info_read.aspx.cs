using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;

public partial class info_read : System.Web.UI.Page
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
        string connString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
        SqlConnection Sqlconn = new SqlConnection(connString);
        int id = System.Int32.Parse(Request.QueryString["id"]);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = Sqlconn;
        cmd.CommandText = "update TableInfo set I09=I09+1 where I00 = @id";
        cmd.Parameters.AddWithValue("@id", id);

        Sqlconn.Open();
        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        reader.Close();

        cmd.CommandText = "select * from TableInfo where I00 = @id";
        Sqlconn.Open();
        reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        if (reader.Read())
        {
            title1.InnerHtml = reader["I02"].ToString();
            title2.InnerHtml = string.Format("{0:d}", reader["I06"]) + "&nbsp;&nbsp;人气：" + reader["I09"].ToString();
            content.InnerHtml = reader["I03"].ToString();

        }
        reader.Close();
    }
}



