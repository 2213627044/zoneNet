using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewsEdit_NewsList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //用户登录验证
            pyrc.zoneNet login = new pyrc.zoneNet();
            //login.tempsession();//测试用
            login.loginCheck();
            login.authority(4);

            if (Request.QueryString["m"] != null || Request.QueryString["id"] != null)
            {
                int m = System.Int32.Parse(Request.QueryString["m"]);
                int id = System.Int32.Parse(Request.QueryString["id"]);
                SqlConnection sqlConn = new SqlConnection();
                sqlConn.ConnectionString=ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
                if (m == 2)
                {
                    SqlCommand cmd = new SqlCommand("delete from TableInfo where I00=" + id, sqlConn);
                    sqlConn.Open();
                    SqlDataReader read = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    read.Close();
                }
            }
            //绑定数据
            bindData();
        }
    }

    protected void bindData()
    {
        zoneNet1.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
        zoneNet1.SelectCommand = "SELECT * FROM TableInfo left join optInfoType on TableInfo.I01=optInfoType.T00 order by I00 desc";
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