using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class statistics : System.Web.UI.Page
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

            Text1.Value = DateTime.Now.AddMonths(-1).AddDays(1).ToShortDateString();
            Text2.Value = DateTime.Now.ToShortDateString();
            Text3.Value = DateTime.Now.AddMonths(-1).AddDays(1).ToShortDateString();
            Text4.Value = DateTime.Now.ToShortDateString();
            ShowData1(Text1.Value, Text2.Value, 1);
            ShowData1(Text1.Value, Text2.Value, 2);
            ShowData1(Text1.Value, Text2.Value, 3);
            ShowData1(Text1.Value, Text2.Value, 4);
            ShowData2(Text3.Value, Text4.Value);
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string a = Text1.Value.Replace(" ", "");
        string b = Text2.Value.Replace(" ", "");
        DateTime dt;
        a = a == "" ? "1900-01-01" : a;
        b = b == "" ? "2999-12-31" : b;
        if (DateTime.TryParse(a, out dt) == false)
        {
            Response.Write("<script>alert('日期格式有误，请重新输入！')</script>");
            Response.End();
        }
        if (DateTime.TryParse(b, out dt) == false)
        {
            Response.Write("<script>alert('日期格式有误，请重新输入！')</script>");
            Response.End();
        }
        ShowData1(a, b, 1);
        ShowData1(a, b, 2);
        ShowData1(a, b, 3);
        ShowData1(a, b, 4);
    }
    protected void ShowData1(string beginDate, string endDate, int type)
    {
        string c = "";
        switch (type)
        {
            case 1://待处理
                c = "B08=1";
                break;
            case 2://办理中
                c = "B08=2";
                break;
            case 3://结案
                c = "B08=3";
                break;
            case 4://全部
                c = "1=1";
                break;
        }
        SqlConnection sqlconn = new SqlConnection();
        sqlconn.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
        var cmd = new SqlCommand("SELECT count(*) a FROM TableApply where " + c + " and B05 between '" + beginDate + " 00:00:00' and '" + endDate + " 23:59:59'", sqlconn);
        sqlconn.Open();
        SqlDataReader read = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        if (read.Read())
        {
            switch (type)
            {
                case 1:
                    span1.InnerText = read["a"].ToString();
                    break;
                case 2:
                    span2.InnerText = read["a"].ToString();
                    break;
                case 3:
                    span3.InnerText = read["a"].ToString();
                    break;
                case 4:
                    span4.InnerText = read["a"].ToString();
                    break;
            }
            read.Close();
        }
    }
    protected void ShowData2(string beginDate, string endDate)
    {
        string tb1 = "<table class='gridtable'>";
        string tb2 = "</table>";
        string tr1 = "<tr>";
        string tr2 = "<tr>";

        SqlConnection sqlconn1 = new SqlConnection();
        sqlconn1.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
        var cmd1 = new SqlCommand();
        cmd1.Connection = sqlconn1;
        SqlDataReader read1;

        SqlConnection sqlconn2 = new SqlConnection();
        sqlconn2.ConnectionString = ConfigurationManager.ConnectionStrings["zoneNetConn"].ConnectionString;
        var cmd2 = new SqlCommand();
        cmd2.Connection = sqlconn2;
        SqlDataReader read2;

        cmd1.CommandText = "select * from optQuestion order by Q00";
        sqlconn1.Open();
        read1 = cmd1.ExecuteReader(CommandBehavior.CloseConnection);
        while (read1.Read())
        {
            tr1 = tr1 + "<th>" + read1["Q01"].ToString() + "</th>";
            cmd2.CommandText = "select count(*) a from TableApply where B02=" + read1["Q00"].ToString()+ " and B05 between '" + beginDate + " 00:00:00' and '" + endDate + " 23:59:59'";
            sqlconn2.Open();
            read2 = cmd2.ExecuteReader(CommandBehavior.CloseConnection);
            while (read2.Read())
            {
                tr2 = tr2 + "<td>" + read2["a"].ToString() + "</td>";
            }
            read2.Close();
        }
        read1.Close();
        tr1 = tr1 + "<th>合计</th></tr>";
        cmd2.CommandText = "select count(*) a from TableApply where B05 between '" + beginDate + " 00:00:00' and '" + endDate + " 23:59:59'";
        sqlconn2.Open();
        read2 = cmd2.ExecuteReader(CommandBehavior.CloseConnection);
        while (read2.Read())
        {
            tr2 = tr2 + "<td>" + read2["a"].ToString() + "</td>";
        }
        read2.Close();
        tr2 = tr2 + "</tr>";
        div1.InnerHtml = tb1 + tr1 + tr2 + tb2;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string a = Text3.Value.Replace(" ", "");
        string b = Text4.Value.Replace(" ", "");
        DateTime dt;
        a = a == "" ? "1900-01-01" : a;
        b = b == "" ? "2999-12-31" : b;
        if (DateTime.TryParse(a, out dt) == false)
        {
            Response.Write("<script>alert('日期格式有误，请重新输入！')</script>");
            Response.End();
        }
        if (DateTime.TryParse(b, out dt) == false)
        {
            Response.Write("<script>alert('日期格式有误，请重新输入！')</script>");
            Response.End();
        }
        ShowData2(a, b);
    }
}