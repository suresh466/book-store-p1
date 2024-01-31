using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// make sure to include this namespace
using System.Data;
// model namespace
using SureshThagunna_BookStore.Model;

namespace SureshThagunna_BookStore
{
    public partial class Products : System.Web.UI.Page
    {
        private Book selectedBook;

        protected void Page_Load(object sender, EventArgs e)
        {
            //bind dropdown on first load; get and show product data on every load   
            if (!IsPostBack) ddlProducts.DataBind();
            selectedBook = this.GetSelectedBook();
            lblName.Text = selectedBook.Title;
            lblUnitPrice.Text = selectedBook.Price.ToString("c") + " each";
            imgProduct.ImageUrl = "Images/Products/" + selectedBook.CoverImage;
        }

        private Book GetSelectedBook()
        {
            //get row from AccessDataSource based on value in dropdownlist
            DataView productsTable = (DataView)
                SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            productsTable.RowFilter =
                "ProductID = '" + ddlProducts.SelectedValue + "'";
            DataRowView row = productsTable[0];

            //create a new product object and load with data from row
            Book B = new Book();
            B.Id = row["ProductID"].ToString();
            B.Title = row["Name"].ToString();
            B.Price = (decimal)row["UnitPrice"];
            B.CoverImage = row["ImageFile"].ToString();
            return B;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //get cart from session and selected item from cart
                CartItemList cart = CartItemList.GetCart();
                CartItem cartItem = cart[selectedBook.Id];

                //if item isn’t in cart, add it; otherwise, increase its quantity
                if (cartItem == null)
                {
                    cart.AddItem(selectedBook,
                                 Convert.ToInt32(txtQuantity.Text));
                }
                else
                {
                    cartItem.AddQuantity(Convert.ToInt32(txtQuantity.Text));
                }
                Response.Redirect("Cart.aspx");
            }
        }
    }
}