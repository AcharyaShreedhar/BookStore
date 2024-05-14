<!--
Name: Shree Dhar Acharya
Student ID: 8899288
Date: 30th September 2023
Application: ShreeDhar_BookStore_9288
-->


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products_888.aspx.cs" Inherits="ShreeDhar_BookStore_9288.Products_888" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="CSS/site.css" rel="stylesheet" />
    <link href="CSS/products.css" rel="stylesheet" />
    <link href="CSS/cart.css" rel="stylesheet" />
    <title>ShreeDhar_BookStore_9288</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <header>
                <div class="logo">
                    <img class="logo_image" src="Images/logo.png" />
                </div>
                <nav>
                    <ul>
                        <li><a href="Default.aspx">BS2Home</a></li>
                        <li><a href="Products_888.aspx">BS2Products</a></li>
                        <li><a href="Cart.aspx">BS2Cart</a></li>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </nav>
            </header>
            <main>
                <div class="products">
                    <div class="col-sm-8 product-details">
                        <div class="form-group">
                            <label class="product-label">Please select a Book:</label>
                            <asp:DropDownList ID="ddlProducts" runat="server" CssClass="form-control product-dropdown" AutoPostBack="True" DataTextField="BookTitle" DataValueField="BookID" DataSourceID="SqlDataSource1">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Acharya_Bookstore_9288ConnectionString %>" ProviderName="<%$ ConnectionStrings:Acharya_Bookstore_9288ConnectionString.ProviderName %>" SelectCommand="SELECT DiSTINCT * FROM TheBooks_288 INNER JOIN Genre ON TheBooks_288.GenreID = Genre.GenreID ORDER BY [BookTitle]"></asp:SqlDataSource>
                        </div>
                        <div class="product-details-container">

                            <div class="form-group">
                                <h4 class="product-name">
                                    <asp:Label ID="lblName" runat="server"></asp:Label></h4>
                            </div>
                            <hr />
                            <div class="bottom-container">
                                <div class="information">
                                    <div class="form-group">
                                        <label class="product-label">Author:</label>
                                        <asp:Label ID="lblAuthor" runat="server"></asp:Label>
                                    </div>
                                    <div class="form-group">
                                        <label class="product-label">Genre:</label>
                                        <asp:Label ID="lblGenre" runat="server"></asp:Label>
                                    </div>
                                    <div class="form-group">
                                        <label class="product-label">Price:</label>
                                        <asp:Label ID="lblUnitPrice" runat="server"></asp:Label>
                                    </div>
                                    <div class="form-group product-form-group">
                                        <label class="product-label">ISBN:</label>
                                        <asp:Label ID="lblISBN" runat="server"></asp:Label>
                                    </div>
                                    <div class="form-group product-form-group">
                                        <label class="product-label">Publisher:</label>
                                        <asp:Label ID="lblPublisher" runat="server"></asp:Label>
                                    </div>
                                    <div class="form-group product-form-group">
                                        <label class="product-label">Publish Date:</label>
                                        <asp:Label ID="lblPublishDate" runat="server"></asp:Label>
                                    </div>
                                    <div class="form-group product-form-group">
                                        <label class="product-label">Description:</label>
                                        <asp:Label ID="lblDescription" runat="server" CssClass="product-description"></asp:Label>
                                    </div>
                                    <div class="form-group product-form-group">
                                        <label class="product-label">Pages:</label>
                                        <asp:Label ID="lblPages" runat="server"></asp:Label>
                                    </div>
                                    <div class="form-group product-form-group">
                                        <label class="product-label">Language:</label>
                                        <asp:Label ID="lblLanguage" runat="server"></asp:Label>
                                    </div>
                                    <div class="form-group product-form-group">
                                        <label class="product-label">Edition:</label>
                                        <asp:Label ID="lblEdition" runat="server"></asp:Label>
                                    </div>

                                </div>
                                <div class="col-sm-4 product-image-column">
                                    <asp:Image ID="imgProduct" runat="server" CssClass="product-image" />
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
                <div class="products">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label class="product-label">Quantity:</label>
                            <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control product-quantity"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger"
                                runat="server" ControlToValidate="txtQuantity" Display="Dynamic"
                                ErrorMessage="Quantity is a required field."></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="text-danger"
                                ControlToValidate="txtQuantity" Display="Dynamic"
                                ErrorMessage="Quantity must range from 1 to 500."
                                MaximumValue="500" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" CssClass="btn product-button btn-primary" OnClick="btnAdd_Click" />
                            <asp:Button ID="btnCart" runat="server" Text="Go to Cart"
                                PostBackUrl="~/Cart.aspx" CausesValidation="False" CssClass="btn product-button btn-secondary" />
                        </div>
                    </div>
                </div>
            </main>
            <footer>
                <div class="footer_content">

                    <ul>
                        <li><a href="#">Terms of Service</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                    <p>&copy; 2023 ShreeDhar_Bookstore_9288. All Rights Reserved!</p>
                </div>
            </footer>
        </div>
    </form>
</body>
</html>

