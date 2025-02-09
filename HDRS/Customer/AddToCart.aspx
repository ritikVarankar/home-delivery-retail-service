<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddToCart.aspx.cs" Inherits="HDRS.Customer.AddToCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color: #66FF99"  >
    <form id="form1" runat="server">
    <div align="center">
    <h2>You Have Following Order In List</h2>
        <br /><br />
        <asp:HyperLink ID="HyperLink1" runat="server" 
            Font-Bold="True" Font-Names="Times New Roman" 
            Font-Size="Large" NavigateUrl="~/Customer/Home.aspx">Continue Shopping</asp:HyperLink>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" Font-Size="Medium" OnClick="LinkButton1_Click">ClearCart</asp:LinkButton>
        <br /><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" EmptyDataText="No Product In Your Cart " Font-Bold="True" ForeColor="Black" Height="257px" ShowFooter="True" Width="1000px" OnRowDeleting="GridView1_RowDeleting">
            <Columns>
                <asp:BoundField DataField="srno" HeaderText="Sr.No.">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="proid" HeaderText="Product ID">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="proname" HeaderText="ProductName">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="prodesc" HeaderText="Product Description">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:ImageField DataImageUrlField="proimage" HeaderText="Product Image">
                    <ControlStyle Height="300px" Width="300px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:ImageField>
                <asp:BoundField DataField="proprice" HeaderText="Price">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="proquantity" HeaderText="Quantity">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="totalprice" HeaderText="Total Price">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="Gray" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <br /><br />
        <asp:Button ID="Button1" runat="server" Text="Payment" OnClick="Button1_Click" BackColor="#FF9966" BorderColor="#FF6600" Font-Bold="True" Font-Size="Large" ForeColor="Red" Height="38px" style="margin-top: 0px" Width="116px"   />
        <br />
    </div>
    </form>
</body>
</html>
