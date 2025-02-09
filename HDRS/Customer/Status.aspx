<%@ Page Language="C#" MasterPageFile="~/Customer/Default.master" AutoEventWireup="true" CodeBehind="Status.aspx.cs" Inherits="HDRS.Customer.Status" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="div1" align="center" style="background-color: #99CCFF">
        <br />
        <asp:Label ID="Label1" runat="server" Text="Enter Order Id : " Font-Bold="True" Font-Size="Large"></asp:Label>
        &nbsp;<asp:TextBox ID="TextBox1" runat="server" Height="24px" Width="166px"></asp:TextBox>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Status" OnClick="Button1_Click" BackColor="#FFFF99" Font-Bold="True" Font-Size="Medium" Width="83px" Height="40px" />
        <br />
        <br />
    </div>

    <div id="div2" align="center" style="background-color: #99CCFF">
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" Visible="False" EmptyDataText="Wrong OrderId ">
            <Columns>
                <asp:BoundField DataField="orderid" HeaderText="OrderID" SortExpression="orderid">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="proname" HeaderText="Product Name" SortExpression="proname">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="proquantity" HeaderText="Quantity" SortExpression="proquantity">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="proprice" HeaderText="Price" SortExpression="proprice">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="orderdate" HeaderText="OrderDate" SortExpression="orderdate">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HDRSConnectionString %>" SelectCommand="SELECT [orderid], [proname], [proprice], [proquantity], [orderdate], [status] FROM [orderdetails] WHERE ([orderid] = @orderid)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="orderid" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <br />
        <br />

    </div>
</asp:Content>

