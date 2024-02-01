<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="SureshThagunna_BookStore.CheckOut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Checkout</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.2.3.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <header class="jumbotron"><%-- image set in site.css --%></header>
        <main>
            <form id="form1" runat="server" class="form-horizontal"
                defaultfocus="txtEmail1" defaultbutton="btnCheckOut">

                <h1>Check Out Page</h1>

                <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                    CssClass="text-danger summary"
                    HeaderText="Please correct these entries:" />

                <%-- contact info --%>
                <h3>Contact Information</h3>
                <div class="form-group">
                    <label class="control-label col-sm-3">Email Address:</label>
                    <div class="col-sm-5">
                        <asp:TextBox ID="txtEmail1" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                    </div>
                    <div class="col-sm-4">
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
                    <label class="control-label col-sm-3">Email Re-entry:</label>
                    <div class="col-sm-5">
                        <asp:TextBox ID="txtEmail2" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvEmail2" runat="server"
                            ErrorMessage="Email re-entry" CssClass="text-danger"
                            Display="Dynamic" ControlToValidate="txtEmail2">Required</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvEmail2" runat="server"
                            ErrorMessage="Email re-entry" CssClass="text-danger" Display="Dynamic"
                            ControlToValidate="txtEmail2" ControlToCompare="txtEmail1">Must match first email address</asp:CompareValidator>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-3">First Name:</label>
                    <div class="col-sm-5">
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
                            ErrorMessage="First name" CssClass="text-danger"
                            Display="Dynamic" ControlToValidate="txtFirstName">Required</asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-3">Last Name:</label>
                    <div class="col-sm-5">
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server"
                            ErrorMessage="Last name" CssClass="text-danger"
                            Display="Dynamic" ControlToValidate="txtLastName">Required</asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-3">Phone Number:</label>
                    <div class="col-sm-5">
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                    </div>
                    <div class="col-sm-4">
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
                <h3>Billing Address</h3>
                <div class="form-group">
                    <label class="control-label col-sm-3">Address:</label>
                    <div class="col-sm-5">
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvStreetAddress" runat="server"
                            ErrorMessage="Billing address" Text="Required"
                            CssClass="text-danger" Display="Dynamic"
                            ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-3">City:</label>
                    <div class="col-sm-5">
                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvCity" runat="server"
                            ErrorMessage="Billing city" Text="Required" CssClass="text-danger"
                            Display="Dynamic" ControlToValidate="txtCity"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-3">State:</label>
                    <div class="col-sm-5">
                        <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control">
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
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvState" runat="server"
                            ErrorMessage="Billing state" Text="Required" CssClass="text-danger"
                            Display="Dynamic" ControlToValidate="ddlState"></asp:RequiredFieldValidator>
                    </div>
                </div>


                <div class="form-group">
                    <label class="control-label col-sm-3">Zip code:</label>
                    <div class="col-sm-5">
                        <asp:TextBox ID="txtZip" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvZip" runat="server"
                            ErrorMessage="Billing zip code" Text="Required" CssClass="text-danger"
                            Display="Dynamic" ControlToValidate="txtZip"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <%-- buttons --%>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-9">
                        <asp:Button ID="btnCheckOut" runat="server" Text="Place Order" CssClass="btn"
                            OnClick="btnCheckOut_Click" />
                        <asp:LinkButton ID="lbtnContinueShopping" runat="server" CssClass="btn"
                            PostBackUrl="~/Cart.aspx" CausesValidation="False">Go back to Cart</asp:LinkButton>
                    </div>
                </div>

            </form>
        </main>

    </div>
</body>
</html>
