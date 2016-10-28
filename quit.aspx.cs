using System;

public partial class quit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Write("<script>alert('注销成功!');window.location.href ='login.aspx'</script>");
    }
}