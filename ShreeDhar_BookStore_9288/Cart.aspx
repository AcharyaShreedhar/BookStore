<%@ Page Language="C#" MasterPageFile="~/Site_9288.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ShreeDhar_BookStore_9288.Cart" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!--
        Name: Shree Dhar Acharya
        Student ID: 8899288
        Date: 30th September 2023
        Application: ShreeDhar_BookStore_9288
    -->
    <link href="CSS/cart.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">


    <h1>Your Shopping Cart</h1>
    <div class="row">
        <div class="col-sm-12">
            <div class="form-group">
                <asp:Label ID="lblMessage" runat="server" EnableViewState="False" CssClass="text-danger"></asp:Label>
            </div>
        </div>
    </div>
     <div class="col-xs-12 col-sm-12 col-lg-12">
         <div class="col-xs-6 col-sm-6 col-lg-6">
            <div class="listbox-container">
                <asp:ListBox ID="lstCart" runat="server" CssClass="form-control"></asp:ListBox>
            </div>
            <div class="buttons-container">
                <asp:Button ID="btnContinue" runat="server" PostBackUrl="~/Products_288" Text="Continue Shopping" CssClass="btn btn-secondary" />
                <asp:Button ID="btnCheckOut" runat="server" PostBackUrl="~/Checkout" Text="My Check Out" CssClass="btn btn-primary" />
            </div>
        </div>
         <div class="col-xs-6 col-sm-6 col-lg-6">
            <div class="buttons-container right">
                <asp:Button ID="btnRemove" runat="server" Text="Remove the selected Item" CssClass="btn btn-neg-secondary" OnClick="btnRemove_Click" />
                <asp:Button ID="btnEmpty" runat="server" Text="Empty all the Cart" CssClass="btn btn-neg-primary" OnClick="btnEmpty_Click" />
            </div>
        </div>
    </div>

</asp:Content>

