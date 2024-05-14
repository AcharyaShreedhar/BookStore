/*
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
    public partial class TheLoginPageS2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Validate the form
            if (Page.IsValid)
            {
                // Store first name and last name in session variables
                Session["FirstName"] = txtFirstName.Text;
                Session["LastName"] = txtLastName.Text;

                // Redirect to the Products page
                Response.Redirect("Products_288");
            }
        }

    }
}