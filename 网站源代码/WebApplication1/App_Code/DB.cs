using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace WebApplication1.App_Code
{
    public class DB
    {
        public DB()
        {
            //
            // TODO: 在此处添加构造函数逻辑
            //
        }
        /// <summary>
        /// 连接数据库
        /// </summary>
        /// <returns>返回SqlConnection对象</returns>
        public SqlConnection GetCon()
        {
            return new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"].ToString());
        }

        /// <summary>
        /// 执行SQL语句
        /// </summary>
        ///<param name="cmdstr">SQL语句</param>
        /// <returns>返回值为int型：成功返1，失败返回0</returns>
        public int sqlEx(string cmdstr)
        {
            SqlConnection con = GetCon();//连接数据库
            con.Open();//打开连接
            SqlCommand cmd = new SqlCommand(cmdstr, con);
            try
            {
                cmd.ExecuteNonQuery();//执行SQL 语句并返回受影响的行数
                return 1;//成功返回１
            }
            catch (Exception e)
            {
                return 0;//失败返回０
            }
            finally
            {
                con.Dispose();//释放连接对象资源
            }
        }

        /// <summary>
        /// 执行SQL查询语句
        /// </summary>
        /// <param name="cmdstr">查询语句</param>
        /// <returns>返回DataTable数据表</returns>
        public DataTable reDt(string cmdstr)
        {
            SqlConnection con = GetCon();
            SqlDataAdapter da = new SqlDataAdapter(cmdstr, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return (ds.Tables[0]);
        }
        /// <summary>
        /// 执行SQL查询语句
        /// </summary>
        /// <param name="str">查询语句</param>
        /// <returns>返回SqlDataReader对象dr</returns>
        public SqlDataReader reDr(string str)
        {
            SqlConnection conn = GetCon();//连接数据库


            conn.Open();//并打开了连接
            SqlCommand com = new SqlCommand(str, conn);
            SqlDataReader dr = com.ExecuteReader(CommandBehavior.CloseConnection);

            return dr;//返回SqlDataReader对象dr
        }
        public DataSet reDs(string cmdstr)
        {
            SqlConnection con = GetCon();
            SqlDataAdapter da = new SqlDataAdapter(cmdstr, con);
            DataSet ds = new DataSet();
            da.Fill(ds, "Comment");
            return ds;
        }
        public void charu(string SqlStr)
        {
            SqlConnection conn = GetCon();
            conn.Open();//并打开了连接
            SqlCommand com = new SqlCommand(SqlStr, conn);
            com.ExecuteNonQuery();
            com.Dispose();
            conn.Close();
        }
    }
}