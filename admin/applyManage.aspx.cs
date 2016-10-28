using System;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_applyManage : System.Web.UI.Page
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
            //绑定数据
            bindData();
        }
    }

    protected void bindData()
    {
        zoneNet1.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
        zoneNet1.SelectCommand = "SELECT * FROM TableApply a left join optHandleState b on a.B08=b.C00 left join optQuestion c on a.B02=c.Q00 left join TableUser d on a.B09=d.U00 order by B08 asc, B00 desc";
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