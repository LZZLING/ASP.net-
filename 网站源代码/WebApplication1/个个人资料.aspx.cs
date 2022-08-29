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
    public partial class 个个人资料 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                Bind();
            }
        }
        public void Bind()
        {
            if (Session["UserName"] != null)
            {
                DB db = new DB();
                SqlDataReader dr = db.reDr("select * from PersonalData where UserName='" + Session["UserName"] + "'");
                if (!dr.HasRows)
                {

                    string SqlStr = "insert into PersonalData(UserName,Sex,Introduction,Email,Phone) values('" + Session["UserName"] + "','" + "男" + "','" + "无" + "','" + Session["Email"] + "','" + "无" + "')";
                    SqlConnection sqlCon = db.GetCon();
                    sqlCon.Open();
                    SqlCommand myCmd = new SqlCommand(SqlStr, sqlCon);
                    myCmd.ExecuteNonQuery();
                    myCmd.Dispose(); //释放资源
                    sqlCon.Close();
                }
                if (dr.Read())
                {
                    this.Label1.Text = dr.GetValue(0).ToString();
                    this.Sex.Text = dr.GetValue(1).ToString();
                    this.Introduction.Text = dr.GetValue(2).ToString();
                    this.Email.Text = dr.GetValue(3).ToString();
                    this.Phone.Text = dr.GetValue(4).ToString();
                }


            }
        }
        protected void baocun(object sender, EventArgs e)
        {
            DB db = new DB();
            string Sex = this.TSex.Text;
            string Introduction = this.TIntroduction.Text;
            string Email = this.TEmail.Text;
            string Phone = this.TPhone.Text;
            if (Sex != null)
            {
                string cmdstr = "update PersonalData set Sex='" + Sex + "'";
                db.sqlEx(cmdstr);
            }
            if (Introduction != null)
            {
                string cmdstr = "update PersonalData set Introduction='" + Introduction + "'";
                db.sqlEx(cmdstr);
            }
            if (Email != null)
            {
                string cmdstr = "update PersonalData set Email='" + Email + "'";
                db.sqlEx(cmdstr);
            }
            if (Phone != null)
            {
                string cmdstr = "update PersonalData set Phone='" + Phone + "'";
                db.sqlEx(cmdstr);
            }
            Bind();
            this.TSex.Text = "";
            this.TIntroduction.Text = "";
            this.TEmail.Text = "";
            this.TPhone.Text = "";
        }
    }
}