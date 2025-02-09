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
    public partial class Customer_payment : System.Web.UI.Page
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["HDRSConnectionString"].ConnectionString;

        bool isTrue = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("~/Customer/Login.aspx");
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);    //ConnectionString

            if (Session["buyitems"] != null && Session["Orderid"] != null)
            {
                DataTable dt = (DataTable)Session["buyitems"];
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    int pId = Convert.ToInt16(dt.Rows[i]["proid"]);
                    int pquantity = Convert.ToInt16(dt.Rows[i]["proquantity"]);
                    SqlDataAdapter sda = new SqlDataAdapter("select proquantity,proname from product where proid='" + pId + "'", con);
                    DataTable dtable = new DataTable();
                    sda.Fill(dtable);
                    int quantity = Convert.ToInt16(dtable.Rows[0][0]);
                    if (quantity > 0)
                    {
                        string insertsql;
                        insertsql = "insert into orderdetails(";
                        insertsql += "orderid, srno,proid,proname,proprice,proquantity,orderdate,status)";
                        insertsql += "values('";
                        insertsql += Session["Orderid"] + "','";
                        insertsql += dt.Rows[i]["srno"] + "','";
                        insertsql += dt.Rows[i]["proid"] + "','";
                        insertsql += dt.Rows[i]["proname"] + "','";
                        insertsql += dt.Rows[i]["proprice"] + "','";
                        insertsql += dt.Rows[i]["proquantity"] + "','";
                        insertsql += DateTime.Now.ToString("dd-MM-yyyy") + "','Pending')";
                        con.Open();
                        SqlCommand cmd = new SqlCommand(insertsql, con);
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                decreasequantity();
                Payment();
                clearcart();
                Session["buyitems"] = null;
                Response.Redirect("~/Customer/pdfgenerate.aspx");
            }
            else
            {
                Response.Redirect("~/Customer/AddToCart.aspx");
            }
        }

        public void Payment()
        {
            SqlConnection con = new SqlConnection(connectionString);    //ConnectionString

            if (isTrue == true)
            {
                string expdate;
                expdate = DropDownList2.SelectedValue.ToString() + DropDownList1.SelectedValue.ToString();
                string insertsql;
                insertsql = "insert into carddetails(";
                insertsql += "fname,lname,cardno,exdate,cvv,billingaddress)";
                insertsql += "values('";
                insertsql += TextBox1.Text + "','";
                insertsql += TextBox2.Text + "','";
                insertsql += TextBox3.Text + "','";
                insertsql += expdate + "','";
                insertsql += TextBox5.Text + "','";
                insertsql += TextBox6.Text + "')";

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = insertsql;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            Session["billingaddress"] = TextBox6.Text;
        }

        public void decreasequantity()
        {

            SqlConnection con = new SqlConnection(connectionString);    //ConnectionString

            DataTable dt = (DataTable)Session["buyitems"];
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int pId = Convert.ToInt16(dt.Rows[i]["proid"]);
                int pquantity = Convert.ToInt16(dt.Rows[i]["proquantity"]);
                SqlDataAdapter sda = new SqlDataAdapter("select proquantity,proname from product where proid='" + pId + "'", con);
                DataTable dtable = new DataTable();
                sda.Fill(dtable);
                int quantity = Convert.ToInt16(dtable.Rows[0][0]);
                if (quantity > 0)
                {
                    int reducequantity = quantity - pquantity;
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update product set proquantity='" + reducequantity + "'where proid='" + pId + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    isTrue = true;
                }
                else
                {
                    isTrue = false;
                }
            }
        }

        public void clearcart()
        {

            SqlConnection con = new SqlConnection(connectionString);    //ConnectionString

            if (Session["username"] != null)
            {
                DataTable dt = (DataTable)Session["buyitems"];
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    int pId = Convert.ToInt16(dt.Rows[i]["proid"]);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("delete from cartdetails where email='" + Session["username"] + "' and proid='" + pId + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            else
            {
                Response.Redirect("~/Customer/Login.aspx");
            }
        } 
    }
}