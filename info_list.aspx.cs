using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class list : System.Web.UI.Page
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
            //资讯类别
            string connString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
            SqlConnection Sqlconn = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;
            cmd.Connection = Sqlconn;

            cmd.CommandText = "select * from optInfoType where T00=1";
            Sqlconn.Open();
            reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            if (reader.Read())
            {
                Em1.InnerText = reader["T01"].ToString();
                A1.HRef = "info_list_more.aspx?id="+ reader["T00"].ToString();
            }
            reader.Close();

            cmd.CommandText = "select * from optInfoType where T00=2";
            Sqlconn.Open();
            reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            if (reader.Read())
            {
                Em2.InnerText = reader["T01"].ToString();
                A2.HRef = "info_list_more.aspx?id=" + reader["T00"].ToString();
            }
            reader.Close();

            cmd.CommandText = "select * from optInfoType where T00=3";
            Sqlconn.Open();
            reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            if (reader.Read())
            {
                Em3.InnerText = reader["T01"].ToString();
                A3.HRef = "info_list_more.aspx?id=" + reader["T00"].ToString();
            }
            reader.Close();

            cmd.CommandText = "select * from optInfoType where T00=4";
            Sqlconn.Open();
            reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            if (reader.Read())
            {
                Em4.InnerText = reader["T01"].ToString();
                A4.HRef = "info_list_more.aspx?id=" + reader["T00"].ToString();
            }
            reader.Close();
            //数据绑定
            bindData();
        }
    }

    protected void bindData()
    {
        zoneNet1.ConnectionString=ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
        zoneNet1.SelectCommand = "SELECT * FROM TableInfo where I01='1' order by I00 desc";
        Repeater1.DataSourceID = "zoneNet1";
        Repeater1.DataBind();

        zoneNet2.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
        zoneNet2.SelectCommand = "SELECT * FROM TableInfo where I01='2' order by I00 desc";
        Repeater2.DataSourceID = "zoneNet2";
        Repeater2.DataBind();

        zoneNet3.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
        zoneNet3.SelectCommand = "SELECT * FROM TableInfo where I01='3' order by I00 desc";
        Repeater3.DataSourceID = "zoneNet3";
        Repeater3.DataBind();

        zoneNet4.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
        zoneNet4.SelectCommand = "SELECT * FROM TableInfo where I01='4' order by I00 desc";
        Repeater4.DataSourceID = "zoneNet4";
        Repeater4.DataBind();
    }
}