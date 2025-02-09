<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HDRS.Customer.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            font-size: x-large;
        }
        .auto-style2 {
            width: 10px;
        }
        .auto-style3 {
            color: #FFFFFF;
        }
    </style>
</head>
<body style="background-color: #33CCFF">
    <form id="form1" runat="server">
    <div>
        <center>
    <table style="background-color: #6666FF; width: 442px; height: 431px; margin-top: 43px;">
        <tr>
            <td></td>
            <td colspan="3" class="auto-style1"><strong>
                <br />
                <span class="auto-style3">Login Page</span><br />
                <br />
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Customer/Images/login logo.png" Width="170px" Height="127px"></asp:Image> 
                <br />
                </strong></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td><strong>Email Id</strong></td>
            <td class="auto-style2"></td>
            <td>
                <br />
                <asp:TextBox ID="TextBox1" runat="server" Height="16px" Width="178px"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Enter Email" ForeColor="Red" ValidationGroup="Group1"></asp:RequiredFieldValidator>
            &nbsp;<br />
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="TextBox1" ErrorMessage="Enter Valid Email" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                     ForeColor="Red"></asp:RegularExpressionValidator>
                <br />
            </td>
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td></td>
            <td><strong>Password</strong></td>
            <td class="auto-style2"></td>
            <td>
                <br />
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Width="140px"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" 
                    ErrorMessage="Enter Password" ForeColor="Red" ValidationGroup="Group1"></asp:RequiredFieldValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td class="auto-style2"></td>
            <td>
                <br />
                <asp:Button ID="Button1" runat="server" Text="Login" ValidationGroup="Group1"
                     OnClick="Button1_Click" Height="34px" Width="87px" BackColor="Yellow" BorderColor="Yellow" Font-Bold="True" />
                <br />
                <br />
               <asp:HyperLink ID="HyperLink1" runat="server" Text="Registration" 
                   NavigateUrl="~/Customer/Registration.aspx" ForeColor="#CC0000" Font-Bold="True" Font-Size="Large"></asp:HyperLink>
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" ForeColor="Red" Font-Bold="True" Font-Size="Large">Please enter valid username and Password</asp:Label>
            </td>
            <td></td>
        </tr>
    </table>
            </center>
    </div>
    </form>
</body>
</html>

