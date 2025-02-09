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
    public partial class Home : System.Web.UI.Page
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["HDRSConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            Session["addproduct"] = "false";

            //Login Session
            if (Session["username"] != null)
            {
                Label1.Text = "Logged in as " + Session["username"].ToString();
                HyperLink1.Visible = false;
                Button1.Visible = true;
            }
            else
            {
                Label1.Text = "Hello You Can Login Here";
                HyperLink1.Visible = true;
                Button1.Visible = false;
            }
            if (!IsPostBack)
            {
                DropProductCategory();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Customer/Home.aspx");
            Label1.Text = "Your Logout Successfully";
        }
        //Searching the products
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);  //ConnectionString

            SqlDataAdapter da = new SqlDataAdapter("select * from product where (proname like '%" + TextBox1.Text + "%')", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            DataList1.DataSourceID = null;
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }

        //Add To Cart
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Session["addproduct"] = "true";
            if (e.CommandName.ToString() == "AddtoCart")
            {
                DropDownList list = (DropDownList)(e.Item.FindControl("DropdownList1"));
                Response.Redirect("~/Customer/AddToCart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + list.SelectedItem.ToString());
            }
            else if (e.CommandName.ToString() == "ViewDetails")
            {
                Response.Redirect("~/Customer/Display.aspx?id=" + e.CommandArgument.ToString());
            }
        }
        public void DropProductCategory()
        {
            SqlConnection con = new SqlConnection(connectionString);   //ConnectionString

            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from category", con);
            DropDownList2.DataSource = cmd.ExecuteReader();
            DropDownList2.DataTextField = "catname";
            DropDownList2.DataValueField = "catid";
            DropDownList2.DataBind();
            DropDownList2.Items.Insert(0, "Product Category");
            con.Close();
        }
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);  //ConnectionString

            string strquery = "";
            string selectproduct = DropDownList2.SelectedItem.Text;
            if (selectproduct == "Product Category")
            {
                strquery = "";
            }
            else
            {
                strquery = "where procategory='" + selectproduct + "'";
            }
            SqlDataAdapter da = new SqlDataAdapter("select * from product " + strquery + " ", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            try
            {
                if (selectproduct == dt.Rows[0][6].ToString())
                {

                }
            }
            catch (Exception err)
            {
                Response.Write("<script>alert('No Product Found');</script>");
            }
            DataList1.DataSourceID = null;
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);  //ConnectionString

            string stockdata = "";
            Label proID = e.Item.FindControl("Label3") as Label;
            Label stock = e.Item.FindControl("Label2") as Label;
            ImageButton btn = e.Item.FindControl("ImageButton5") as ImageButton;

            SqlDataAdapter da = new SqlDataAdapter("Select * from product where proid='" + proID.Text + "'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                stockdata = dt.Rows[0]["proquantity"].ToString();
            }
            con.Close();
            if (stockdata == "0" || Convert.ToInt16(stockdata) < 0)
            {
                stock.Text = "Sold Out";
                btn.Enabled = false;
                btn.ImageUrl = "~/Customer/Images/Out Of Stock.jpg";
            }
            else
            {
                stock.Text = stockdata;
            }

        }
    }
}