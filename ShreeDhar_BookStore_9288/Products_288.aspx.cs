/*
--------------------------------
Last three digits of my student ID: 288
First Name: Shree Dhar
--------------------------------
*/

using ShreeDhar_BookStore_9288.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShreeDhar_BookStore_9288
{
    public partial class Products_288 : System.Web.UI.Page
    {
        private TheBook selectedBook;

        protected void Page_Load(object sender, EventArgs e)
        {
            // 1- Load and display the product data in ddlProducts on the first page load
            if (!IsPostBack)
            {
                if (Session["FirstName"] != null)
                {
                    string firstName = Session["FirstName"].ToString();
                    // Display or use the first name as needed
                    lblWelcome.Text = "Welcome, " + firstName;
                }
                ddlProducts.DataBind();
            }

            // 2- Retrieve and display the selected product on each page load
            selectedBook = this.GetselectedBook();

            // 3- Display the product data
            lblName.Text = selectedBook.BookTitle;
            lblAuthor.Text = selectedBook.Author;
            lblGenre.Text = selectedBook.GenreName;
            lblUnitPrice.Text = selectedBook.Price.ToString("c") + " each";
            lblISBN.Text = selectedBook.ISBN;
            lblPublisher.Text = selectedBook.Publisher;
            lblPublishDate.Text = selectedBook.PublishDate.ToString("MMMM dd, yyyy");
            lblDescription.Text = selectedBook.Description;
            lblPages.Text = selectedBook.Pages.ToString();
            lblEdition.Text = selectedBook.Edition;


            // Set the image URL for the product
            imgProduct.ImageUrl = "Images/" + (selectedBook.ImageUrl) + ".png";
        }

        private TheBook GetselectedBook()
        {
            // Get all records from the data source
            DataView booksTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            // Add a filter to retrieve the selected row (not all records)
            booksTable.RowFilter = "BookId = '" + ddlProducts.SelectedValue + "'";

            // Get the first row
            DataRowView row = booksTable[0];

            // Create a TheBook object from the product data
            TheBook b = new TheBook();
           
            //Get Product ID from row
            b.BookID = (int)row["BookId"];
            //Get Product Name
            b.BookTitle = row["BookTitle"].ToString();
            b.Author = row["Author"].ToString();
            b.GenreName = row["GenreName"].ToString();
            b.Price = (decimal)row["Price"];
            b.ISBN = row["ISBN"].ToString();
            b.Publisher = row["Publisher"].ToString();
            b.Description = row["Description"].ToString();
            b.Edition = row["Edition"].ToString();
            b.ImageUrl = row["ImageUrl"].ToString();

            return b;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            // Add the selected item to the session cart
            if (IsValid)
            {
                // Retrieve or create a cart in the session
                CartItemList cart = CartItemList.GetCartOrCreateIt();

                // Retrieve the cart item for the selected book
                CartItem cartItem = cart[selectedBook.BookID.ToString()];

                // Add or update the quantity of the item in the cart
                if (cartItem == null)
                {
                    cart.AddItem(selectedBook, Convert.ToInt32(txtQuantity.Text));
                }
                else
                {
                    cartItem.AddQuantity(Convert.ToInt32(txtQuantity.Text));
                }

                // Redirect to the Cart page
                Response.Redirect("~/Cart");
            }
        }
    }
}
