<%@ Page Language="C#" MasterPageFile="~/Site_9288.Master" AutoEventWireup="true" CodeBehind="Products_288.aspx.cs" Inherits="ShreeDhar_BookStore_9288.Products_288" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!--
        Name: Shree Dhar Acharya
        Student ID: 8899288
        Date: 30th September 2023
        Application: ShreeDhar_BookStore_9288
    -->

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <div class="products">
        <div class="product-details">
            <div class="form-group">
                <h4 class="welcome-user">
                    <asp:Label ID="lblWelcome" class="welcome-user" runat="server"></asp:Label>
                </h4>
            </div>
            <div class="form-group">
                <div class="col-xs-12 col-sm-12 col-lg-12">
                    <div class="col-xs-6 col-sm-6 col-lg-6">
                        <label>Please select a product:</label>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-lg-6">
                        <asp:DropDownList ID="ddlProducts" runat="server" CssClass="col-sm-8 mt-2 mb-2 p-2" AutoPostBack="True" DataTextField="BookTitle" DataValueField="BookID" DataSourceID="SqlDataSource1">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Acharya_Bookstore_9288ConnectionString %>" ProviderName="<%$ ConnectionStrings:Acharya_Bookstore_9288ConnectionString.ProviderName %>" SelectCommand="SELECT DiSTINCT * FROM TheBooks_288 INNER JOIN Genre ON TheBooks_288.GenreID = Genre.GenreID ORDER BY [BookTitle]"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
            <div class="product-details-container">

                <div class="form-group">
                    <h4 class="product-name">
                        <asp:Label ID="lblName" runat="server"></asp:Label>
                    </h4>
                </div>
                <hr />
                <div class="form-group">
                    <div class="col-xs-12 col-sm-12 col-lg-12">
                        <div class="col-xs-6 col-sm-6 col-lg-6">

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
                                <asp:Label ID="lblUnitPrice" CssClass="fw-bold" runat="server"></asp:Label>
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
                                <label class="product-label">Edition:</label>
                                <asp:Label ID="lblEdition" runat="server"></asp:Label>
                            </div>

                        </div>
                        <div class="col-xs-6 col-sm-6 col-lg-6">
                            <asp:Image ID="imgProduct" runat="server" CssClass="product-image" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="products">
        <div class="col-sm-12">
            <div class="form-group row">
                <div class="col-sm-3">
                    <label class="product-label">Quantity:</label>
                </div>
                <div class="col-sm-6">
                    <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control product-quantity"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger"
                        runat="server" ControlToValidate="txtQuantity" Display="Dynamic"
                        ErrorMessage="Quantity is a required field.">
                    </asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="text-danger"
                        ControlToValidate="txtQuantity" Display="Dynamic"
                        ErrorMessage="Quantity must range from 1 to 500."
                        MaximumValue="500" MinimumValue="1" Type="Integer">
                    </asp:RangeValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Button ID="btnAdd" runat="server" Text="Add to the App Cart" CssClass="btn product-button btn-primary" OnClick="btnAdd_Click" />
                <asp:Button ID="btnCart" runat="server" Text="Go to the App Cart"
                    PostBackUrl="~/Cart" CausesValidation="False" CssClass="btn product-button btn-secondary" />
            </div>
        </div>
    </div>

</asp:Content>
