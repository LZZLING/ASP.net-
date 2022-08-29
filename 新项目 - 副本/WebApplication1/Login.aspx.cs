using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using WebApplication1.App_Code;

namespace WebApplication1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DB db = new DB();
            string email = this.floatingInput.Value.Trim();
            string passWord = this.floatingPassword.Value.Trim();
            SqlDataReader dr = db.reDr("select * from UserInformation where Email='" + email + "' and PassWord='" + passWord + "'");     //2022.5.4
            dr.Read();
            if (dr.HasRows)
            {
                Session["UserName"] = dr.GetValue(0);
                Session["Email"] = dr.GetValue(1);
                Response.Redirect("~/首生活.aspx");
            }
            else
            {
                Response.Write("<script>alert('登录失败   账号或密码错误，请重新输入');location='Login.aspx'</script>");//通过location做到刷新效果  啊啊啊因为不能加\n,我找了好久才发现问题。不过我的思路和解决问题的方法，终于有所长进了
            }

            dr.Close();
        }
    }
}