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
    public partial class Login : System.Web.UI.Page
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["HDRSConnectionString"].ConnectionString;

        int i;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] != null)
                {
                    Response.Redirect("~/Customer/Home.aspx");
                }
                Label1.Visible = false;
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);                              //ConnectionString
            i = 0;
            string log = "select * from registration where email='" + TextBox1.Text + "' and password='" + TextBox2.Text + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = log;
            con.Open();
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            i = Convert.ToInt32(dt.Rows.Count.ToString());

            if (TextBox1.Text == "rohitvarankar2003@gmail.com" & TextBox2.Text == "ritik")
            {
                Session["admin"] = TextBox1.Text;
                Response.Redirect("~/Admin/Admin.aspx");
            }
            else if (i == 1)
            {
                Session["username"] = TextBox1.Text;
                Session["buyitems"] = null;
                fillsavedcart();
                Response.Redirect("~/Customer/Home.aspx");
            }
            else
            {
                Label1.Visible = true;
            }

            con.Close();
        }

        private void fillsavedcart()
        {
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add("srno");
            dt.Columns.Add("proid");
            dt.Columns.Add("proname");
            dt.Columns.Add("proimage");
            dt.Columns.Add("prodesc");
            dt.Columns.Add("proprice");
            dt.Columns.Add("proquantity");
            dt.Columns.Add("procategory");
            dt.Columns.Add("totalprice");

            SqlConnection con = new SqlConnection(connectionString);                       //ConnectionString

            string myquery = "select * from cartdetails where email='" + Session["username"].ToString() + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                int i = 0;
                int counter = ds.Tables[0].Rows.Count;
                while (i < counter)
                {
                    dr = dt.NewRow();
                    dr["srno"] = i + 1;
                    dr["proid"] = ds.Tables[0].Rows[i]["proid"].ToString();
                    dr["proname"] = ds.Tables[0].Rows[i]["proname"].ToString();
                    dr["proimage"] = ds.Tables[0].Rows[i]["proimage"].ToString();
                    dr["prodesc"] = ds.Tables[0].Rows[0]["prodesc"].ToString();
                    dr["proprice"] = ds.Tables[0].Rows[i]["proprice"].ToString();
                    dr["proquantity"] = ds.Tables[0].Rows[i]["proquantity"].ToString();
                    dr["procategory"] = ds.Tables[0].Rows[0]["procategory"].ToString();
                    int price = Convert.ToInt32(ds.Tables[0].Rows[i]["proprice"].ToString());
                    int Quantity = Convert.ToInt16(ds.Tables[0].Rows[i]["proquantity"].ToString());
                    int TotalPrice = price * Quantity;
                    dr["totalprice"] = TotalPrice;
                    dt.Rows.Add(dr);
                    i = i + 1;
                }
            }
            else
            {
                Session["buyitems"] = null;
            }
            Session["buyitems"] = dt;
        }
    }
}