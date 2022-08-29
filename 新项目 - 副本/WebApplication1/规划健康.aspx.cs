using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using WebApplication1.App_Code;
using System.Web.SessionState;
namespace WebApplication1
{
    public partial class 规划健康 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bind(0);//数据绑定
            }
        }
        protected static PagedDataSource ps = new PagedDataSource();
        public void Bind(int CurrentPage)
        {
            DB db = new DB();
            string SqlStr = "select * from Comment where Label='健康' and UserName = '" + Session["UserName"] + "'  order by time DESC";
            //实例化数据集DataSet
            DataSet ds = new DataSet();
            ds = db.reDs(SqlStr);
            ps.DataSource = ds.Tables["Comment"].DefaultView;
            ps.AllowPaging = false; //是否可以分页

            this.DataList1.DataSource = ps;
            this.DataList1.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DB db = new DB();
            string neirong = this.TextBox1.Text.ToString();
            string SqlStr = "insert into Comment(Email,Label,Comment,ReplyNum,UserName,ReadNum) values('" + Session["Email"] + "','健康','" + neirong + "','0','" + Session["UserName"] + "','0')";
            db.charu(SqlStr);
            this.TextBox1.Text = "";
            Response.Write("<script>alert('添加成功！');location='规划健康.aspx'</script>");
        }
        public void DataListBind()
        {
            //实例化公共类的对象
            DB db = new DB();
            //定义SQL语句
            string sqlstr = "select * from Comment where UserName = '" + Session["UserName"] + "' and Label='健康' "; /* UserName = '" + Session["UserName"]+ "' and  */
            //实例化数据集DataTable用于存储查询结果
            DataTable dt = db.reDt(sqlstr);
            //绑定DataList控件
            DataList1.DataSource = dt;//设置数据源，用于填充控件中的项的值列表
            DataList1.DataBind();//将控件及其所有子控件绑定到指定的数据源
        }

        //显示EditTemplate模板
        protected void DataList1_EditCommand(object source, DataListCommandEventArgs e)
        {
            //设置DataList1控件的编辑项的索引为选择的当前索引
            DataList1.EditItemIndex = e.Item.ItemIndex;
            //数据绑定
            DataListBind();
        }

        //取消显示EditTemplate模板
        protected void DataList1_CancelCommand(object source, DataListCommandEventArgs e)
        {
            //设置DataList1控件的编辑项的索引为－1，即取消编辑
            DataList1.EditItemIndex = -1;
            //数据绑定
            DataListBind();
        }
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            //if (e.CommandName == "cancel")
            //{
            //    //设置选中行的索引为-1,取消该数据项的选择
            //    DataList1.SelectedIndex = -1;
            //    //数据绑定
            //    DataListBind();
            //}
        }
        protected void DataList1_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            DB db = new DB();
            string Comment = ((TextBox)e.Item.FindControl("txtNewComment")).Text;
            string txtID = ((TextBox)e.Item.FindControl("txtID")).Text;
            string sqlStr = "update Comment set Comment='" + Comment + "'where CommentID='" + txtID + "' ";
            db.sqlEx(sqlStr);
            DataList1.EditItemIndex = -1;
            DataListBind();
        }
    }
}