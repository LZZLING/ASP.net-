using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using WebApplication1.App_Code;
namespace WebApplication1
{
    public partial class 搜索 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bind(0);//数据绑定
            }
        }
        protected static PagedDataSource ps = new PagedDataSource();//创建一个分页数据源的对象且一定要声明为静态 进行数据绑定的方法
        protected static PagedDataSource ps1 = new PagedDataSource();
        public void Bind(int CurrentPage)
        {
            string search = Request["Search"];
            string SqlStr = "select * from Comment where Comment like '%"+search+"%' ";

            DB db = new DB();
            //bug
            //这里是填充回答数  哦不对，我将更新放在回答中，不就可以实现未读效果吗

            //在这里填充datalist

            //实例化数据集DataSet
            DataSet ds = new DataSet();
            ds = db.reDs(SqlStr);
            ps.DataSource = ds.Tables["Comment"].DefaultView;
            ps.AllowPaging = true; //是否可以分页
            ps.PageSize = 4; //显示的数量
            ps.CurrentPageIndex = CurrentPage; //取得当前页的页码

            this.DataList1.DataSource = ps;
            this.DataList1.DataBind();
        }
        public void Bind1(string CommentID)
        {
            DB db = new DB();
            //bug


            //在这里填充datalist
            string SqlStr = "select * from Reply where CommentID='" + CommentID + "'  order by time DESC";
            //实例化数据集DataSet
            DataSet ds = new DataSet();
            ds = db.reDs(SqlStr);
            ps1.DataSource = ds.Tables["Comment"].DefaultView;
            ps1.AllowPaging = false; //是否可以分页
            this.DataList2.DataSource = ps1;
            this.DataList2.DataBind();
        }
        DataListCommandEventArgs t;
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e) //前面要加onitemcommand="DataList1_ItemCommand"
        {
            if (e.CommandName == "shuaxin")
            {
                DB db = new DB();

                Label lbID = e.Item.FindControl("lbID") as Label;
                string CommentID = lbID.Text;
                Panel p1 = e.Item.FindControl("Panel1") as Panel;
                Panel p2 = e.Item.FindControl("Panel2") as Panel;
                p2.Visible = true;
                Session["CommentID"] = CommentID;
                Bind1(CommentID);

                //点击刷新时增加阅读量
                string chaxun = "select ReadNum from Comment where CommentID='" + Session["CommentID"] + "'";
                SqlDataReader dr = db.reDr("select * from Comment where CommentID='" + Session["CommentID"] + "'");     //2022.5.4
                dr.Read();
                if (dr.HasRows)
                {
                    int ReadNum = Convert.ToInt32(dr.GetValue(7));
                    ReadNum = ReadNum + 1;
                    string cmdstr = "update Comment set ReadNum='" + ReadNum + "' WHERE CommentID='" + Session["CommentID"] + "'";
                    db.sqlEx(cmdstr);
                }

            }
            switch (e.CommandName)
            {
                //以下5个为 捕获用户点击 上一页 下一页等时发生的事件
                case "first"://第一页
                    ps.CurrentPageIndex = 0;
                    Bind(ps.CurrentPageIndex);
                    break;
                case "pre"://上一页
                    if (ps.IsFirstPage)
                        break;
                    ps.CurrentPageIndex = ps.CurrentPageIndex - 1;
                    Bind(ps.CurrentPageIndex);
                    break;
                case "next"://下一页
                    if (ps.IsLastPage)
                        break;
                    ps.CurrentPageIndex = ps.CurrentPageIndex + 1;
                    Bind(ps.CurrentPageIndex);
                    break;
                case "last"://最后一页
                    ps.CurrentPageIndex = ps.PageCount - 1;
                    Bind(ps.CurrentPageIndex);
                    break;

            }

        }
        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Footer)
            {
                //以下六个为得到脚模板中的控件,并创建变量
                Label CurrentPage = e.Item.FindControl("labNowPage") as Label;
                Label PageCount = e.Item.FindControl("labCount") as Label;
                LinkButton FirstPage = e.Item.FindControl("lnkbtnFirst") as LinkButton;
                LinkButton PrePage = e.Item.FindControl("lnkbtnFront") as LinkButton;
                LinkButton NextPage = e.Item.FindControl("lnkbtnNext") as LinkButton;
                LinkButton LastPage = e.Item.FindControl("lnkbtnLast") as LinkButton;
                CurrentPage.Text = (ps.CurrentPageIndex + 1).ToString();//绑定显示当前页
                PageCount.Text = ps.PageCount.ToString();//绑定显示总页数

            }

        }


        protected void Button2_Click1(object sender, EventArgs e)
        {
            DB db = new DB();
            string Reply = this.TextBox1.Text;
            string SqlStr = "insert into Reply(CommentID,Reply,UserName) values('" + Session["CommentID"] + "','" + Reply + "','" + Session["UserName"] + "')";
            SqlConnection sqlCon = new SqlConnection();
            //实例化SqlConnection对象连接数据库的字符串
            sqlCon.ConnectionString = "server=GMLING;uid=sa;pwd=;database=LifeGuide";
            sqlCon.Open();
            SqlCommand myCmd = new SqlCommand(SqlStr, sqlCon);
            myCmd.ExecuteNonQuery();
            myCmd.Dispose(); //释放资源
            sqlCon.Close();
            this.TextBox1.Text = "";

            //这里是填充回答数  哦不对，我将更新放在回答中，不就可以实现未读效果吗
            string chaxun = "select count(*)from Reply where CommentID='" + Session["CommentID"] + "'";
            DataTable ds1 = new DataTable();
            ds1 = db.reDt(chaxun);
            string count = Convert.ToString(ds1.Rows[0][0]);
            string cmdstr = "update Comment set ReplyNum='" + count + "' WHERE CommentID='" + Session["CommentID"] + "'";
            db.sqlEx(cmdstr);

            Response.Write("<script>alert('回复成功');location='首工作.aspx'</script>");
        }
    }

}