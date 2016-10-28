using System;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applylist : System.Web.UI.Page
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

            //绑定数据
            bindData();
        }
    }

    protected void bindData()
    {
        zoneNet1.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
        zoneNet1.SelectCommand = "SELECT * FROM TableApply left join optHandleState on TableApply.B08=optHandleState.C00 left join optQuestion on TableApply.B02=optQuestion.Q00 order by B00 desc";
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