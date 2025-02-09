using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HDRS.Admin
{
    public partial class Default : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //Timer Click Event for Displaying the Banner Ads 
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Random ran = new Random();
            int i = ran.Next(1, 6);
            Image2.ImageUrl = "~/Admin/Images/" + i.ToString() + ".jpg";
        }

        //Redirect to Cart Page 
        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AddtoCart.aspx");
        }
        protected void Logout1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Customer/Home.aspx");
        }
    }
}