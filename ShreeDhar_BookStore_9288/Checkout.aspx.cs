﻿/*
--------------------------------
Last three digits of my student ID: 288
First Name: Shree Dhar
--------------------------------
*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShreeDhar_BookStore_9288
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Page load logic goes here
        }

        private CartItemList cart;

        protected void CheckoutButtonClick(object sender, EventArgs e)
        {
            // Logic for handling checkout button click
            // This event is triggered when the checkout button is clicked
            ScriptManager.RegisterStartupScript(this, GetType(), "OrderPlacedMessage", "alert('Your order has been successfully placed. Thank you for choosing us!!');", true);
            cart = CartItemList.GetCartOrCreateIt();

            // Clear the cart if it has items
            if (cart.Count > 0)
            {
                cart.Clear();
            }

            // Clear email fields
            email.Text = string.Empty;
            reenterEmail.Text = string.Empty;

            // Clear first name and last name
            firstName.Text = string.Empty;
            lastName.Text = string.Empty;

            // Clear phone number
            phoneNumber.Text = string.Empty;

            // Clear address, city, state, and zip
            address.Text = string.Empty;
            city.Text = string.Empty;
            ddlState.SelectedIndex = -1;
            zip.Text = string.Empty;

            // Clear checkboxes
            newProducts.Checked = false;
            newEditions.Checked = false;
            specialOffers.Checked = false;
            localEvents.Checked = false;

            // Clear radio buttons
            twitter.Checked = false;
            facebook.Checked = false;
            emailRadio.Checked = false;
            sms.Checked = false;
        }

        protected void CancelButtonClick(object sender, EventArgs e)
        {
            // Display a confirmation message for cancelling the order
            string confirmMessage = "Are you sure you want to cancel the order?";
            string confirmScript = "if (confirm('" + confirmMessage + "')) { window.location = 'Cart.aspx'; }";
            ScriptManager.RegisterStartupScript(this, GetType(), "CancelOrderConfirmation", confirmScript, true);
        }
    }
}
