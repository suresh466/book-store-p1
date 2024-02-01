using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SureshThagunna_BookStore
{
    public partial class CheckOut : System.Web.UI.Page
    {
        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                Session.Remove("Cart");
                //clear the checkout form by just redirecting to the same page
                Response.Redirect("~/CheckOut.aspx");
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            // remove the cart and redirect to the order page
            Session.Remove("Cart");
            Response.Redirect("~/Order.aspx");
        }
    }
}