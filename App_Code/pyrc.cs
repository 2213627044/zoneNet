using System.Configuration;
using System.Data;
using System.Data.SqlClient;
namespace pyrc
{
    /// <summary>
    /// pyrc 的摘要说明
    /// </summary>
    public class zoneNet : System.Web.UI.Page
    {
        public zoneNet()
        {
            //
            // TODO: 在此处添加构造函数逻辑
            //
        }
        public void loginCheck()
        {
            if (Session["user_id"] == null)
            {
                System.Web.HttpContext.Current.Response.Write("<script>alert('请先登录或您没有访问本页的权限!');window.parent.location.href ='../login.aspx';</script>");
                System.Web.HttpContext.Current.Response.End();
            }
        }
        public void authority(int number)
        {
            if (Session["user_authority"].ToString().Substring(number - 1, 1) == "0")
            {
                System.Web.HttpContext.Current.Response.Write("<script>alert('您没有访问本页的权限!');history.back();</script>");
                System.Web.HttpContext.Current.Response.End();
            }
        }
        public bool isAuthority(int number)
        {
            if (Session["user_authority"].ToString().Substring(number - 1, 1) == "1")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public static int sqlExecuteCmd(string[] param)
        {
            int a = param.Length;
            int r = -1;//insert时获取@@identity值
            SqlConnection sqlconn = new SqlConnection();
            sqlconn.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sqlconn;
            cmd.CommandText = param[0];
            for (int i = 1; i <= a-1; i++)
            {
                cmd.Parameters.AddWithValue("@"+i, param[i]);
            }
            sqlconn.Open();
            SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);//执行SQL语句
            if (reader.Read())
            {
               r=System.Int32.Parse(reader[0].ToString());
            }
            reader.Close();//关闭执行
            return r;
        }
        public void tempsession() {
            Session["user_id"] = "19";
            Session["user_name"] = "测试";
            Session["user_authority"] = "1000100";
            Session["user_type"] = "1";
        }
    }
}