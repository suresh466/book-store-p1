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
using System.Data.SqlClient;

namespace SureshThagunna_BookStore
{
    public partial class Products : System.Web.UI.Page
    {
        private Book selectedBook;

        protected void Page_Load(object sender, EventArgs e)
        {
            //bind dropdown on first load; get and show product data on every load   
            if (!IsPostBack)
            {
                ddlGenres.DataBind();
                //ddlProducts.DataBind();
            }
            selectedBook = this.GetSelectedBook();
            lblName.Text = selectedBook.Title;
            lblUnitPrice.Text = selectedBook.Price.ToString("c") + " each";
            imgProduct.ImageUrl = "Images/Products/" + selectedBook.CoverImage;
        }

        private Book GetSelectedBook()
        {
            //get row from AccessDataSource based on value in dropdownlist
            Book B = new Book
            {
                Id = 1,
                Title = "title1",
                Price = 9.99m,
                CoverImage = "",
            };
            return B;
        }

        //private Book GetSelectedBook()
        //{
        //    //get row from AccessDataSource based on value in dropdownlist
        //    DataView productsTable = (DataView)
        //        SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        //    productsTable.RowFilter =
        //        "Id = " + ddlProducts.SelectedValue;
        //    DataRowView row = productsTable[0];

        //    //create a new product object and load with data from row
        //    Book B = new Book
        //    {
        //        Id = (int)row["Id"],
        //        Title = (string)row["Title"],
        //        Price = (decimal)row["Price"],
        //        CoverImage = row["CoverImage"].ToString() // cover image link can be null so.
        //    };
        //    return B;
        //}

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //get cart from session and selected item from cart
                CartItemList cart = CartItemList.GetCart();
                CartItem cartItem = cart.GetItemById(selectedBook.Id);

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