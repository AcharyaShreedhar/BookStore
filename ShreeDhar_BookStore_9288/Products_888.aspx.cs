/*
--------------------------------
Last 3 digits of student ID: 288
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
    public partial class Products_888 : System.Web.UI.Page
    {
        private TheBook selectedBook;

        protected void Page_Load(object sender, EventArgs e)
        {
            // 1- Load and display the product data in ddlProducts on the first page load
            if (!IsPostBack)
            {
                ddlProducts.DataBind();
            }

            // 2- Retrieve and display the selected product on each page load
            selectedBook = this.GetselectedBook();

            // 3- Display the product data
            lblName.Text = selectedBook.BookTitle;
            lblAuthor.Text = selectedBook.Author;
            lblGenre.Text = selectedBook.GenreName;
            lblUnitPrice.Text = selectedBook.Price.ToString("c") + " each";
            lblISBN.Text = "ISBN: " + selectedBook.ISBN;
            lblPublisher.Text = "Publisher: " + selectedBook.Publisher;
            lblPublishDate.Text = "Publish Date: " + selectedBook.PublishDate.ToString("MMMM dd, yyyy");
            lblDescription.Text = "Description: " + selectedBook.Description;
            lblPages.Text = "Pages: " + selectedBook.Pages.ToString();
            lblLanguage.Text = "Language: " + selectedBook.Language;
            lblEdition.Text = "Edition: " + selectedBook.Edition;


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
            b.PublishDate = (DateTime)row["PublishDate"];
            b.Description = row["Description"].ToString();
            b.Pages = (int)row["Pages"];
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
                Response.Redirect("~/Cart.aspx");
            }
        }
    }
}
