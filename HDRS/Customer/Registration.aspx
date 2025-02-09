<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="HDRS.Customer.Registration" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
            color: #FFFFFF;
        }
        .auto-style2 {
            height: 71px;
        }
        .auto-style3 {
            height: 53px;
        }
        .auto-style4 {
            width: 11px;
        }
        .auto-style5 {
            height: 71px;
            width: 11px;
        }
        .auto-style6 {
            height: 53px;
            width: 11px;
        }
    </style>
</head>
<body style="background-color: #00FFCC">
    <form id="form1" runat="server">
    <div>
        <center>
    <table style="background-color: #66FF66; height: 548px; width: 557px; margin-right: 0px; margin-top: 40px; margin-left: 0px;">
        <tr>
            <td colspan="5" align="center" class="auto-style1"><strong>
                <br />
                Registration<br />
                </strong></td>
        </tr>
        <tr>
            <td></td>
            <td>First Name</td>
            <td></td>
            <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Enter First Name" 
                    ValidationGroup="Group1" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style4"></td>
        </tr>
        <tr>
            <td></td>
            <td>Last Name</td>
            <td></td>
            <td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Enter Last Name" 
                    ValidationGroup="Group1" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style4"></td>
        </tr>
        <tr>
            <td></td>
            <td>Email ID</td>
            <td></td>
            <td><asp:TextBox ID="TextBox3" runat="server" Width="154px"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Enter Email" 
                    ValidationGroup="Group1" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Enter Valid Email" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="Group1" ForeColor="Red"></asp:RegularExpressionValidator>
            </td>
            <td class="auto-style4"></td>
        </tr>
        <tr>
            <td></td>
            <td>Gender</td>
            <td colspan="2">
               <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                   <asp:ListItem Value="Male">Male</asp:ListItem>
                   <asp:ListItem Value="Female">Female</asp:ListItem>
                   <asp:ListItem Value="Other">Other</asp:ListItem>
               </asp:RadioButtonList>
            </td>
            <td class="auto-style4"></td>
        </tr>
        <tr>
            <td></td>
            <td>Phone Number</td>
            <td></td>
            <td><asp:TextBox ID="TextBox4" runat="server" TextMode="Phone"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Enter Phone Number" 
                    ValidationGroup="Group1" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox4" 
                    Display="Dynamic" ErrorMessage="Valid Mobile Number" ValidationGroup="Group1" 
                    MaximumValue="9999999999" MinimumValue="0000000000" Type="Double" ForeColor="Red"></asp:RangeValidator>
            </td>
            <td class="auto-style4"></td>
        </tr>

        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style2">Address</td>
            <td class="auto-style2"></td>
            <td class="auto-style2"><asp:TextBox ID="TextBox7" runat="server" Height="39px" Width="162px" TextMode="MultiLine"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox7" Display="Dynamic"
                    ErrorMessage="Enter address" ValidationGroup="Group1" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style5"></td>
        </tr>
        <tr>
            <td class="auto-style3"></td>
            <td class="auto-style3">Password</td>
            <td class="auto-style3"></td>
            <td class="auto-style3"><asp:TextBox ID="TextBox5" runat="server" TextMode="Password" ></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox5" Display="Dynamic" 
                    ErrorMessage="Enter Password" ValidationGroup="Group1" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style6"></td>
        </tr>
        <tr>
            <td></td>
            <td>Confirm Password</td>
            <td></td>
            <td><asp:TextBox ID="TextBox6" runat="server" TextMode="Password"></asp:TextBox>
                <br />
                <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                <br />
            </td>
            <td class="auto-style4"></td>
        </tr>
         <tr>
            <td colspan="5" align="center"><asp:Button ID="Button1" runat="server" Text="Register"  
                    ValidationGroup="Group1" Height="35px" Width="85px" 
                    style="text-align: center" OnClick="Button1_Click" BackColor="#FFFF66" BorderColor="#FFFF66" Font-Bold="True" Font-Size="Medium" ForeColor="Black"></asp:Button></td>
           </tr>
        <tr>
            <td colspan="2" align="left">
                <asp:Label ID="Label2" runat="server" style="text-align: center; font-size: x-large;" Font-Bold="True" Font-Size="Medium" ForeColor="#0000CC"></asp:Label>
                <br />
                <asp:Label ID="Label3" runat="server" Text="Label" Font-Bold="True" Font-Size="Large" ForeColor="Red" style="font-size: x-large; text-align: center"></asp:Label>
            </td>
            <td></td>
            <td colspan="2" align="right">
                <asp:HyperLink ID="HyperLink1" runat="server" 
                Text="Login Page" NavigateUrl="~/Customer/Login.aspx" style="text-align: right" Font-Bold="True" Font-Size="Large"></asp:HyperLink>
            &nbsp;&nbsp;
            </td>
        </tr>
    </table>
            </center>
    </div>
    </form>
</body>
</html>

