using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class admin_UserEdit : System.Web.UI.Page
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
            SqlDataAdapter sqldar = new SqlDataAdapter("select * from [optUserType] where A00<>4", sqlconn);//4为系统管理员
            DataSet Ds = new DataSet();
            sqldar.Fill(Ds, "List");
            U16.DataSource = Ds.Tables["List"].DefaultView;
            U16.DataTextField = "A01";
            U16.DataValueField = "A00";
            sqlconn.Open();
            U16.DataBind();
            sqlconn.Close();
            //根据参数判别是否加载数据
            if (Request.QueryString["id"] != null)
            {
                int id = System.Int32.Parse(Request.QueryString["id"]);
                var cmd = new SqlCommand("select * from TableUser where U00=" + id, sqlconn);
                sqlconn.Open();
                SqlDataReader read = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (read.Read())
                {
                    U16.SelectedValue = read["U16"].ToString();
                    U02.Text = read["U02"].ToString();
                    //U03.Text = read["U03"].ToString();
                    U04.Text = read["U04"].ToString();
                    U05.Text = read["U05"].ToString();
                    U06.Text = read["U06"].ToString();
                    U07.Text = read["U07"].ToString();
                    U08.Text = read["U08"].ToString();
                    U09.Text = read["U09"].ToString();
                    U10.Text = read["U10"].ToString();
                    U11.Text = read["U11"].ToString();
                    U12.Text = read["U12"].ToString();
                    U13.Text = read["U13"].ToString();
                    U15.InnerText = read["U15"].ToString();
                    U02.Enabled = false;
                    U04.Enabled = false;
                    U16.Enabled = false;
                    Label1.Visible = true;
                }
                read.Close();
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection sqlconn = new SqlConnection();
        sqlconn.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = sqlconn;
        //新增
        if (Request.QueryString["id"] == null)
        {
            if (U16.SelectedValue == "0" || U04.Text.Replace(" ", "") == "" || U02.Text.Replace(" ", "") == "" || U03.Text.Replace(" ", "") == "") { Response.Write("<script>alert('必项没有填写完整！');history.back();</script>"); Response.End(); }
            //检查账号是否重复
            cmd.CommandText = "select count(U02) from TableUser where U02=@accout";
            cmd.Parameters.AddWithValue("@accout", U02.Text);
            sqlconn.Open();
            if ((Int32)cmd.ExecuteScalar() != 0)
            {
                Response.Write("<script>alert('用户账号不能重复！');</script>");
                sqlconn.Close();
                return;
            }
            sqlconn.Close();
            //无重复时执行的语句
            cmd.CommandText = "insert into [dbo].[TableUser](U01,U02,U03,U04,U05,U06,U07,U08,U09,U10,U11,U12,U13,U14,U15,U16) values(@U01,@U02,@U03,@U04,@U05,@U06,@U07,@U08,@U09,@U10,@U11,@U12,@U13,@U14,@U15,@U16)";
        }
        //修改
        else
        {
            if (U16.SelectedValue == "0" || U04.Text.Replace(" ", "") == "" || U02.Text.Replace(" ", "") == "") { Response.Write("<script>alert('必项没有填写完整！');</script>"); Response.End(); }
            int id = System.Int32.Parse(Request.QueryString["id"]);
            if (U03.Text.Replace(" ", "") == "")
            {
                cmd.CommandText = "update [dbo].[TableUser] set U05=@U05,U06=@U06,U07=@U07,U08=@U08,U09=@U09,U10=@U10,U11=@U11,U12=@U12,U13=@U13,U15=@U15,U16=@U16 where U00=" + id;
            }
            else
            {
                cmd.CommandText = "update [dbo].[TableUser] set U03=@U03,U05=@U05,U06=@U06,U07=@U07,U08=@U08 ,U09=@U09 ,U10=@U10 ,U11=@U11 ,U12=@U12 ,U13=@U13 ,U15=@U15 where U00=" + id;
            }
        }
        switch (U16.SelectedValue.ToString())
        {
            case "1"://园区联系人
                cmd.Parameters.AddWithValue("@U01", "1100000000");
                break;
            case "2"://内部工作人员
                cmd.Parameters.AddWithValue("@U01", "1110000000");
                break;
            case "3"://管理员
                cmd.Parameters.AddWithValue("@U01", "1111111111");
                break;
        }
        cmd.Parameters.AddWithValue("@U02", U02.Text);
        cmd.Parameters.AddWithValue("@U03", System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(U03.Text, "MD5"));
        cmd.Parameters.AddWithValue("@U04", U04.Text);
        cmd.Parameters.AddWithValue("@U05", U05.Text);
        cmd.Parameters.AddWithValue("@U06", U06.Text);
        cmd.Parameters.AddWithValue("@U07", U07.Text);
        cmd.Parameters.AddWithValue("@U08", U08.Text);
        cmd.Parameters.AddWithValue("@U09", U09.Text);
        cmd.Parameters.AddWithValue("@U10", U10.Text);
        cmd.Parameters.AddWithValue("@U11", U11.Text);
        cmd.Parameters.AddWithValue("@U12", U12.Text);
        cmd.Parameters.AddWithValue("@U13", U13.Text);
        cmd.Parameters.AddWithValue("@U14", DateTime.Now);
        cmd.Parameters.AddWithValue("@U15", U15.InnerText);
        cmd.Parameters.AddWithValue("@U16", U16.SelectedValue);
        sqlconn.Open();
        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);//执行SQL语句
        reader.Close();//关闭执行
        Response.Write("<script>alert('保存成功!');window.location.href ='UserList.aspx'</script>");
    }
}