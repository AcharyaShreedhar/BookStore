/*
--------------------------------
Last three digits of my student ID: 288
First Name: Shree Dhar
--------------------------------
*/

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShreeDhar_BookStore_9288
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Bind the data to the page
            BindData();
        }

        // Method to bind data to the Repeater control
        private void BindData()
        {
            // Retrieve book data from the data source
            DataView booksTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            // Bind the book data to the Repeater control
            RepeaterBooks.DataSource = booksTable;
            RepeaterBooks.DataBind();
        }
    }
}
