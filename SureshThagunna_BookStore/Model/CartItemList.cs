using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SureshThagunna_BookStore.Model
{
    public class CartItemList
    {
        private List<CartItem> cartItems;

        public CartItemList()
        {
            cartItems = new List<CartItem>();
        }

        public int Count
        {
            get { return cartItems.Count; }
        }

        // for cart.aspx.cs
        public CartItem this[int index]
        {
            get { return cartItems[index]; }
            set { cartItems[index] = value; }
        }

        // for products.aspx
        public CartItem GetItemById(int id)
            {
                foreach (CartItem c in cartItems)
                    if (c.Book.Id == id) return c;
                return null;
            }

        public static CartItemList GetCart()
        {
            CartItemList cart = (CartItemList)HttpContext.Current.Session["Cart"];
            if (cart == null)
                HttpContext.Current.Session["Cart"] = new CartItemList();
            return (CartItemList)HttpContext.Current.Session["Cart"];
        }

        public void AddItem(Book book, int quantity)
        {
            CartItem c = new CartItem(book, quantity);
            cartItems.Add(c);
        }

        public void RemoveAt(int index)
        {
            cartItems.RemoveAt(index);
        }

        public void Clear()
        {
            cartItems.Clear();
        }
    }
}