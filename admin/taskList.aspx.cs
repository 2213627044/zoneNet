using System;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_taskList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //用户登录验证
            pyrc.zoneNet login = new pyrc.zoneNet();
            //login.tempsession();//测试用
            login.loginCheck();
            login.authority(3);

            //绑定数据
            bindData();
        }
    }

    protected void bindData()
    {
        zoneNet1.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
        int id = System.Int32.Parse(Session["user_id"].ToString());
        string x = "(select D00 from TableHandleState where D00 in (select max(D00) from TableHandleState where D01 in( select distinct D01 from TableHandleState where D03="+id+") group by D01))";//当前经办人所有受理的问题的最后状态（业务流程决定，经办人的业务必定由管理员流转）
        string y = "select *,0 k from TableHandleState where D03="+id+" and D00 in "+x;//待办
        string z = "select *,1 k from TableHandleState where D03<>" + id + " and D03<>0 and D00 in " + x;//已办
        string u= "select *,1 k from TableHandleState where D03<>" + id + " and D03=0 and D00 in " + x;//结案
        string w = y + " union all " + z + " union all " +u;
        string v ="select * from ("+ w + ") a left join TableApply b on a.D01=b.B00 left join optQuestion c on b.B02=c.Q00 left join optHandleState d on b.B08=d.C00 order by k,a.D05 desc";
        string sql = v;
        PagedDataSource pds = new PagedDataSource();
        zoneNet1.SelectCommand = sql;
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