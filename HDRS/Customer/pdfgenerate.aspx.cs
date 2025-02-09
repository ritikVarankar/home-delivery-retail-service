using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.Web.Configuration;

namespace HDRS.Customer
{
    public partial class pdfgenerate : System.Web.UI.Page
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["HDRSConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("~/Customer/Login.aspx");
                }
            }
            if (Session["Orderid"] == null)
            {
                Response.Redirect("~/Customer/AddToCart.aspx");
            }
            string Orderid = Session["Orderid"].ToString();
            Label1.Text = Orderid;
            findorderdate(Label2.Text);
            string Address = Session["billingaddress"].ToString();
            Label3.Text = Address;
            showgrid(Label1.Text);
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            exportpdf();
        }
        private void exportpdf()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=OrderInvoice.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            Panel1.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }

        private void findorderdate(String Orderid)
        {
            SqlConnection con = new SqlConnection(connectionString);    //ConnectionString
            String myquery = "Select * from orderdetails where orderid='" + Label1.Text + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Label2.Text = ds.Tables[0].Rows[0]["orderdate"].ToString();
            }
            con.Close();
        }

        private void showgrid(String orderid)
        {
            DataTable dt = new DataTable();
            DataRow dr;

            dt.Columns.Add("srno");
            dt.Columns.Add("proid");
            dt.Columns.Add("proname");
            dt.Columns.Add("proquantity");
            dt.Columns.Add("proprice");
            dt.Columns.Add("totalprice");

            SqlConnection scon = new SqlConnection(connectionString);    //ConnectionString

            String myquery = "select * from orderdetails where orderid='" + Label1.Text + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = scon;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            int totalrows = ds.Tables[0].Rows.Count;
            int i = 0;
            int grandtotal = 0;
            while (i < totalrows)
            {
                dr = dt.NewRow();
                dr["srno"] = ds.Tables[0].Rows[i]["srno"].ToString();
                dr["proid"] = ds.Tables[0].Rows[i]["proid"].ToString();
                dr["proname"] = ds.Tables[0].Rows[i]["proname"].ToString();
                dr["proquantity"] = ds.Tables[0].Rows[i]["proquantity"].ToString();
                dr["proprice"] = ds.Tables[0].Rows[i]["proprice"].ToString();
                int price = Convert.ToInt16(ds.Tables[0].Rows[i]["proprice"].ToString());
                int quantity = Convert.ToInt16(ds.Tables[0].Rows[i]["proquantity"].ToString());
                int totalprice = price * quantity;
                dr["totalprice"] = totalprice;
                grandtotal = grandtotal + totalprice;
                dt.Rows.Add(dr);
                i = i + 1;
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
            Label4.Text = grandtotal.ToString();
        }
    }
}