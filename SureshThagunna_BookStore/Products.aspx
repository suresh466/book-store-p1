<%@ Page Title="Products" Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="SureshThagunna_BookStore.Products" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <main>
            <div class="row">
                <%-- row 1 --%>
                <div class="col-sm-8">

                    <%-- Book drop down column --%>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <h4>
                                <asp:DropDownList ID="ddlGenres" runat="server" AutoPostBack="True"
                                    DataSourceID="sqlGenresSource" DataTextField="Name" DataValueField="Id">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sqlGenresSource" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:sureshthagunna_bookstore %>"
                                    SelectCommand="SELECT [Id], [Name] FROM [Genre] ORDER BY [Name]">
                                </asp:SqlDataSource>
                            </h4>
                        </div>
                    </div>

                    <%-- Book drop down column --%>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <h5></h5>
                            <asp:DropDownList ID="ddlBooks" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlBooks_SelectedIndexChanged"
                                DataSourceID="SqlBooksSource" DataTextField="Title" DataValueField="Id">
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

                    <div class="form-group">
                        <h4>
                            <asp:Label ID="lblName" runat="server"></asp:Label>
                        </h4>
                        <div class="col-sm-12">
                            <asp:Label ID="lblUnitPrice" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>

                <%-- product image column --%>
                <div class="col-sm-4">
                    <asp:Image ID="imgProduct" runat="server" />
                </div>
            </div>
            <%-- end of row 1 --%>

            <%-- row 2 --%>
            <div class="row">
                <div class="col-sm-12">
                    <div class="form-group">
                        <label class="col-sm-1">Quantity:</label>
                        <div class="col-sm-3">
                            <asp:TextBox ID="txtQuantity" runat="server"
                                CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-8">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger"
                                runat="server" ControlToValidate="txtQuantity" Display="Dynamic"
                                ErrorMessage="Quantity is a required field."></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="text-danger"
                                ControlToValidate="txtQuantity" Display="Dynamic"
                                ErrorMessage="Quantity must range from 1 to 500."
                                MaximumValue="500" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <asp:Button ID="btnAdd" runat="server" Text="Add to Cart"
                                OnClick="btnAdd_Click" CssClass="btn" />
                            <asp:Button ID="btnCart" runat="server" Text="Go to Cart"
                                PostBackUrl="~/Cart.aspx" CausesValidation="False" CssClass="btn" />
                        </div>
                    </div>
                </div>
            </div>
            <%-- end of row 2 --%>
        </main>
    </div>

</asp:Content>
