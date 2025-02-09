<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="HDRS.Customer.Customer_payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: medium;
        }
    </style>
</head>
<body style="background-color: #66FF66">
    <form id="form1" runat="server">
    <div>
    
        <table align="center" style="margin-top:50px; width:531px; height:560px;" bgcolor="DarkCyan">
            <tr>
                <td colspan="2" align="center" style="vertical-align:top"><asp:Label ID="Label1" runat="server" Text="Card Details"
                     Font-Bold="True" Font-Size="XX-Large" ForeColor="White"></asp:Label></td>
            </tr>
            <tr>
                <td align="center" style="vertical-align:top">
                    <asp:TextBox ID="TextBox1" runat="server"  Placeholder="First Name" BorderWidth="2px" 
                        Font-Bold="True" Font-Size="Medium" Height="44px" Width="188px" BorderColor="Black"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="First Name Is Empty" ControlToValidate="TextBox1" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                         ErrorMessage="First Name Is Character" ControlToValidate="TextBox1" ForeColor="Red" ValidationExpression="^[A-Za-z]*$">*</asp:RegularExpressionValidator>
               </td>
                <td align="center" style="vertical-align:top">
                         <asp:TextBox ID="TextBox2" runat="server"  Placeholder="Last Name" BorderWidth="2px" 
                        Font-Bold="True" Font-Size="Medium" Height="44px" Width="188px" BorderColor="Black"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Last Name Is Empty" ControlToValidate="TextBox2" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                         ErrorMessage="Last Name Is Character" ControlToValidate="TextBox2" ForeColor="Red" 
                        ValidationExpression="^[A-Za-z]*$">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Image ID="Image1" runat="server" Height="161px" 
                        ImageUrl="~/Customer/Images/payment-methods-logos.png" Width="544px" />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Label ID="Label2" runat="server" Text="Card Number" 
                        ForeColor="White" Font-Bold="True" Font-Size="Large"></asp:Label>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" align="center" style="vertical-align:top">
                        <asp:TextBox ID="TextBox3" runat="server"  Placeholder="16 digits Card Number" BorderWidth="2px" Font-Bold="True" 
                            Font-Size="Medium" Height="44px" Width="442px" BorderColor="Black"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="Cart Number Is Empty" ControlToValidate="TextBox3" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                         ErrorMessage="Cart Number Must Be 16 Digits" ControlToValidate="TextBox3" ForeColor="Red" 
                        ValidationExpression="[0-9]{16}">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td align="center">
                     <asp:Label ID="Label3" runat="server" Text="Expiry Date" 
                        ForeColor="White" Font-Bold="True" Font-Size="Large"></asp:Label>
                </td>
                <td align="center">
                     <asp:Label ID="Label4" runat="server" Text="CVV" 
                        ForeColor="White" Font-Bold="True" Font-Size="Large"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="White" Text="Month:"></asp:Label>
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" Height="40px" Width="90px" >
            <asp:ListItem Value="01">January</asp:ListItem>
            <asp:ListItem Value="02">February</asp:ListItem>
            <asp:ListItem Value="03">March</asp:ListItem>
            <asp:ListItem Value="04">April</asp:ListItem>
            <asp:ListItem Value="05">May</asp:ListItem>
            <asp:ListItem Value="06">June</asp:ListItem>
            <asp:ListItem Value="07">July</asp:ListItem>
            <asp:ListItem Value="08">August</asp:ListItem>
            <asp:ListItem Value="09">September</asp:ListItem>
            <asp:ListItem Value="10">October</asp:ListItem>
            <asp:ListItem Value="11">November</asp:ListItem>
            <asp:ListItem Value="12">December</asp:ListItem>
        </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="White" Text="Year:"></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Height="40px" style="margin-left: 0px" Width="60px">
            <asp:ListItem>2021</asp:ListItem>
            <asp:ListItem>2022</asp:ListItem>
            <asp:ListItem>2023</asp:ListItem>
            <asp:ListItem>2024</asp:ListItem>
            <asp:ListItem>2025</asp:ListItem>
        </asp:DropDownList>
                    
                </td>
                <td align="center" style="vertical-align:top">
                    <asp:TextBox ID="TextBox5" runat="server"  Placeholder="# Digits" BorderWidth="2px" Font-Bold="True" 
                            Font-Size="Medium" Height="44px" Width="188px" BorderColor="Black" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ErrorMessage="CVV Is Empty" ControlToValidate="TextBox5" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                         ErrorMessage="CVV Must Be 3 Digits" ControlToValidate="TextBox5" ForeColor="Red" 
                        ValidationExpression="[0-9]{3}">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center" style="vertical-align:top; color: #FFFFFF;">
                    <strong><span class="auto-style1">Delivery Adrdress:</span><br class="auto-style1" />
                    </strong>
                    <asp:TextBox ID="TextBox6" runat="server"  Placeholder="Billing Address" BorderWidth="2px" Font-Bold="True" 
                            Font-Size="X-Large" Height="50px" Width="442px" BorderColor="Black" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ErrorMessage="Billing Address Is Empty" ControlToValidate="TextBox6" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="Button1" runat="server" Text="Submit" BackColor="Black" BorderColor="White" 
                        BorderWidth="2px" Font-Bold="True" Font-Size="Large" ForeColor="White" Height="44px" Width="188px" OnClick="Button1_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                        Font-Bold="True" ForeColor="Red" HeaderText="Fix The Following Errors" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
                        NavigateUrl="~/Customer/AddToCart.aspx">Previous Page</asp:HyperLink>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" 
                        NavigateUrl="~/Customer/Home.aspx">Home Page</asp:HyperLink>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
