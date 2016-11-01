using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;

public partial class apply : System.Web.UI.Page
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

            SqlConnection sqlconn = new SqlConnection();
            sqlconn.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
            //临时id=用户编号+时间,用于附件上传
            Label1.Text = DateTime.Now.ToString("yyyyMMddHHmmss");
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
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (B02.SelectedValue == "0" || B03.Text.Replace(" ", "") == "" || B04.InnerText.Replace(" ", "") == "") { Response.Write("<script>alert('必项没有填写完整！');history.back();</script>"); Response.End(); }
        //保存基本信息
        string sql = "insert into [dbo].[TableApply](B01,B02,B03,B04,B05,B08) values(@1,@2,@3,@4,@5,@6) select @@identity";
        string[] param = new string[] { sql, Session["user_id"].ToString(), B02.SelectedValue, B03.Text, B04.InnerText, DateTime.Now.ToString(),"1"};
        int id = pyrc.zoneNet.sqlExecuteCmd(param);
        //新增流程记录
        sql = "insert into TableHandleState(D01,D02,D03,D04,D05) values(@1,@2,@3,@4,@5)";
        param = new string[] { sql, id.ToString(), Session["user_id"].ToString(), "0", "提交问题", DateTime.Now.ToString() };//0:默认流转代码
        pyrc.zoneNet.sqlExecuteCmd(param);
        //保存上传文件
        sql = "update [dbo].[TableUpfile] set F01=@1,F07=0 where F04=@2";
        param = new string[] { sql,id.ToString(),Label1.Text};
        id = pyrc.zoneNet.sqlExecuteCmd(param);

        Response.Write("<script>alert('提交成功!');window.location.href ='applylist.aspx'</script>");
    }

    protected void bindData()
    {
        //上传文件列表
        zoneNet.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
        zoneNet.SelectParameters.Clear();
        zoneNet.SelectCommand = "SELECT * FROM [dbo].[TableUpfile] where F04=@F04 and F06=1 and F07=0 order by F00 asc";//F06状态，1为有效；P07类别，0为客户端上传
        zoneNet.SelectParameters.Add("F04", System.TypeCode.String, Label1.Text);
        Repeater1.DataSourceID = "zoneNet";
        Repeater1.DataBind();
    }

    [WebMethod]
    public static bool del(string id)
    {
        //删除操作
        string sql = "update [dbo].[TableUpfile] set F06=0 where F00=@1";//删除操作，状态值F06设为0
        string[] param = new string[] { sql, id };
        int a=pyrc.zoneNet.sqlExecuteCmd(param);
        return true;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        //刷新上传文件列表
        bindData();
    }
}