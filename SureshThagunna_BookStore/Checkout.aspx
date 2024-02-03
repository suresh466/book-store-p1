<%@ Page Title="Checkout" Language="C#" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="SureshThagunna_BookStore.CheckOut" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4 mx-auto" style="max-width: 600px;">
        <main>
            <div class="row">
                <div class="col-sm-12">
                    <h2>Checkout Form</h2>
                </div>
            </div>
            <div class="row">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                    CssClass="text-danger summary"
                    HeaderText="Please correct these entries:" />

                <%-- contact info --%>
                <h4 class="mt-3">Contact Information</h4>
                <div class="form-group">
                    <label class="control-label ">Email Address:</label>
                    <div class="">
                        <asp:TextBox ID="txtEmail1" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                    </div>
                    <div class="">
                        <asp:RequiredFieldValidator ID="rfvEmail1" runat="server"
                            ErrorMessage="Email address" CssClass="text-danger"
                            Display="Dynamic" ControlToValidate="txtEmail1">Required</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmail1" runat="server"
                            ErrorMessage="Email address" CssClass="text-danger"
                            Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ControlToValidate="txtEmail1">Must be a valid email address</asp:RegularExpressionValidator>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label ">Email Re-entry:</label>
                    <div class="">
                        <asp:TextBox ID="txtEmail2" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                    </div>
                    <div class="">
                        <asp:RequiredFieldValidator ID="rfvEmail2" runat="server"
                            ErrorMessage="Email re-entry" CssClass="text-danger"
                            Display="Dynamic" ControlToValidate="txtEmail2">Required</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvEmail2" runat="server"
                            ErrorMessage="Email re-entry" CssClass="text-danger" Display="Dynamic"
                            ControlToValidate="txtEmail2" ControlToCompare="txtEmail1">Must match first email address</asp:CompareValidator>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label ">First Name:</label>
                    <div class="">
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="">
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
                            ErrorMessage="First name" CssClass="text-danger"
                            Display="Dynamic" ControlToValidate="txtFirstName">Required</asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label ">Last Name:</label>
                    <div class="">
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="">
                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server"
                            ErrorMessage="Last name" CssClass="text-danger"
                            Display="Dynamic" ControlToValidate="txtLastName">Required</asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label ">Phone Number:</label>
                    <div class="">
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                    </div>
                    <div class="">
                        <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server"
                            ErrorMessage="Phone number" CssClass="text-danger"
                            Display="Dynamic" ControlToValidate="txtPhone">Required</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPhoneNumber" runat="server"
                            ErrorMessage="Phone number" CssClass="text-danger"
                            Display="Dynamic" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
                            ControlToValidate="txtPhone">Use this format: 123-456-7890</asp:RegularExpressionValidator>
                    </div>
                </div>

                <%-- billing info --%>
                <h4 class="mt-3">Billing Address</h4>
                <div class="form-group">
                    <label class="control-label ">Address:</label>
                    <div class="">
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="">
                        <asp:RequiredFieldValidator ID="rfvStreetAddress" runat="server"
                            ErrorMessage="Billing address" Text="Required"
                            CssClass="text-danger" Display="Dynamic"
                            ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label ">City:</label>
                    <div class="">
                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="">
                        <asp:RequiredFieldValidator ID="rfvCity" runat="server"
                            ErrorMessage="Billing city" Text="Required" CssClass="text-danger"
                            Display="Dynamic" ControlToValidate="txtCity"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label ">State:</label>
                    <div class="">
                        <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control form-select">
                            <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Alberta" Value="AB"></asp:ListItem>
                            <asp:ListItem Text="British Columbia" Value="BC"></asp:ListItem>
                            <asp:ListItem Text="Manitoba" Value="MB"></asp:ListItem>
                            <asp:ListItem Text="New Brunswick" Value="NB"></asp:ListItem>
                            <asp:ListItem Text="Newfoundland and Labrador" Value="NL"></asp:ListItem>
                            <asp:ListItem Text="Nova Scotia" Value="NS"></asp:ListItem>
                            <asp:ListItem Text="Ontario" Value="ON"></asp:ListItem>
                            <asp:ListItem Text="Prince Edward Island" Value="PE"></asp:ListItem>
                            <asp:ListItem Text="Quebec" Value="QC"></asp:ListItem>
                            <asp:ListItem Text="Saskatchewan" Value="SK"></asp:ListItem>
                            <asp:ListItem Text="Northwest Territories" Value="NT"></asp:ListItem>
                            <asp:ListItem Text="Nunavut" Value="NU"></asp:ListItem>
                            <asp:ListItem Text="Yukon" Value="YT"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="">
                        <asp:RequiredFieldValidator ID="rfvState" runat="server"
                            ErrorMessage="Billing state" Text="Required" CssClass="text-danger"
                            Display="Dynamic" ControlToValidate="ddlState"></asp:RequiredFieldValidator>
                    </div>
                </div>


                <div class="form-group">
                    <label class="control-label ">Zip code:</label>
                    <div class="">
                        <asp:TextBox ID="txtZip" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
                    </div>
                    <div class="">
                        <asp:RequiredFieldValidator ID="rfvZip" runat="server"
                            ErrorMessage="Billing zip code" Text="Required" CssClass="text-danger"
                            Display="Dynamic" ControlToValidate="txtZip"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>

            <%-- buttons --%>
            <div class="row mt-4">
                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Button ID="btnCheckOut" runat="server" Text="Place Order" CssClass="btn btn-success"
                            OnClick="btnCheckOut_Click" />
                        <asp:LinkButton ID="lbtnContinueShopping" runat="server" CssClass="btn btn-primary"
                            PostBackUrl="~/Cart.aspx" CausesValidation="False">Go back to Cart</asp:LinkButton>
                    </div>
                </div>
            </div>
        </main>
    </div>
</asp:Content>
