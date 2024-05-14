<%@ Page Language="C#" MasterPageFile="~/Site_9288.Master" AutoEventWireup="true" CodeBehind="TheLoginPageS2.aspx.cs" Inherits="ShreeDhar_BookStore_9288.TheLoginPageS2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!--
        Name: Shree Dhar Acharya
        Student ID: 8899288
        Date: 30th September 2023
        Application: ShreeDhar_BookStore_9288
    -->
    <link href="CSS/login.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main>
        <h2>Login Form</h2>
        <hr />
        <div class="login">
            <div class="row mt-2 ">
                <label class="col-sm-3" for="txtFirstName">The First Name:</label>
                <div class="col-sm-8">
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName"
                        ErrorMessage="First Name is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row mt-2 mb-5">
                <label class="col-sm-3" for="txtLastName">The Last Name:</label>
            <div class="col-sm-8">
                <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName"
                    ErrorMessage="Last Name is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
                </div>
            <hr />
            <asp:Button ID="btnCancel" PostBackUrl="~/Default" CssClass="btn btn-secondary p-2" CausesValidation="False" runat="server" Text="CancelPage_288" OnClick="btnCancel_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnLogin" runat="server" Text="LoginNow" CssClass="btn btn-primary p-2" OnClick="btnLogin_Click" />
        </div>
    </main>
</asp:Content>
