using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace HDRS.Admin
{
    public partial class Update_Product : System.Web.UI.Page
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["HDRSConnectionString"].ConnectionString;

        int productid;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["admin"] == null)
                {
                    Response.Redirect("~/Customer/Login.aspx");
                }
                showproduct();
            }

        }
        public void showproduct()
        {
            SqlConnection con = new SqlConnection(connectionString);    //ConnectionString

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter("select * from product", con);
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            showproduct();
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            DropDownList1.SelectedValue = "Select Category";
            showproduct();
            //   e.Cancel = true;
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            int index = e.NewEditIndex;
            GridViewRow row = (GridViewRow)GridView1.Rows[index];
            Label proid = (Label)row.FindControl("Label2");
            productid = int.Parse(proid.Text.ToString());

            SqlConnection con = new SqlConnection(connectionString);    //ConnectionString

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter("select * from product where proid='" + productid + "'", con);
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index = productid;
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            FileUpload fu = (FileUpload)row.FindControl("FileUpload1");
            if (fu.HasFile)
            {
                Label proid = (Label)row.FindControl("Label2");
                TextBox proname = (TextBox)row.FindControl("TextBox1");
                TextBox prodesc = (TextBox)row.FindControl("TextBox2");
                TextBox proprice = (TextBox)row.FindControl("TextBox3");
                TextBox proquantity = (TextBox)row.FindControl("TextBox4");
                string procategory = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[6].FindControl("DropDownList2")).Text;

                fu.SaveAs(Server.MapPath("~/Admin/Product Images/") + Path.GetFileName(fu.FileName));
                String proimage = "~/Admin/Product Images/" + Path.GetFileName(fu.FileName);

                SqlConnection con = new SqlConnection(connectionString);    //ConnectionString

                con.Open();
                SqlCommand cmd = new SqlCommand("Update product set proname=@1,prodesc=@2,proimage=@3,proprice=@4,proquantity=@5,procategory=@6 where proid=@7", con);
                cmd.Parameters.AddWithValue("@1", proname.Text);
                cmd.Parameters.AddWithValue("@2", prodesc.Text);
                cmd.Parameters.AddWithValue("@3", proimage);
                cmd.Parameters.AddWithValue("@4", proprice.Text);
                cmd.Parameters.AddWithValue("@5", proquantity.Text);
                cmd.Parameters.AddWithValue("@6", procategory);
                cmd.Parameters.AddWithValue("@7", proid.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Product Updated Successfully');</script>");
                GridView1.EditIndex = -1;
                showproduct();
                DropDownList1.SelectedValue = "Select Category";
            }
            else
            {
                Response.Write("<script>alert('Please Select Product Image');</script>");
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cname = DropDownList1.SelectedValue.ToString();
            if (cname == "Select Category")
            {
                showproduct();
            }
            else
            {
                SqlConnection con = new SqlConnection(connectionString);    //ConnectionString

                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter("select * from product where procategory= '" + cname + "' ", con);
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
}