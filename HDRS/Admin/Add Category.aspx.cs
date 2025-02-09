using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace HDRS.Admin
{
    public partial class Add_Category : System.Web.UI.Page
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["HDRSConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showgrid();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);    //ConnectionString

            String myquery = "Select * from category where catname='" + TextBox1.Text.ToString() + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count == 1)
            {
                Response.Write("<script>alert('This Category already Present');</script>");
            }
            else
            {
                string insertsql;
                insertsql = "insert into category(";
                insertsql += "catname )";
                insertsql += "values('";
                insertsql += TextBox1.Text + "')";
                cmd.Connection = con;
                cmd.CommandText = insertsql;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Product Category Added Successfully');</script>");
                TextBox1.Text = "";
                showgrid();
            }
        }

        private void showgrid()
        {
            SqlConnection con = new SqlConnection(connectionString);    //ConnectionString

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter("select * from category", con);
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            showgrid();
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            showgrid();
            e.Cancel = true;
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection con1 = new SqlConnection(connectionString);    //ConnectionString

            int catid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            con1.Open();
            SqlCommand cmd1 = new SqlCommand("delete from category where catid=@1 ", con1);
            cmd1.Parameters.AddWithValue("@1", catid);
            cmd1.ExecuteNonQuery();
            con1.Close();
            Response.Write("<script>alert('Category Deleted Successfully');</script>");
            showgrid();
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            showgrid();
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlConnection con1 = new SqlConnection(connectionString);    //ConnectionString

            GridViewRow row = GridView1.Rows[e.RowIndex];
            int catid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string catname = (row.FindControl("TextBox2") as TextBox).Text;
            con1.Open();
            SqlCommand cmd1 = new SqlCommand("Update category set catname=@1 where catid=@2", con1);
            cmd1.Parameters.AddWithValue("@1", catname);
            cmd1.Parameters.AddWithValue("@2", catid);
            cmd1.ExecuteNonQuery();
            con1.Close();
            Response.Write("<script>alert('Category Updated Successfully');</script>");
            GridView1.EditIndex = -1;
        }
    }
}