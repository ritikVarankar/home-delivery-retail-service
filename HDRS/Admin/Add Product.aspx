<%@ Page Language="C#" MasterPageFile="~/Admin/Default.master" AutoEventWireup="true" CodeBehind="Add Product.aspx.cs" Inherits="HDRS.Admin.Add_Product" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 121px;
        }
        .auto-style2 {
            width: 121px;
            font-size: x-large;
            font-weight: 700;
            color: #000000;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="background-color: #0099FF">
        <center>
    <table style="font-family: 'times New Roman', Times, serif; background-color: #66FFCC; width: 572px; height: 567px;">
        <tr>
            <td class="auto-style2" colspan="4" align="center"> Add Products</td>
            </tr>
        <tr>
            <td></td>
            <td class="auto-style1">Category</td>
            <td><asp:DropDownList ID="DropDownList1" runat="server" 
                DataSourceID="SqlDataSource1" DataTextField="catname"
                 DataValueField="catname"></asp:DropDownList>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="DropDownList1" Display="Dynamic" ErrorMessage="Category Is Mandatory" 
                    Font-Bold="True" Font-Size="Large" InitialValue="Select" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td class="auto-style1">Product Name</td>
            <td><asp:TextBox ID="TextBox1" runat="server" Height="20px" Width="147px"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                     ErrorMessage="Enter Product Name" ControlToValidate="TextBox1" Display="Dynamic" 
                    Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td class="auto-style1">Product Description</td>
            <td><asp:TextBox ID="TextBox2" TextMode="MultiLine" runat="server" Height="36px" Width="189px"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Enter Product Description" 
                    Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td class="auto-style1">Image</td>
            <td><asp:FileUpload ID="FileUpload1" runat="server" Height="29px" Width="222px" />
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="FileUpload1" Display="Dynamic" ErrorMessage="File Image Is Mandatory"
                     Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td class="auto-style1">Product Price</td>
            <td><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                     ErrorMessage="Enter Product Price" ControlToValidate="TextBox3" Display="Dynamic" 
                    Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Price Is Invalid" 
                    Font-Bold="True" ForeColor="Red" ValidationExpression="[0-9]*"></asp:RegularExpressionValidator>
            </td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td class="auto-style1">Product Quantity</td>
            <td><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Enter Product Quantity" 
                    Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                &nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Quantity Is Mandatory" 
                    Font-Bold="True" ForeColor="Red" ValidationExpression="[0-9]*"></asp:RegularExpressionValidator>
            </td>
            <td></td>
        </tr>
        <tr>
            <td colspan="4" align="center">
            <asp:Button ID="Button1" runat="server" Text="Add" Font-Bold="True" ForeColor="Black" Height="36px" Width="84px" OnClick="Button1_Click" BackColor="#FFCC00" BorderColor="#FFCC00" Font-Size="Medium"></asp:Button>    
            </td>
            </tr>
        <tr>
            <td colspan="4">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                 ForeColor="Red" HeaderText="Fix The Following Error"></asp:ValidationSummary>    
            </td>
            </tr>
        <tr>
            <td colspan="4">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HDRSConnectionString %>"
                     SelectCommand="SELECT * FROM [category]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
            </center>
        </div>
</asp:Content>


