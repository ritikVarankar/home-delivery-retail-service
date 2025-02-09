<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pdfgenerate.aspx.cs" Inherits="HDRS.Customer.pdfgenerate" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" Text="Download Invoice"
             BackColor="Silver" Font-Bold="True" Font-Size="X-Large" Height="49px" OnClick="Button1_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True"
             Font-Size="X-Large" NavigateUrl="~/Customer/Home.aspx">Go To Home</asp:HyperLink>
        <asp:Panel ID="Panel1" runat="server">
        <table border="1">
            <tr>
                <td style="text-align:center">
                    <h2 style="text-align:center">Retail Invoice</h2>
                </td>
            </tr>
            <tr>
                <td>
                    Order No:<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label> <br /> <br />
                    Order Date:<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                Delivery Address:<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                <br />
                                Seller Address:
                                <br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; R.No.03,Laxmi Chawl, Tulshet Pada,
                                <br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Bhandup[W.], Mumbai-400078.
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="1000px">
                        <Columns>
                            <asp:BoundField DataField="srno" HeaderText="Sr.No.">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="proid" HeaderText="Product Id">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="proname" HeaderText="Product Name">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="proquantity" HeaderText="Quantity">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="proprice" HeaderText="Price">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="totalprice" HeaderText="Total Price">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                        </Columns>

                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    Total Amount:
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center">This is computer generated invoice and does not required signature</td>
            </tr>
        </table>
            </asp:Panel>
    </div>
    </form>
</body>
</html>
