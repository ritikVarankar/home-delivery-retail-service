using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace HDRS.Customer
{
    public partial class Display : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["addproduct"] = "false";
        }
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Session["addproduct"] = "true";
            if (e.CommandName.ToString() == "AddtoCart")
            {
                DropDownList list = (DropDownList)(e.Item.FindControl("DropdownList1"));
                Response.Redirect("~/Customer/AddToCart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + list.SelectedItem.ToString());
            }
        }
    }
}