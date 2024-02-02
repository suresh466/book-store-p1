<%@ Page Title="Cart" Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="SureshThagunna_BookStore.Cart" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-4">
        <main>
            <div class="row">
                <div class="col-sm-12">
                    <h1>Your shopping cart</h1>
                </div>
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Cart Items</h5>
                            <asp:ListBox ID="lstCart" runat="server" CssClass="form-control"></asp:ListBox>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Actions</h5>
                            <asp:Button ID="btnRemove" runat="server" Text="Remove Item" OnClick="btnRemove_Click" CssClass="btn btn-danger mb-2" />
                            <asp:Button ID="btnEmpty" runat="server" Text="Empty Cart" OnClick="btnEmpty_Click" CssClass="btn btn-warning mb-2" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-sm-12">
                    <asp:Label ID="lblMessage" runat="server" EnableViewState="False" CssClass="text-info col-sm-12"></asp:Label>
                    <asp:Button ID="btnContinue" runat="server" PostBackUrl="~/Products.aspx" Text="Continue Shopping" CssClass="btn btn-primary mr-2" />
                    <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" OnClick="btnCheckOut_Click" CssClass="btn btn-success" />
                </div>
            </div>
        </main>
    </div>

</asp:Content>