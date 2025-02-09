<%@ Page Language="C#" MasterPageFile="~/Customer/Default.master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="HDRS.Customer.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:1150px; height:30px">
        <tr style="background-color:#5f98f3">
            <td colspan="2" style="text-align:right">
                <asp:Label ID="Label1" runat="server"
                     Font-Bold="True" Font-Italic="True" Font-Names="Times New Roman"></asp:Label>
                <asp:HyperLink ID="HyperLink1" runat="server" 
                    Font-Bold="True" Font-Names="Times New Roman" 
                    NavigateUrl="~/Customer/Login.aspx">Click To Login</asp:HyperLink>
                <asp:Button ID="Button1" runat="server" Text="Log Out"
                     BackColor="#FF5050" BorderColor="White" 
                    Font-Bold="True" Font-Names="Times New Roman" ForeColor="#3366FF" OnClick="Button1_Click" />
            </td>
            <td style="text-align:right">
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                    BackColor="#5F98F3" Font-Bold="True" Font-Size="Medium" ForeColor="White" 
                    OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" >
                </asp:DropDownList>
                <asp:TextBox ID="TextBox1" runat="server" Height="21px" Width="174px"></asp:TextBox>
                &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" 
                    Width="25px" Height="25px" 
                    ImageUrl="~/Customer/Images/Search Lobo.png" OnClick="ImageButton1_Click" />
            </td>
        </tr>
    </table>
    <p>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
            RepeatDirection="Horizontal" RepeatColumns="4" Height="787px" 
             style="margin-right: 0px; margin-top: 0px" Width="1098px" BorderWidth="2px" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound">
            <ItemTemplate>
                <table class="auto-style1">
                    <tr>
                        <td align="center" style="background-color: #0033CC; color: #FFFFCC">
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("proname") %>' 
                                ForeColor="White" style="font-size: x-large"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:ImageButton ID="ImageButton2" runat="server" Height="279px" Width="278px" BorderWidth="1px" BorderColor="#5F98F3" 
                                ImageUrl='<%# Eval("proimage") %>' CommandArgument='<%# Eval("proid") %>'  CommandName="ViewDetails"   />
                            <div class="stock">
                                &nbsp;Stock&nbsp;
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("proquantity") %>' 
                                    BackColor='<%# (int)Eval("proquantity") <=10 ? System.Drawing.Color.Red : System.Drawing.Color.Green %>' Font-Bold="True"></asp:Label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("proid") %>' Visible="False"></asp:Label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="color: #FFFFCC; font-family: 'Times New Roman', Times, serif; font-style: bold; background-color: #003399;" align="center">&nbsp;<asp:Label ID="Label7" runat="server" style="font-weight: 700" Text="Price: Rs."></asp:Label>
                            <asp:Label ID="Label6" runat="server" style="font-weight: 700" Text='<%# Eval("proprice") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <span class="auto-style2"><strong>Quantity:</strong></span>
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:ImageButton ID="ImageButton5" runat="server" Height="40px" 
                                ImageUrl="~/Customer/Images/addcart.jpg" Width="134px" 
                                  CommandArgument='<%# Eval("proid") %>'     CommandName="AddtoCart" />
                        </td>
                    </tr>
                </table>
                <br />
            </ItemTemplate>
        </asp:DataList>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HDRSConnectionString %>" 
            SelectCommand="SELECT * FROM [product]"></asp:SqlDataSource>
    </p>
</asp:Content>
