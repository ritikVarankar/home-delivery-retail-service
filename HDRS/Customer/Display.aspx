<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Display.aspx.cs" Inherits="HDRS.Customer.Display" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 102%;
        }
        .auto-style3 {
            font-size: large;
            text-decoration: underline;
        }
        .auto-style4 {
            height: 30px;
            width: 400px;
        }
        .auto-style5 {
            height: 285px;
            width: 400px;
        }
        .auto-style6 {
            font-size: large;
            height: 34px;
            background-color: #666666;
            text-align: left;
            width: 400px;
        }
        .auto-style7 {
            background-color: #FFFFFF;
            width: 400px;
        }
        .auto-style8 {
            font-size: large;
            background-color: #666666;
            text-align: left;
            width: 400px;
        }
        .auto-style9 {
            height: 43px;
            background-color: #666666;
            text-align: left;
            width: 400px;
        }
        .auto-style10 {
            height: 24px;
            background-color: #666666;
            text-align: left;
            width: 400px;
        }
        .auto-style11 {
            text-decoration: underline;
            text-align: left;
        }
    </style>
</head>
<body style="background-color: #66FF99">
    <form id="form1" runat="server">
    <div align="center">
    
        <asp:DataList ID="DataList1" runat="server" DataKeyField="proid" DataSourceID="SqlDataSource1" RepeatColumns="1" OnItemCommand="DataList1_ItemCommand" style="margin-top: 57px; margin-right: 9px;" Width="530px">
            <ItemTemplate>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style4" align="center" style="background-color: #3399FF">
                            &nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" style="text-decoration: underline" Text='<%# Eval("proname") %>' ForeColor="White"></asp:Label>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style5" align="center" style="background-color: #CCCCCC">
                            <asp:Image ID="Image1" runat="server" BorderColor="#5F98F3" BorderWidth="1px" Height="279px" ImageUrl='<%# Eval("proimage") %>' Width="278px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style6" style="background-color: #FFFFFF"><strong><span class="auto-style11">Category:</span>&nbsp;
                            <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Size="Medium" Text='<%# Eval("procategory") %>'></asp:Label>
                            </strong></td>
                    </tr>
                    <tr>
                        <td class="auto-style9" style="background-color: #FFFFFF"><span class="auto-style3"><strong>Description:</strong></span>&nbsp;
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label3" runat="server" style="font-size: medium" Text='<%# Eval("prodesc") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style8" style="background-color: #FFFFFF">
                            <span class="auto-style3"><strong>Quantity:</strong></span>
                            &nbsp;
                            <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="72px">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style10" style="background-color: #FFFFFF"><strong><span class="auto-style3">Price:</span>&nbsp; </strong>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("proprice") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7" align="center">

                            <asp:ImageButton ID="ImageButton1" runat="server" Height="40px" 
                                ImageUrl="~/Customer/Images/addcart.jpg" Width="134px" 
                                  CommandArgument='<%# Eval("proid") %>'     CommandName="AddtoCart" />

                        </td>
                    </tr>
                </table>
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HDRSConnectionString %>" SelectCommand="SELECT * FROM [product] WHERE ([proid] = @proid)">
            <SelectParameters>
                <asp:QueryStringParameter Name="proid" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

