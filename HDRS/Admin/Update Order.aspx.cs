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
    public partial class Update_Order : System.Web.UI.Page
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["HDRSConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["admin"] == null)
                {
                    Response.Redirect("~/Customer/Login.aspx");
                }
                TextBox1.Visible = false;
                Label1.Visible = false;
                Label2.Visible = false;
                DropDownList1.Visible = false;
                DropDownList2.Visible = false;
                Calendar1.Visible = false;
                Button2.Visible = false;

                DataSet year = new DataSet();
                year.ReadXml(Server.MapPath("~/Admin/Year.xml"));
                DropDownList1.DataTextField = "Number";
                DropDownList1.DataValueField = "Number";
                DropDownList1.DataSource = year;
                DropDownList1.DataBind();

                DataSet month = new DataSet();
                month.ReadXml(Server.MapPath("~/Admin/Month.xml"));
                DropDownList2.DataTextField = "Name";
                DropDownList2.DataValueField = "Number";
                DropDownList2.DataSource = month;
                DropDownList2.DataBind();
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int year = Convert.ToInt32(DropDownList1.SelectedValue);
            int month = Convert.ToInt32(DropDownList2.SelectedValue);
            Calendar1.VisibleDate = new DateTime(year, month, 1);
            Calendar1.SelectedDate = new DateTime(year, month, 1);
        }
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int year = Convert.ToInt32(DropDownList1.SelectedValue);
            int month = Convert.ToInt32(DropDownList2.SelectedValue);
            Calendar1.VisibleDate = new DateTime(year, month, 1);
            Calendar1.SelectedDate = new DateTime(year, month, 1);
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar1.Visible)
            {
                Label1.Visible = false;
                Label2.Visible = false;
                DropDownList1.Visible = false;
                DropDownList2.Visible = false;
                Calendar1.Visible = false;
            }
            else
            {
                TextBox1.Visible = true;
                Label1.Visible = true;
                Label2.Visible = true;
                DropDownList1.Visible = true;
                DropDownList2.Visible = true;
                Calendar1.Visible = true;
            }
            Button2.Visible = false;
        }
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            // TextBox1.Text = Calendar1.SelectedDate.ToShortDateString();
            TextBox1.Text = Calendar1.SelectedDate.ToString("dd-MM-yyyy");
            Label1.Visible = false;
            Label2.Visible = false;
            DropDownList1.Visible = false;
            DropDownList2.Visible = false;
            Calendar1.Visible = false;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                Response.Write("<script>alert('Please Select Date')</script>");
            }
            else
            {
                SqlConnection con = new SqlConnection(connectionString);    //ConnectionString

                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter("select orderid as OrderId,proname as ProductName,proprice as ProductPrice,proquantity as ProductQuantity,orderdate as OrderDate from orderdetails where orderdate='" + TextBox1.Text + "' and status='Pending' ", con);
                DataSet ds = new DataSet();
                sda.Fill(ds, "orderdetails");
                if (ds.Tables[0].Rows.Count == 0)
                {
                    Response.Write("<script>alert('No Record To Display')</script>");
                }
                else
                {
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                    GridView1.Columns[0].Visible = true;
                    Button2.Visible = true;
                }
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                string orderId = row.Cells[1].Text;
                RadioButton rb1 = (row.Cells[0].FindControl("RadioButton1") as RadioButton);
                RadioButton rb2 = (row.Cells[0].FindControl("RadioButton2") as RadioButton);
                string status;
                if (rb1.Checked)
                {
                    status = rb1.Text;
                }
                else
                {
                    status = rb2.Text;
                }
                SqlConnection con = new SqlConnection(connectionString);    //ConnectionString

                con.Open();
                SqlCommand cmd = new SqlCommand("Update orderdetails set status=@a where orderid=@b", con);
                cmd.Parameters.AddWithValue("@a", status);
                cmd.Parameters.AddWithValue("@b", orderId);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            Response.Write("<script>alert('Status Updated SuccessFully')</script>");
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Center;
            e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Center;
        }
        protected void AllOrder_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);    //ConnectionString

            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select orderid as OrderId,proname as ProductName,proprice as ProductPrice,proquantity as ProductQuantity,orderdate as OrderDate,status as Status from orderdetails ", con);
            DataSet ds = new DataSet();
            sda.Fill(ds, "orderdetails");
            GridView1.DataSource = ds;
            GridView1.DataBind();
            GridView1.Columns[0].Visible = false;
            Button2.Visible = false;
        }
    }
}