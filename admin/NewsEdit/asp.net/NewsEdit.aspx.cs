using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// NewsEdit 的摘要说明
/// </summary>
public partial class NewsEdit : System.Web.UI.Page
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

            //类别列表
            SqlConnection sqlconn = new SqlConnection();
            sqlconn.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
            SqlDataAdapter sqldar = new SqlDataAdapter("select * from [dbo].[optInfoType]", sqlconn);
            //sqldar.SelectCommand.CommandType = CommandType.Text;
            DataSet Ds = new DataSet();
            sqldar.Fill(Ds, "List");
            I01.DataSource = Ds.Tables["List"].DefaultView;
            I01.DataTextField = "T01";
            I01.DataValueField = "T00";
            sqlconn.Open();
            I01.DataBind();
            sqlconn.Close();
            //根据参数判别是否加载数据
            if (Request.QueryString["id"] != null)
            {
                int id = System.Int32.Parse(Request.QueryString["id"]);
                var cmd = new SqlCommand("select * from TableInfo where I00=" + id, sqlconn);
                sqlconn.Open();
                SqlDataReader read = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (read.Read())
                {
                    I01.SelectedValue = read["I01"].ToString();
                    I02.Text = read["I02"].ToString();
                    I03.InnerText = read["I03"].ToString();
                }
                read.Close();
            }

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (I01.SelectedValue == "0" || I02.Text.Replace(" ", "") == "" || I03.InnerText.Replace(" ", "") == "") { Response.Write("<script>alert('必项没有填写完整！');history.back();</script>"); Response.End(); }
        SqlConnection sqlconn = new SqlConnection();
        sqlconn.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = sqlconn;
        //根据参数判别新增或修改
        if (Request.QueryString["id"] == null)
        {
            cmd.CommandText = "insert into [dbo].[TableInfo](I01,I02,I03,I04,I05,I06,I07,I08) values(@I01,@I02,@I03,@I04,@I05,@I06,@I07,@I08)";
        }
        else
        {
            int id = System.Int32.Parse(Request.QueryString["id"]);
            cmd.CommandText = "update [dbo].[TableInfo] set I01=@I01,I02=@I02,I03=@I03,I04=@I04,I05=@I05,I06=@I06,I07=@I07,I08=@I08 where I00=" + id;
        }
        cmd.Parameters.AddWithValue("@I01", I01.SelectedValue);
        cmd.Parameters.AddWithValue("@I02", I02.Text);
        cmd.Parameters.AddWithValue("@I03", I03.InnerText);
        cmd.Parameters.AddWithValue("@I04", DBNull.Value);
        cmd.Parameters.AddWithValue("@I05", DBNull.Value);
        cmd.Parameters.AddWithValue("@I06", DateTime.Now);
        cmd.Parameters.AddWithValue("@I07", DBNull.Value);
        cmd.Parameters.AddWithValue("@I08", DBNull.Value);
        sqlconn.Open();
        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);//执行SQL语句
        reader.Close();//关闭执行
        Response.Write("<script>alert('保存成功!');</script>");

    }
}