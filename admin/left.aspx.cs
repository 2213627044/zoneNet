using System;

public partial class admin_left : System.Web.UI.Page
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
            LoginName.InnerText ="欢迎您，"+ Session["user_name"].ToString();
            if (Session["user_type"].ToString() == "2") { dt1.Visible = true; dt3.Visible = true; }//工作人员菜单
            if (Session["user_type"].ToString() == "3") { dt2.Visible = true; dt4.Visible = true; dd1.Visible = true; dd2.Visible = true; dd3.Visible = true; }//业务管理员菜单
            if (Session["user_type"].ToString() == "4") { dt2.Visible = true; dt4.Visible = true; dd1.Visible = true; dd2.Visible = true; dd3.Visible = true; }//系统管理员菜单
        }
    }
    }