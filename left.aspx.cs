using System;

public partial class left : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //用户登录验证
            pyrc.zoneNet login = new pyrc.zoneNet();
            login.loginCheck();
            login.authority(1);
            LoginName.InnerText = "欢迎您，" + Session["user_name"].ToString();
        }
    }
}