using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace HDRS.Customer
{
    public partial class Registration : System.Web.UI.Page
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["HDRSConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Label1.Visible = false;
                Label2.Visible = false;
                Label3.Visible = false;
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);    //ConnectionString
            int i = 0;
            string log = "select * from registration where email='" + TextBox3.Text + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = log;
            con.Open();
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            i = Convert.ToInt32(dt.Rows.Count.ToString());

            if (i == 1)
            {
                Response.Write("<script>alert('This Email Id Already Exists');</script>");
                Label3.Visible = true;
                Label3.Text = " Please Create New Email ID ";
                // Response.Redirect("~/Customer/Registration.aspx");
            }
            else
            {
                Label3.Visible = false;

                string insertsql;
                insertsql = "insert into registration(";
                insertsql += "firstname,lastname,email,gender,address,phoneno,password)";
                insertsql += "values('";
                insertsql += TextBox1.Text + "','";
                insertsql += TextBox2.Text + "','";
                insertsql += TextBox3.Text + "','";
                insertsql += RadioButtonList1.SelectedItem.Text + "','";
                insertsql += TextBox7.Text + "','";
                insertsql += TextBox4.Text + "','";
                insertsql += TextBox5.Text + "')";
                SqlCommand cmd1 = new SqlCommand();
                cmd1.Connection = con;
                cmd1.CommandText = insertsql;

                if (TextBox5.Text == TextBox6.Text)
                {
                    cmd1.ExecuteNonQuery();
                    Label2.Visible = true;
                    Label2.Text = "Your Are Successfully Registered";
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    TextBox4.Text = "";
                    TextBox5.Text = "";
                    TextBox6.Text = "";
                    TextBox7.Text = "";
                }
                else
                {
                    Label1.Visible = true;
                    Label1.Text = "Enter Right Password";
                }

            }
            con.Close();
        }
    }
}