<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="SureshThagunna_BookStore.Cart" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-sm-6">
            <div class="form-group">
                <div class="col-sm-12">
                    <asp:ListBox ID="lstCart" runat="server" CssClass="form-control">
                        <asp:ListItem>Product 1</asp:ListItem>
                        <asp:ListItem>Product 2</asp:ListItem>
                        <asp:ListItem>Product 3</asp:ListItem>
                    </asp:ListBox>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="form-group">
                <div class="col-sm-12">
                    <asp:Button ID="btnRemove" runat="server" Text="Remove Item" CssClass="btn" />
                </div>
                <div class="col-sm-12">
                    <asp:Button ID="btnEmpty" runat="server" Text="Empty Cart" CssClass="btn" />
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="form-group">
                <asp:Label ID="lblMessage" runat="server" EnableViewState="False" CssClass="text-info col-sm-12"></asp:Label>
            </div>
            <div class="form-group">
                <div class="col-sm-12">
                    <asp:Button ID="btnContinue" runat="server" PostBackUrl="~/Products.aspx" Text="Continue Shopping" CssClass="btn" />
                    <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" CssClass="btn" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
