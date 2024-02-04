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
                // bind dropdown lists
                ddlGenres.DataBind();
                ddlBooks.DataBind();
                // trigger the ddlBooks_SelectedIndexChanged event since ddlbooks is changing programmatically
                ddlBooks_SelectedIndexChanged(ddlBooks, EventArgs.Empty);
            }
        }

        protected void ddlBooks_SelectedIndexChanged(object sender, EventArgs e)
        {
            // get the selected book and display its details
            selectedBook = this.GetSelectedBook();
            lblName.Text = selectedBook.Title;
            lblAuthor.Text = selectedBook.Author;
            lblPublicationDate.Text = selectedBook.PublicationDate;
            lblUnitPrice.Text = selectedBook.Price.ToString("c") + " each";
            //imgProduct.ImageUrl = "Images/Products/" + selectedBook.CoverImage;
            imgProduct.ImageUrl = "Images/Products/placeholder.jpg";

        }

        protected void ddlGenres_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Rebind the books dropdown list when the selected genre changes
            ddlBooks.DataBind();
            // Trigger the ddlBooks_SelectedIndexChanged event since ddlBooks is changing programmatically
            ddlBooks_SelectedIndexChanged(ddlBooks, EventArgs.Empty);
        }


        private Book GetSelectedBook()
        {
            //get row from AccessDataSource based on value in dropdownlist
            DataView productsTable = (DataView)
                SqlBooksSource.Select(DataSourceSelectArguments.Empty);

            productsTable.RowFilter =
                "Id = " + ddlBooks.SelectedValue;
            DataRowView row = productsTable[0];

            //create a new product object and load with data from row
            Book B = new Book
            {
                Id = (int)row["Id"],
                Title = (string)row["Title"],
                Author = (string)row["Author"],
                PublicationDate = (string)row["publicationDate"],
                Price = (decimal)row["Price"],
                CoverImage = row["CoverImage"].ToString() // cover image link can be null so.
            };
            return B;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // set selected book
                selectedBook = this.GetSelectedBook();
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