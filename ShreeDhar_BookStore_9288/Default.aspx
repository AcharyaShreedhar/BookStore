<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site_9288.Master" CodeBehind="Default.aspx.cs" Inherits="ShreeDhar_BookStore_9288.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <!--
        Name: Shree Dhar Acharya
        Student ID: 8899288
        Date: 30th September 2023
        Application: ShreeDhar_BookStore_9288
     -->
    <section class="hero home">
        <div class="hero_content">
            <h1>Welcome to our BookStore</h1>
            <p>Your one-stop destination for the best books and literary adventures.</p>
        </div>
    </section>
    <div class="books-list">
        <h1>Explore our Popular Books</h1>
        <div class="product-grid">
            <asp:Repeater ID="RepeaterBooks" runat="server">
                <ItemTemplate>
                    <div class="card">
                        <div class="card-image">
                            <img src='<%# "Images/" + Eval("ImageUrl") + ".png" %>' alt="Book Image" />
                        </div>
                        <div class="card-content">
                            <h2><%# Eval("BookTitle") %></h2>
                            <p><%# Eval("Description") %></p>
                            <p><strong>Price:</strong> $<%# Eval("Price") %></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:Acharya_Bookstore_9288ConnectionString %>"
                SelectCommand="SELECT * FROM TheBooks_288 INNER JOIN Genre ON TheBooks_288.GenreID = Genre.GenreID"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

