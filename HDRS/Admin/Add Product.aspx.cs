using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace HDRS.Admin
{
    public partial class Add_Product : System.Web.UI.Page
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["HDRSConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);    //ConnectionString

            if (FileUpload1.HasFile)
            {
                string filename = FileUpload1.PostedFile.FileName;
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Admin/Product Images/") + filename);
                string filepath = "~/Admin/Product Images/" + Path.GetFileName(FileUpload1.FileName);

                string insertsql;
                insertsql = "insert into product(";
                insertsql += "proname,prodesc,proimage,proprice,proquantity,procategory)";
                insertsql += "values('";
                insertsql += TextBox1.Text + "','";
                insertsql += TextBox2.Text.ToString() + "','";
                insertsql += filepath + "','";
                insertsql += TextBox3.Text + "','";
                insertsql += TextBox4.Text + "','";
                insertsql += DropDownList1.SelectedItem.Text + "')";

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = insertsql;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Product Added Sucessfully');</script>");
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
            }
        }
    }
}