using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;


public partial class admin_applyHandle : System.Web.UI.Page
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

            //Label1为隐藏控件，用于传值到upfile.aspx
            Label1.Text = Request.QueryString["id"];
            //加载数据
            if (Request.QueryString["id"] != null)
            {
                int id = System.Int32.Parse(Request.QueryString["id"]);
                int m = System.Int32.Parse(Request.QueryString["m"]);
                if (m == 1) { Button1.Enabled = false; Button1.Visible=false; Button4.Visible = false; iframe1.Visible=false; exChange.Visible = false; };//1：查看，0：编辑
                SqlConnection sqlconn = new SqlConnection();
                sqlconn.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
                //问题类别列表
                SqlDataAdapter sqldar = new SqlDataAdapter("select * from [optQuestion]", sqlconn);
                DataSet Ds = new DataSet();
                sqldar.Fill(Ds, "List");
                B02.DataSource = Ds.Tables["List"].DefaultView;
                B02.DataTextField = "Q01";
                B02.DataValueField = "Q00";
                sqlconn.Open();
                B02.DataBind();
                sqlconn.Close();

                var cmd = new SqlCommand("SELECT * FROM TableApply a left join optHandleState b on a.B08=b.C00 left join optQuestion c on a.B02=c.Q00 left join TableUser d on a.B01=d.U00 where B00=" + id, sqlconn);
                sqlconn.Open();
                SqlDataReader read = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (read.Read())
                {
                    U05.Text = read["U05"].ToString();
                    U04.Text = read["U04"].ToString();
                    U06.Text = read["U06"].ToString();
                    U07.Text = read["U07"].ToString();
                    U08.Text = read["U08"].ToString();
                    B02.SelectedValue = read["Q00"].ToString();
                    B03.Text = read["B03"].ToString();
                    B05.Text = read["B05"].ToString();
                    B04.InnerText = read["B04"].ToString();
                    B10.InnerText = read["B10"].ToString();
                    B12.InnerText = read["B12"].ToString();
                }
                read.Close();
                //当前跟进
                var cmd1 = new SqlCommand("SELECT * FROM TableApply a left join (select D01, D03 from TableHandleState where D00 in (select max(D00) mD00 from TableHandleState group by D01)) e on a.B00 = e.D01 left join TableUser b on e.D03=b.U00  where B00 = " + id, sqlconn);
                sqlconn.Open();
                read = cmd1.ExecuteReader(CommandBehavior.CloseConnection);
                if (read.Read()) { D03.Text = read["U04"].ToString(); }
                read.Close();

                zoneNet1.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
                zoneNet1.SelectParameters.Clear();
                zoneNet1.SelectCommand = "SELECT * FROM [dbo].[TableUpfile] where F01=@id and F06=1 and F07=0 order by F00 asc";
                zoneNet1.SelectParameters.Add("id", System.TypeCode.Int32, id.ToString());
                Repeater1.DataSourceID = "zoneNet1";
                Repeater1.DataBind();

                zoneNet2.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
                zoneNet2.SelectParameters.Clear();
                zoneNet2.SelectCommand = "SELECT * FROM [dbo].[TableUpfile] where F01=@id and F06=1 and F07=1 order by F00 asc";
                zoneNet2.SelectParameters.Add("id", System.TypeCode.Int32, id.ToString());
                Repeater2.DataSourceID = "zoneNet2";
                Repeater2.DataBind();

                zoneNet3.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
                zoneNet3.SelectParameters.Clear();
                zoneNet3.SelectCommand = "SELECT * FROM [dbo].[TableHandleState] a left join TableUser b on a.D02=b.U00 where D01=@id order by D00 asc";
                zoneNet3.SelectParameters.Add("id", System.TypeCode.Int32, id.ToString());
                Repeater3.DataSourceID = "zoneNet3";
                Repeater3.DataBind();
                
                //流转人列表
                SqlDataAdapter sqldar1 = new SqlDataAdapter("select * from [TableUser] where (U16=2 or U16=3) and U17=1", sqlconn);//U16:1=园区，2=内部，3=管理员；U17:1=有效
                DataSet Ds1 = new DataSet();
                sqldar1.Fill(Ds1, "List");
                U00.DataSource = Ds1.Tables["List"].DefaultView;
                U00.DataTextField = "U04";
                U00.DataValueField = "U00";
                sqlconn.Open();
                U00.DataBind();
                sqlconn.Close();
            }
        }
    }
    [WebMethod]
    public static bool del(string id)
    {
        SqlConnection sqlconn = new SqlConnection();
        sqlconn.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = sqlconn;
        //删除操作，状态值F06设为0
        cmd.CommandText = "update [dbo].[TableUpfile] set F06=0 where F00=@id";
        cmd.Parameters.AddWithValue("@id", id);
        sqlconn.Open();
        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);//执行SQL语句
        reader.Close();//关闭执行
        return true;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        bindData();
    }
    protected void bindData()
    {
        zoneNet2.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
        zoneNet2.SelectParameters.Clear();
        zoneNet2.SelectCommand = "SELECT * FROM [dbo].[TableUpfile] where F01=@F01 and F06=1 and F07=1 order by F00 asc";//F06状态，1为有效；P07类别，1为后台上传
        zoneNet2.SelectParameters.Add("F01", System.TypeCode.String, Label1.Text);
        Repeater2.DataSourceID = "zoneNet2";
        Repeater2.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //提交结案
        int id = System.Int32.Parse(Request.QueryString["id"]);
        SqlConnection sqlconn = new SqlConnection();
        sqlconn.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = sqlconn;
        cmd.CommandText = "update [dbo].[TableApply] set B06=@B06,B07=@B07,B08=@B08,B09=@B09,B10=@B10,B12=@B12 where B00="+id;//06答复人编号，07答复时间，08处理状态编码，09跟进人编号，10回复内容，12内部备注
        cmd.Parameters.AddWithValue("@B06", Session["user_id"].ToString());//答复人编码，读取登录session
        cmd.Parameters.AddWithValue("@B07", DateTime.Now);
        cmd.Parameters.AddWithValue("@B08", 3);//3:完成
        cmd.Parameters.AddWithValue("@B09", 0);//0:空号，结案状态没有跟进人。
        cmd.Parameters.AddWithValue("@B10", B10.InnerText);
        cmd.Parameters.AddWithValue("@B12", B12.InnerText);
        sqlconn.Open();
        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        reader.Close();
        //新增流转记录
        string sql = "insert into TableHandleState(D01,D02,D03,D04,D05) values(@1,@2,@3,@4,@5)";
        string[] param = new string[] { sql, id.ToString(), Session["user_id"].ToString(), "0", "结案", DateTime.Now.ToString() };//D03=0:结案
        int a = pyrc.zoneNet.sqlExecuteCmd(param);
        Response.Redirect("applyManage.aspx");
        Response.Write("<script>alert('提交成功!');</script>");
        Response.End();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        if (U00.SelectedValue == "0") { Response.Write("<script>alert('必项没有填写完整！');history.back();</script>"); Response.End(); }
        //新增流转记录
        int id = System.Int32.Parse(Request.QueryString["id"]);
        string sql = "insert into TableHandleState(D01,D02,D03,D04,D05) values(@1,@2,@3,@4,@5)";
        string[] param = new string[] { sql, id.ToString(),Session["user_id"].ToString(), U00.SelectedValue, D04.InnerText, DateTime.Now.ToString() };
        int a = pyrc.zoneNet.sqlExecuteCmd(param);
        //更新处理状态
        sql = "update [dbo].[TableApply] set B08=2,B09=@1 where B00=@2";//2:办理中
        param = new string[] { sql, U00.SelectedValue, id.ToString() };
        a = pyrc.zoneNet.sqlExecuteCmd(param);
        Response.Redirect("applyManage.aspx");
        Response.Write("<script>alert('提交成功!');</script>");
        Response.End();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        //保存
        int id = System.Int32.Parse(Request.QueryString["id"]);
        SqlConnection sqlconn = new SqlConnection();
        sqlconn.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = sqlconn;
        cmd.CommandText = "update [dbo].[TableApply] set B06=@B06,B07=@B07,B10=@B10,B12=@B12 where B00=" + id;//06答复人编号，07答复时间，08处理状态编码，10回复内容，12内部备注
        cmd.Parameters.AddWithValue("@B06", Session["user_id"].ToString());//答复人编码，读取登录session
        cmd.Parameters.AddWithValue("@B07", DateTime.Now);
        //cmd.Parameters.AddWithValue("@B08", 2);//2:办理中
        cmd.Parameters.AddWithValue("@B10", B10.InnerText);
        cmd.Parameters.AddWithValue("@B12", B12.InnerText);
        sqlconn.Open();
        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);//执行SQL语句
        reader.Close();//关闭执行
        Response.Write("<script>alert('保存成功!');</script>");
    }

}