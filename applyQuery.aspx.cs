using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;

public partial class applyQuery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //用户登录验证
        pyrc.zoneNet login = new pyrc.zoneNet();
        //login.tempsession();//测试用
        login.loginCheck();
        login.authority(1);
        //根据参数判别是否加载数据
        if (Request.QueryString["id"] != null)
        {
            int id = System.Int32.Parse(Request.QueryString["id"]);
            SqlConnection sqlconn = new SqlConnection();
            sqlconn.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
            var cmd = new SqlCommand("SELECT * FROM TableApply left join optHandleState on TableApply.B08=optHandleState.C00 left join optQuestion on TableApply.B02=optQuestion.Q00 where B00=" + id, sqlconn);
            sqlconn.Open();
            SqlDataReader read = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            if (read.Read())
            {
                if (read["C00"].ToString() == "1"|| read["C00"].ToString() == "2") { div2.Visible = false; }//1待办，1办理中，3完成
                Q01.Text = read["Q01"].ToString();
                B03.Text = read["B03"].ToString();
                B05.Text = read["B05"].ToString();
                B04.InnerText = read["B04"].ToString();
                C01.Text = read["C01"].ToString();
                B11.Text = read["B07"].ToString();
                B10.InnerText = read["B10"].ToString();
            }
            read.Close();
            zoneNet1.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
            zoneNet1.SelectParameters.Clear();
            zoneNet1.SelectCommand = "SELECT * FROM [dbo].[TableUpfile] where F01=@id and F06=1 and F07=0 order by F00 asc";
            zoneNet1.SelectParameters.Add("id", System.TypeCode.Int32,id.ToString());
            Repeater1.DataSourceID = "zoneNet1";
            Repeater1.DataBind();

            zoneNet2.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
            zoneNet2.SelectParameters.Clear();
            zoneNet2.SelectCommand = "SELECT * FROM [dbo].[TableUpfile] where F01=@id and F06=1 and F07=1 order by F00 asc";
            zoneNet2.SelectParameters.Add("id", System.TypeCode.Int32, id.ToString());
            Repeater2.DataSourceID = "zoneNet2";
            Repeater2.DataBind();

        }
    }
}