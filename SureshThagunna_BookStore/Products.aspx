<%@ Page Title="Products Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="SureshThagunna_BookStore.Products" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="form-group">
            <div class="col-sm-8">
                <label class="col-sm-5">Please select a product:</label>
                <div class="col-sm-6">
                    <asp:DropDownList ID="ddlProducts" runat="server" AutoPostBack="True" CssClass="form-control">
                        <asp:ListItem Value="1">Product 1</asp:ListItem>
                        <asp:ListItem Value="2">Product 2</asp:ListItem>
                        <asp:ListItem Value="3">Product 3</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-8">
            <div class="form-group">
                <div class="col-sm-12">
                    <h4><asp:Label ID="lblName" runat="server" Text="Product Name"></asp:Label></h4>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12">
                    <asp:Label ID="lblShortDescription" runat="server" Text="Short Description"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12">
                    <asp:Label ID="lblLongDescription" runat="server" Text="Long Description"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12">
                    <asp:Label ID="lblUnitPrice" runat="server" Text="Unit Price"></asp:Label>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <asp:Image ID="imgProduct" runat="server" ImageUrl="~/Images/Product1.jpg" />
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="form-group">
                <label class="col-sm-1">Quantity:</label>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ControlToValidate="txtQuantity" Display="Dynamic" ErrorMessage="Quantity is a required field."></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="text-danger" ControlToValidate="txtQuantity" Display="Dynamic" ErrorMessage="Quantity must range from 1 to 500." MaximumValue="500" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12">
                    <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" CssClass="btn" />
                    <asp:Button ID="btnCart" runat="server" Text="Go to Cart" PostBackUrl="~/Cart.aspx" CausesValidation="False" CssClass="btn" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
