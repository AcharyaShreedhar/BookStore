<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site_9288.Master" CodeBehind="Sec2_PageOfAdmin.aspx.cs" Inherits="ShreeDhar_BookStore_9288.Sec2_PageOfAdmin" %>


<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="form-group">
        <div class="col-xs-12 col-sm-12 col-lg-12 form-group">
            <asp:Label class="col-xs-4 col-sm-4 col-lg-4" runat="server" Text="Select a genre :"></asp:Label>
            <div class="col-xs-8 col-sm-8 col-lg-8">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Acharya_Bookstore_9288ConnectionString %>" SelectCommand="SELECT [GenreID], [GenreName] FROM [Genre] ORDER BY [GenreName]"></asp:SqlDataSource>
                <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="GenreName" DataValueField="GenreID" DataSourceID="SqlDataSource1" AutoPostBack="True"></asp:DropDownList>

            </div>
        </div>

        <div class="col-xs-12 col-sm-12 col-lg-12">
            <asp:DataList ID="DataList1" runat="server"
                CssClass="table table-bordered table-striped table-condensed" ForeColor="#333333"
                CellPadding="4" DataKeyField="BookID" DataSourceID="SqlDataSource2">
                <AlternatingItemStyle BackColor="White" ForeColor="#284775" />


                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />

                <HeaderTemplate>

                    <span class="col-xs-3 col-sm-3 col-lg-3">ID</span>

                    <span class="col-xs-4 col-sm-4 col-lg-4">Book</span>

                    <span class="col-xs-3 col-sm-3 col-lg-3">Price288</span>

                    <span class="col-xs-2 col-sm-2 col-lg-2">On Hand</span>

                </HeaderTemplate>
                <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <ItemTemplate>

                    <asp:Label runat="server" ID="BookIDLabel" Text='<%# Eval("BookID") %>' CssClass="col-xs-3" />


                    <asp:Label runat="server" ID="BookTitleLabel" Text='<%# Eval("BookTitle") %>' CssClass="col-xs-4" />

                    <asp:Label Text='<%# Eval("Price") %>' runat="server" ID="PriceLabel" CssClass="col-xs-3" />


                    <asp:Label runat="server" ID="OnHandLabel" Text='<%# Eval("OnHand") %>' CssClass="col-xs-2 " />

                </ItemTemplate>
                <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Acharya_Bookstore_9288ConnectionString %>" SelectCommand="SELECT [BookID], [BookTitle], [Price], [OnHand] FROM [TheBooks_288] WHERE ([GenreID] = @GenreID) ORDER BY [BookTitle]">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="GenreID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>

    <div class="form-group">
        <asp:Label class="col-xs-12 col-sm-12 col-lg-12 form-group" runat="server" Text="Genre Information System :" Font-Bold="True"></asp:Label>
        <div class="col-xs-12 col-sm-12 col-lg-12">
            <asp:SqlDataSource ID="SqlDataSource288" runat="server" ConnectionString="<%$ ConnectionStrings:Acharya_Bookstore_9288ConnectionString %>"
                DeleteCommand="DELETE FROM [Genre] WHERE [GenreID] = @GenreID"
                InsertCommand="INSERT INTO [Genre] ([GenreName], [shortName]) VALUES (@GenreName, @shortName)"
                SelectCommand="SELECT [GenreID], [GenreName], [shortName] FROM [Genre] ORDER BY [GenreName]"
                UpdateCommand="UPDATE [Genre] SET [GenreName] = @GenreName, [shortName] = @shortName WHERE [GenreID] = @GenreID">
                <DeleteParameters>
                    <asp:Parameter Name="GenreID" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="GenreID" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="GenreName" Type="String"></asp:Parameter>
                    <asp:Parameter Name="shortName" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="GenreName" Type="String"></asp:Parameter>
                    <asp:Parameter Name="shortName" Type="String"></asp:Parameter>
                    <asp:Parameter Name="GenreID" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <asp:GridView ID="GridView1" runat="server"
            CssClass="table table-bordered table-striped table-condensed table-responsive"
            DataSourceID="SqlDataSource288" AutoGenerateColumns="False"
            DataKeyNames="GenreID" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None"
            OnRowDeleted="GridView1_RowDeleted"
            OnRowUpdated="GridView1_RowUpdated"
            OnPreRender="GridView1_PreRender" PageSize="8">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />

            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="lblGenreID" runat="server"
                            Text='<%# Bind("GenreID") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="col-xs-2" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Short Name">
                    <EditItemTemplate>
                        <div class="col-xs-11 col-edit">
                            <asp:TextBox ID="txtshortName"
                                runat="server" MaxLength="15"
                                CssClass="form-control"
                                Text='<%# Bind("shortName") %>'>
                            </asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvshortName"
                            runat="server"
                            ControlToValidate="txtshortName"
                            ValidationGroup="Edit" Text="*"
                            ErrorMessage="Short Name is a required field"
                            CssClass="text-danger">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="lblshortName" runat="server"
                            Text='<%# Bind("shortName") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="col-xs-4" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Long Name">
                    <EditItemTemplate>
                        <div class="col-xs-11 col-edit">
                            <asp:TextBox ID="txtLongName" runat="server"
                                MaxLength="50" CssClass="form-control"
                                Text='<%# Bind("GenreName") %>'>
                            </asp:TextBox>
                        </div>

                        <asp:RequiredFieldValidator ID="rfvlongName"
                            runat="server"
                            ControlToValidate="txtlongName"
                            ValidationGroup="Edit" Text="*"
                            ErrorMessage="Long Name is a required field"
                            CssClass="text-danger">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbllongName" runat="server"
                            Text='<%# Bind("GenreName") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="col-xs-5" />
                </asp:TemplateField>

                <asp:CommandField CausesValidation="True" ShowEditButton="True" UpdateText="Update88" ValidationGroup="Edit">
                    <ItemStyle CssClass="col-xs-1" />
                </asp:CommandField>

                <asp:CommandField ShowDeleteButton="True" CausesValidation="False">
                    <ItemStyle CssClass="col-xs-1" />
                </asp:CommandField>

            </Columns>
            <PagerSettings FirstPageText="First..." LastPageText="...Last" Mode="NextPreviousFirstLast" NextPageText="Next..." PreviousPageText="...Previous..." />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server"
            HeaderText="Please correct the following errors:"
            ValidationGroup="Edit" CssClass="text-danger" />

        <div class="col-xs-12">
            <p>
                To create a new genre
            </p>
            <p>
                <asp:Label ID="lblError" runat="server"
                    EnableViewState="false" CssClass="text-danger">
                </asp:Label>
            </p>
            <div class="form-group">
                <label for="txtID" class="col-sm-2">ID :</label>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtID" runat="server"
                        MaxLength="10" CssClass="form-control">
                    </asp:TextBox>
                </div>
                <div class="col-sm-offset-3 col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvID"
                        runat="server" ControlToValidate="txtID"
                        CssClass="text-danger"
                        ErrorMessage="ID is a required field">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label for="txtShortName" class="col-sm-2">
                    Genre S. Name :</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtShortName" runat="server"
                        MaxLength="15" CssClass="form-control">
                    </asp:TextBox>
                </div>
                <div class="col-sm-offset-2 col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvShortName"
                        runat="server" CssClass="text-danger"
                        ControlToValidate="txtShortName"
                        ErrorMessage="Short Name is a required field">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label for="txtLongName" class="col-sm-2">
                    Genre L. Name :</label>
                <div class="col-sm-6">
                    <asp:TextBox ID="txtLongName" runat="server"
                        MaxLength="50" CssClass="form-control">
                    </asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvLongName"
                        runat="server" CssClass="text-danger"
                        ControlToValidate="txtLongName"
                        ErrorMessage="Long Name is a required field">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <asp:Button ID="btnAdd" runat="server"
                Text="Add New Record"
                CssClass="btn" OnClick="btnAdd_Click" />
        </div>
    </div>
    <div class="form-group">
        <div class="col-xs-6 col-sm-6 col-lg-6">
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Acharya_Bookstore_9288ConnectionString %>" SelectCommand="SELECT [BookID], [BookTitle], [GenreID] FROM [TheBooks_288] ORDER BY [BookTitle]"></asp:SqlDataSource>
            <asp:GridView ID="GridView2" runat="server"
                CssClass="table table-bordered table-striped table-condensed table-responsive"
                DataSourceID="SqlDataSource3" AutoGenerateColumns="False" DataKeyNames="BookID"
                CellPadding="4" ForeColor="#333333" GridLines="None"
                AllowPaging="True" AllowSorting="True" OnPreRender="GridView2_PreRender">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="BookID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="BookID">
                        <ItemStyle CssClass="col-xs-3" />
                    </asp:BoundField>
                    <asp:BoundField DataField="BookTitle" HeaderText="Name" SortExpression="BookTitle">
                        <ItemStyle CssClass="col-xs-3" />
                    </asp:BoundField>
                    <asp:BoundField DataField="GenreID" HeaderText="Category" SortExpression="GenreID">
                        <ItemStyle CssClass="col-xs-3" />
                    </asp:BoundField>
                    <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerSettings Mode="NextPrevious" NextPageText="Next" PreviousPageText="Previous....  " />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
        </div>
        <div class="col-xs-6 col-sm-6 col-lg-6">
            <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                ConnectionString="<%$ ConnectionStrings:Acharya_Bookstore_9288ConnectionString %>"
                DeleteCommand="DELETE FROM [TheBooks_288] WHERE [BookID] = @BookID"
                InsertCommand="INSERT INTO [TheBooks_288] ([BookTitle], [Price], [GenreID], [Description], [ImageUrl], [OnHand], [Publisher]) VALUES (@BookTitle, @Price, @GenreID, @Description, @ImageUrl, @OnHand, @Publisher)"
                SelectCommand="SELECT [BookID], [BookTitle], [Publisher], [Description],[GenreID], [ImageUrl],[Price], [OnHand] FROM [TheBooks_288] WHERE ([BookID] = @BookID)"
                UpdateCommand="UPDATE [TheBooks_288] SET [BookTitle] = @BookTitle, [Price] = @Price, [GenreID] = @GenreID, [Description] = @Description, [ImageUrl] = @ImageUrl, [OnHand] = @OnHand, [Publisher] = @Publisher WHERE [BookID] = @BookID">
                <DeleteParameters>
                    <asp:Parameter Name="BookID" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="BookID" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="BookTitle" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Publisher" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Description" Type="String"></asp:Parameter>
                    <asp:Parameter Name="GenreID" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="ImageUrl" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Price" Type="Decimal"></asp:Parameter>
                    <asp:Parameter Name="OnHand" Type="Int32"></asp:Parameter>

                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView2" PropertyName="SelectedValue" Name="BookID" Type="Int32"></asp:ControlParameter>
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="BookID" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="BookTitle" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Publisher" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Description" Type="String"></asp:Parameter>
                    <asp:Parameter Name="GenreID" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="ImageUrl" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Price" Type="Decimal"></asp:Parameter>
                    <asp:Parameter Name="OnHand" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
            <p>
                <asp:ValidationSummary ID="ValidationSummary2"
                    ValidationGroup="detail"
                    runat="server"
                    HeaderText="Please correct the following errors:"
                    CssClass="text-danger" />
            </p>
            <p>
                <asp:Label ID="lblDetailsError" runat="server"
                    EnableViewState="false" CssClass="text-danger">
                </asp:Label>
            </p>
            <asp:DetailsView ID="DetailsView1" runat="server"
                CssClass="table table-bordered table-condensed table-responsive"
                Height="50px" AutoGenerateRows="False" DataKeyNames="BookID" CellPadding="4"
                DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None">
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <CommandRowStyle BackColor="#FFFBD6" Font-Bold="True" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />

                <Fields>
                    <asp:TemplateField HeaderText="Product ID">
                        <ItemTemplate>
                            <asp:Label ID="lblBookID" runat="server" Text='<%# Bind("BookID") %>'></asp:Label>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <asp:RequiredFieldValidator ID="rfvBookID"
                                runat="server" CssClass="text-danger"
                                ControlToValidate="txtBookID"
                                ErrorMessage="BookID is a required field."
                                ValidationGroup="detail"
                                Text="*">
                            </asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="txtBookID"
                                MaxLength="10"
                                Text='<%# Bind("BookID") %>'
                                CssClass="form-control">
                            </asp:TextBox>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <asp:RequiredFieldValidator ID="rfvBookID"
                                runat="server" CssClass="text-danger"
                                ControlToValidate="txtBookID"
                                ErrorMessage="BookID is a required field."
                                ValidationGroup="detail"
                                Text="*">
                            </asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="txtBookID"
                                Text='<%# Bind("BookID") %>'
                                MaxLength="10"
                                CssClass="form-control">
                            </asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="lblBookTitle" runat="server" Text='<%# Bind("BookTitle") %>'></asp:Label>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                runat="server" CssClass="text-danger"
                                ControlToValidate="txtName"
                                ErrorMessage="Name is a required field."
                                ValidationGroup="detail"
                                Text="*">
                            </asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="txtName"
                                Text='<%# Bind("BookTitle") %>'
                                CssClass="form-control">
                            </asp:TextBox>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                runat="server" CssClass="text-danger"
                                ControlToValidate="txtName"
                                ErrorMessage="Name is a required field."
                                ValidationGroup="detail"
                                Text="*">
                            </asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="txtName"
                                Text='<%# Bind("BookTitle") %>'
                                CssClass="form-control">
                            </asp:TextBox>
                        </EditItemTemplate>

                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Short Description">
                        <ItemTemplate>
                            <asp:Label ID="lblShortDescription" runat="server" Text='<%# Bind("Publisher") %>'></asp:Label>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                runat="server" CssClass="text-danger"
                                ControlToValidate="txtBox3"
                                ErrorMessage="Short Description is a required field."
                                ValidationGroup="detail"
                                Text="*">
                            </asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="txtBox3"
                                Text='<%# Bind("Publisher") %>'
                                CssClass="form-control">
                            </asp:TextBox>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                runat="server" CssClass="text-danger"
                                ControlToValidate="txtBox3"
                                ErrorMessage="Short Description is a required field."
                                ValidationGroup="detail"
                                Text="*">
                            </asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="txtBox3"
                                Text='<%# Bind("Publisher") %>'
                                CssClass="form-control">
                            </asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Long Description">
                        <ItemTemplate>
                            <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                                runat="server" CssClass="text-danger"
                                ControlToValidate="txtDescription"
                                ErrorMessage="Long Description is a required field."
                                ValidationGroup="detail"
                                Text="*">
                            </asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="txtDescription"
                                Text='<%# Bind("Description") %>'
                                CssClass="form-control">
                            </asp:TextBox>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                                runat="server" CssClass="text-danger"
                                ControlToValidate="txtDescription"
                                ErrorMessage="Long Description is a required field."
                                ValidationGroup="detail"
                                Text="*">
                            </asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="txtDescription"
                                Text='<%# Bind("Description") %>'
                                CssClass="form-control">
                            </asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category" SortExpression="GenreID">
                        <ItemTemplate>
                            <asp:Label ID="GenreLabel" runat="server" Text='<%# Eval("GenreID") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource5" DataTextField="GenreName" DataValueField="GenreID" SelectedValue='<%# Bind("GenreID") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ImageFile">
                        <ItemTemplate>
                            <asp:Label ID="lblImageFile" runat="server" Text='<%# Bind("ImageUrl") %>'></asp:Label>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                                runat="server" CssClass="text-danger"
                                ControlToValidate="TextBox5"
                                ErrorMessage="Image File is a required field."
                                ValidationGroup="detail"
                                Text="*">
                            </asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="TextBox5"
                                Text='<%# Bind("ImageUrl") %>'
                                CssClass="form-control">
                            </asp:TextBox>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                                runat="server" CssClass="text-danger"
                                ControlToValidate="TextBox5"
                                ErrorMessage="Image File is a required field."
                                ValidationGroup="detail"
                                Text="*">
                            </asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="TextBox5"
                                Text='<%# Bind("ImageUrl") %>' CssClass="form-control">
                            </asp:TextBox>
                        </EditItemTemplate>

                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Unit Price">
                        <ItemTemplate>
                            <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                                runat="server" CssClass="text-danger"
                                ControlToValidate="TextBox6"
                                ErrorMessage="Unit Price is a required field."
                                ValidationGroup="detail"
                                Text="*">
                            </asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="TextBox6"
                                Text='<%# Bind("Price") %>'
                                CssClass="form-control">
                            </asp:TextBox>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                                runat="server" CssClass="text-danger"
                                ControlToValidate="TextBox6"
                                ErrorMessage="Unit Price is a required field."
                                ValidationGroup="detail"
                                Text="*">
                            </asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="TextBox6"
                                Text='<%# Bind("Price") %>'
                                CssClass="form-control">
                            </asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="On Hand">
                        <ItemTemplate>
                            <asp:Label ID="lblOnHand" runat="server" Text='<%# Bind("OnHand") %>'></asp:Label>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                                runat="server" CssClass="text-danger"
                                ControlToValidate="TextBox7"
                                ErrorMessage="On Hand is a required field."
                                ValidationGroup="detail"
                                Text="*">
                            </asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="TextBox7"
                                Text='<%# Bind("OnHand") %>'
                                CssClass="form-control">
                            </asp:TextBox>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                                runat="server" CssClass="text-danger"
                                ControlToValidate="TextBox7"
                                ErrorMessage="On Hand is a required field."
                                ValidationGroup="detail"
                                Text="*">
                            </asp:RequiredFieldValidator>
                            <asp:TextBox runat="server" ID="TextBox7"
                                Text='<%# Bind("OnHand") %>'
                                CssClass="form-control">
                            </asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" ValidationGroup="detail"></asp:CommandField>
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Acharya_Bookstore_9288ConnectionString %>" SelectCommand="SELECT [GenreID], [GenreName] FROM [Genre] ORDER BY [GenreName]"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
