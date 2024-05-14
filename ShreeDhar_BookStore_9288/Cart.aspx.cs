/*
--------------------------------
Last three digits of my student ID: 288
First Name: Shree Dhar
--------------------------------
*/

using ShreeDhar_BookStore_9288.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShreeDhar_BookStore_9288
{
    public partial class Cart : System.Web.UI.Page
    {
        // Step 1: Define a variable to store cart details in the session

        private CartItemList cart;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Step 2: Retrieve the cart object from session state 
            // during each postback

            cart = CartItemList.GetCartOrCreateIt();

            // On the initial load, populate the list control with cart items 
            // (only if it's not a postback)

            if (!IsPostBack)
                this.DisplayCart();
        }

        private void DisplayCart()
        {
            // Step 3: Clear all existing items from the list control

            lstCart.Items.Clear();

            // Iterate through the cart and add the display value of each item 
            // to the list

            for (int i = 0; i < cart.Count; i++)
            {
                lstCart.Items.Add(cart[i].Display());
            }
        }

        // Step 4: Remove an item from the cart

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            // Check if the cart has items and the user has selected an item...

            if (cart.Count > 0)
            {
                if (lstCart.SelectedIndex > -1)
                {
                    // Remove the selected item from the cart 
                    // and update the cart display

                    cart.RemoveAt(lstCart.SelectedIndex);
                    this.DisplayCart();
                }
                else
                {
                    // Display a message if no item is selected

                    lblMessage.Text = "Please select an item to remove.";
                }
            }
        }

        // Step 5: Clear all selected items from the cart/lstCart

        protected void btnEmpty_Click(object sender, EventArgs e)
        {
            // If the cart has items, clear both the cart 
            // and the list control

            if (cart.Count > 0)
            {
                cart.Clear();
                lstCart.Items.Clear();
            }
        }
    }
}
