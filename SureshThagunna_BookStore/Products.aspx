<%@ Page Title="Products" Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="SureshThagunna_BookStore.Products" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <main>
            <div class="row">
                <div class="col-sm-12 text-center">
                    <h2>Products</h2>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-sm-8">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Select a Genre</h5>
                            <asp:DropDownList ID="ddlGenres" runat="server" AutoPostBack="True"
                                DataSourceID="sqlGenresSource" DataTextField="Name" DataValueField="Id"
                                OnSelectedIndexChanged="ddlGenres_SelectedIndexChanged" CssClass="form-select">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqlGenresSource" runat="server"
                                ConnectionString="<%$ ConnectionStrings:sureshthagunna_bookstore %>"
                                SelectCommand="SELECT [Id], [Name] FROM [Genre] ORDER BY [Name]"></asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="card mt-3">
                        <div class="card-body">
                            <h5 class="card-title">Select a Book</h5>
                            <asp:DropDownList ID="ddlBooks" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlBooks_SelectedIndexChanged"
                                DataSourceID="SqlBooksSource" DataTextField="Title" DataValueField="Id" CssClass="form-select">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlBooksSource" runat="server"
                                ConnectionString="<%$ ConnectionStrings:sureshthagunna_bookstore %>"
                                SelectCommand="SELECT [Id], [GenreId], [Title], [Price], [CoverImage] FROM [Book] WHERE ([GenreId] = @GenreId) ORDER BY [Title]">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlGenres" Name="GenreId" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="card mt-4">
                        <div class="card-body">
                            <h5 class="card-title">
                                <asp:Label ID="lblName" runat="server"></asp:Label>
                            </h5>
                            <p>
                                <asp:Label ID="lblUnitPrice" runat="server"></asp:Label>
                            </p>
                        </div>
                    </div>


                    <div class="form-group mt-3">
                        <label>Quantity:</label>
                        <asp:TextBox ID="txtQuantity" runat="server"
                            CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger"
                            runat="server" ControlToValidate="txtQuantity" Display="Dynamic"
                            ErrorMessage="Quantity is a required field."></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="text-danger"
                            ControlToValidate="txtQuantity" Display="Dynamic"
                            ErrorMessage="Quantity must range from 1 to 500."
                            MaximumValue="500" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                    </div>

                    <div class="form-group mt-2">
                        <asp:Button ID="btnAdd" runat="server" Text="Add to Cart"
                            OnClick="btnAdd_Click" CssClass="btn btn-primary mr-2" />
                        <asp:Button ID="btnCart" runat="server" Text="Go to Cart"
                            PostBackUrl="~/Cart.aspx" CausesValidation="False" CssClass="btn btn-success" />
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="card">
                        <asp:Image ID="imgProduct" runat="server" CssClass="img-fluid" />
                    </div>
                </div>
            </div>


        </main>
    </div>

</asp:Content>
