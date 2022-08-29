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
    public partial class 回技能 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bind(0);//数据绑定
            }

        }
        protected static PagedDataSource ps = new PagedDataSource();
        protected static PagedDataSource ps1 = new PagedDataSource();
        public void Bind(int CurrentPage)
        {
            DB db = new DB();
            //bug


            //在这里填充datalist
            string SqlStr = "select * from Comment where Label='技能'and UserName = '" + Session["UserName"] + "'  order by time DESC";
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
            string SqlStr = "select * from Reply where CommentID='" + CommentID + "'  order by time DESC";
            //实例化数据集DataSet
            DataSet ds = new DataSet();
            ds = db.reDs(SqlStr);
            ps1.DataSource = ds.Tables["Comment"].DefaultView;
            ps1.AllowPaging = false; //是否可以分页

            this.DataList2.DataSource = ps1;
            this.DataList2.DataBind();
        }
        DB db = new DB();
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e) //前面要加onitemcommand="DataList1_ItemCommand"
        {
            if (e.CommandName == "shuaxin")
            {
                Label lbID = e.Item.FindControl("lbID") as Label;
                string CommentID = lbID.Text;
                Panel p1 = e.Item.FindControl("Panel1") as Panel;
                Panel p2 = e.Item.FindControl("Panel2") as Panel;
                p2.Visible = true;
                Bind1(CommentID);
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
    }
}