using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
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

            int id = System.Int32.Parse(Request.QueryString["id"]);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = Sqlconn;
            cmd.CommandText = "select * from optInfoType where T00=@id";
            cmd.Parameters.AddWithValue("@id", id);
            Sqlconn.Open();
            SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            if (reader.Read())
            {
                infoType.InnerText = reader["T01"].ToString();
            }
            reader.Close();
            Sqlconn.Close();
            //绑定数据
            bindData();
        }
    }

    protected void bindData()
    {
        int id = System.Int32.Parse(Request.QueryString["id"]);
        zoneNet1.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
        zoneNet1.SelectCommand = "SELECT * FROM TableInfo where I01='"+id+"' order by I00 desc";
        PagedDataSource pds = new PagedDataSource();
        pds.AllowPaging = true;
        pds.PageSize = AspNetPager1.PageSize;
        pds.CurrentPageIndex = AspNetPager1.CurrentPageIndex - 1;
        DataView dv = (DataView)zoneNet1.Select(DataSourceSelectArguments.Empty);
        pds.DataSource = dv;
        Repeater1.DataSource = pds;
        Repeater1.DataBind();

    }
    protected void AspNetPager1_PageChanged(object src, EventArgs e)
    {
        bindData();
    }

    protected void zoneNet1_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        AspNetPager1.RecordCount = e.AffectedRows;
    }
}