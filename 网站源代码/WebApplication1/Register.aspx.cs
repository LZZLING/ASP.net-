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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        int reValue;
        public int CheckName()
        {
            DB db = new DB();
            SqlConnection sqlCon = db.GetCon();
            //定义SQL语句
            string str = "select count(*) from UserInformation where UserName='" + this.validationDefaultUsername.Value + "'";
            try
            {
                SqlDataAdapter da = new SqlDataAdapter(str, sqlCon);
                DataSet ds = new DataSet();
                da.Fill(ds);
                DataTable dt = ds.Tables[0];
                if (dt.Rows[0][0].ToString() != "0")
                {
                    return -1;//该用户名已经存在
                }
                else
                {
                    return 2;//该用户名尚未注册
                }
            }
            catch (Exception ee)
            {
                return 0;
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            reValue = CheckName();
            if (reValue == -1)
            {
                this.validationDefaultUsername.Value = "";
                this.validationDefault01.Value = "";
                this.validationDefault02.Value = ""; 
                this.validationDefault03.Value = "";
                Response.Write("<script>alert('用户名存在！');</script>");
            }
            else if (reValue == 2)
            {
                string user = this.validationDefaultUsername.Value;
                string pwd = this.validationDefault02.Value;
                string eml = this.validationDefault01.Value;
                string SqlStr = "insert into UserInformation(UserName,PassWord,Email) values('" + user + "','" + pwd + "','" + eml + "')";
                DB db = new DB();
                SqlConnection sqlCon = db.GetCon();
                sqlCon.Open();
                SqlCommand myCmd = new SqlCommand(SqlStr, sqlCon);
                myCmd.ExecuteNonQuery();
                myCmd.Dispose(); //释放资源
                sqlCon.Close();
                this.validationDefaultUsername.Value = "";
                this.validationDefault01.Value = "";
                this.validationDefault02.Value = "";
                this.validationDefault03.Value = "";
                Response.Write("<script>alert('注册成功');location='Login.aspx'</script>");

            }
        }
    }
}