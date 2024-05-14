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
    public partial class Sec2_PageOfAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DetailsView1.DefaultMode = DetailsViewMode.ReadOnly;

        }
        protected void GridView1_PreRender(object sender, EventArgs e)
        {
            if (GridView1.HeaderRow != null)
            {
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var parameters =
                SqlDataSource288.InsertParameters;
                parameters["GenreID"].DefaultValue = txtID.Text;
                parameters["shortName"].DefaultValue = txtShortName.Text;
                parameters["GenreName"].DefaultValue = txtLongName.Text;
                try
                {
                    SqlDataSource288.Insert();
                    txtID.Text = "";
                    txtShortName.Text = "";
                    txtLongName.Text = "";
                }
                catch (Exception ex)
                {
                    lblError.Text =
                    DatabaseErrorMessage(ex.Message);
                }
            }
        }
        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text =
                DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = ConcurrencyErrorMessage();
            }
        }
        protected void GridView1_RowDeleted(object sender,
        GridViewDeletedEventArgs e)
        {
            lblError.Text = "Hi 8899288, Row was deleted";
            if (e.Exception != null)
            {
                lblError.Text =
                DatabaseErrorMessage("Hi 8899288,"+e.Exception.Message);
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = "Hi 8899288,"+ConcurrencyErrorMessage();
            }
        }
        private string DatabaseErrorMessage(string errorMsg)
        {
            return $"<b>A database error has occurred:</b> {errorMsg}";
        }
        private string ConcurrencyErrorMessage()
        {
            return "Another user may have updated that category. " +
            "Please try again";
        }
        protected void GridView2_PreRender(object sender, EventArgs e)
        {
            if (GridView2.HeaderRow != null)
            {
                GridView2.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }


        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblDetailsError.Text = "Database error <br /> " + e.Exception.Message;
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblDetailsError.Text = "Another user use the record"; //ConcurrencyError Message
            }
            else
            {
                lblDetailsError.Text = string.Empty;
            }
        }
        protected void DetailsView1_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblDetailsError.Text = "Database error <br /> " + e.Exception.Message;
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblDetailsError.Text = "Another user use the record"; //ConcurrencyError Message
            }
        }
        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblDetailsError.Text = "Database error <br /> " + e.Exception.Message;
                e.ExceptionHandled = true;
                e.KeepInInsertMode = true;

            }
            else
            {
                GridView2.DataBind();
            }
        }

    }
}