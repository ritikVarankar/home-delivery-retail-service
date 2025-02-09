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
    public partial class AddToCart : System.Web.UI.Page
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["HDRSConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);     //ConnectionString
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("~/Customer/Login.aspx");
                }

                //Adding Product To Gridview
                Session["addproduct"] = "false";
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

                if (Request.QueryString["id"] != null)
                {
                    if (Session["buyitems"] == null)
                    {
                        dr = dt.NewRow();

                        SqlDataAdapter da = new SqlDataAdapter("select * from product where proid=" + Request.QueryString["id"], con);
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        dr["srno"] = 1;
                        dr["proid"] = ds.Tables[0].Rows[0]["proid"].ToString();
                        dr["proname"] = ds.Tables[0].Rows[0]["proname"].ToString();
                        dr["proimage"] = ds.Tables[0].Rows[0]["proimage"].ToString();
                        dr["prodesc"] = ds.Tables[0].Rows[0]["prodesc"].ToString();
                        dr["proprice"] = ds.Tables[0].Rows[0]["proprice"].ToString();
                        dr["proquantity"] = Request.QueryString["quantity"];
                        dr["procategory"] = ds.Tables[0].Rows[0]["procategory"].ToString();

                        int price = Convert.ToInt32(ds.Tables[0].Rows[0]["proprice"].ToString());
                        int Quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                        int TotalPrice = price * Quantity;
                        dr["totalprice"] = TotalPrice;

                        dt.Rows.Add(dr);
                        string insertsql;
                        insertsql = "insert into cartdetails(";
                        insertsql += "srno,proid,proname,prodesc,proimage,proprice,proquantity,procategory,email)";
                        insertsql += "values('";
                        insertsql += dr["srno"] + "','";
                        insertsql += dr["proid"] + "','";
                        insertsql += dr["proname"] + "','";
                        insertsql += dr["prodesc"] + "','";
                        insertsql += dr["proimage"] + "','";
                        insertsql += dr["proprice"] + "','";
                        insertsql += dr["proquantity"] + "','";
                        insertsql += dr["procategory"] + "','";
                        insertsql += Session["username"].ToString() + "')";
                        con.Open();
                        SqlCommand cmd = new SqlCommand(insertsql, con);
                        cmd.ExecuteNonQuery();
                        con.Close();

                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;
                        Button1.Enabled = true;

                        GridView1.FooterRow.Cells[6].Text = "Total Amount";
                        GridView1.FooterRow.Cells[7].Text = grandtotal().ToString();
                        Response.Redirect("~/Customer/AddToCart.aspx");
                    }
                    else
                    {
                        dt = (DataTable)Session["buyitems"];
                        int sr;
                        sr = dt.Rows.Count;

                        dr = dt.NewRow();
                        SqlDataAdapter da = new SqlDataAdapter("select * from product where proid=" + Request.QueryString["id"], con);
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        dr["srno"] = sr + 1;
                        dr["proid"] = ds.Tables[0].Rows[0]["proid"].ToString();
                        dr["proname"] = ds.Tables[0].Rows[0]["proname"].ToString();
                        dr["proimage"] = ds.Tables[0].Rows[0]["proimage"].ToString();
                        dr["prodesc"] = ds.Tables[0].Rows[0]["prodesc"].ToString();
                        dr["proprice"] = ds.Tables[0].Rows[0]["proprice"].ToString();
                        dr["proquantity"] = Request.QueryString["quantity"];
                        dr["procategory"] = ds.Tables[0].Rows[0]["procategory"].ToString();

                        int price = Convert.ToInt32(ds.Tables[0].Rows[0]["proprice"].ToString());
                        int Quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                        int TotalPrice = price * Quantity;
                        dr["totalprice"] = TotalPrice;

                        dt.Rows.Add(dr);
                        string insertsql;
                        insertsql = "insert into cartdetails(";
                        insertsql += "srno,proid,proname,prodesc,proimage,proprice,proquantity,procategory,email)";
                        insertsql += "values('";
                        insertsql += dr["srno"] + "','";
                        insertsql += dr["proid"] + "','";
                        insertsql += dr["proname"] + "','";
                        insertsql += dr["prodesc"] + "','";
                        insertsql += dr["proimage"] + "','";
                        insertsql += dr["proprice"] + "','";
                        insertsql += dr["proquantity"] + "','";
                        insertsql += dr["procategory"] + "','";
                        insertsql += Session["username"].ToString() + "')";
                        con.Open();
                        SqlCommand cmd = new SqlCommand(insertsql, con);
                        cmd.ExecuteNonQuery();
                        con.Close();

                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;
                        Button1.Enabled = true;

                        GridView1.FooterRow.Cells[6].Text = "Total Amount";
                        GridView1.FooterRow.Cells[7].Text = grandtotal().ToString();
                        Response.Redirect("~/Customer/AddToCart.aspx");

                    }

                }
                else
                {
                    dt = (DataTable)Session["buyitems"];
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    if (GridView1.Rows.Count > 0)
                    {
                        GridView1.FooterRow.Cells[6].Text = "Total Amount";
                        GridView1.FooterRow.Cells[7].Text = grandtotal().ToString();
                    }

                }
            }

            // Clear Cart Button Visible Or Not
            if (GridView1.Rows.Count.ToString() == "0")
            {
                LinkButton1.Enabled = false;
                LinkButton1.ForeColor = System.Drawing.Color.White;
                Button1.Enabled = false;
                Button1.Text = "Oops";
            }
            else
            {
                LinkButton1.Enabled = true;
                Button1.Enabled = true;
            }
            orderid();
        }

        //Calculating Final Price
        public int grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            int nrow = dt.Rows.Count;
            int i = 0;
            int Ptotalprice = 0;
            while (i < nrow)
            {
                Ptotalprice = Ptotalprice + Convert.ToInt32(dt.Rows[i]["totalprice"].ToString());
                i = i + 1;
            }
            return Ptotalprice;
        }

        public void orderid()
        {
            String alpha = "abcdefghijklmnopqrstuvwxyz123456789";
            Random r = new Random();
            char[] myarray = new char[5];
            for (int i = 0; i < 5; i++)
            {
                myarray[i] = alpha[(int)(35 * r.NextDouble())];
            }
            string orderid;
            orderid = "Order_Id" + DateTime.Now.Hour.ToString() + DateTime.Now.Second.ToString() +
                DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString()
                + DateTime.Now.Year.ToString() + new String(myarray) + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString();
            Session["Orderid"] = orderid;

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);    //ConnectionString

            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int sr;
                int sr1;
                string qdata, dtdata;
                sr = Convert.ToInt32(dt.Rows[i]["srno"].ToString());
                TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
                qdata = cell.Text;
                dtdata = sr.ToString();
                sr1 = Convert.ToInt32(qdata);
                TableCell prID = GridView1.Rows[e.RowIndex].Cells[1];
                if (sr == sr1)
                {
                    dt.Rows[i].Delete();
                    dt.AcceptChanges();
                    con.Open();
                    SqlCommand cmd = new SqlCommand("delete top(1) from cartdetails where proid='" + prID.Text + "' and email='" + Session["username"] + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    //Item has deleted in cart
                    break;
                }
            }

            //Seeting srno after deleting row item from cart
            for (int i = 1; i < dt.Rows.Count; i++)
            {
                dt.Rows[i - 1]["srno"] = i;
                dt.AcceptChanges();
            }
            Session["buyitems"] = dt;
            Response.Redirect("~/Customer/AddToCart.aspx");

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);    //ConnectionString

            bool isTrue = true;
            DataTable dt = (DataTable)Session["buyitems"];
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int pId = Convert.ToInt16(dt.Rows[i]["proid"]);
                int pquantity = Convert.ToInt16(dt.Rows[i]["proquantity"]);
                SqlDataAdapter sda = new SqlDataAdapter("select proquantity,proname from product where proid='" + pId + "'", con);
                DataTable dtable = new DataTable();
                sda.Fill(dtable);
                int quantity = Convert.ToInt16(dtable.Rows[0][0]);
                int reducequantity = quantity - pquantity;
                if (quantity == 0 || reducequantity < 0)
                {
                    string pname = dtable.Rows[0][1].ToString();
                    string msg = "" + pname + " Product Stock Quantity Is Minimum  Please Select Proper Quantity ";
                    Response.Write("<script>alert('" + msg + "');</script>");
                    isTrue = false;
                }
            }
            if (GridView1.Rows.Count.ToString() == "0")
            {
                Response.Write("<script>alert('Your Cart is Empty. You cannot place an Order');</script>");
            }
            else
            {
                if (isTrue == true)
                {
                    Response.Redirect("~/Customer/payment.aspx");
                }
            }
        }

        public void clearcart()
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from cartdetails where email='" + Session["username"] + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/Customer/AddToCart.aspx");
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["buyitems"] = null;
            clearcart();
        }
    }
}