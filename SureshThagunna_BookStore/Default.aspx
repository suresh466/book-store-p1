<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SureshThagunna_BookStore._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-4">
        <main>
            <section class="row" aria-labelledby="aspnetTitle">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-body">
                            <h1 id="aspnetTitle" class="card-title">Open Book Store</h1>
                            <p class="lead card-text">Open Book Store is bringing forth the concept of open source into books industry.</p>
                            <asp:Button ID="btnStartShopping" runat="server" Text="Start Shopping" PostBackUrl="~/Products.aspx" CssClass="btn btn-primary" />
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </div>

</asp:Content>
