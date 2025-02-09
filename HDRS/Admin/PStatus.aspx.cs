using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HDRS.Admin
{
    public partial class PStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                Response.Write("<script>alert('Enter Your OrderId');</script>");
            }
            else
            {
                GridView1.Visible = true;
            }

        }
    }
}