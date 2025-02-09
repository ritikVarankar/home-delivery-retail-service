<%@ Page Language="C#" MasterPageFile="~/Admin/Default.master" AutoEventWireup="true" CodeBehind="Update Order.aspx.cs" Inherits="HDRS.Admin.Update_Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div align="center" class="navbar" style=" height: auto"> 
        <div align="right"> 
            <asp:LinkButton ID="AllOrder" runat="server" OnClick="AllOrder_Click" >Show All Order List</asp:LinkButton> 
            &nbsp; 
        </div> 
        <b>Select Date:</b> 
        <asp:TextBox ID="TextBox1" runat="server" Font-Bold="True" Width="122px"></asp:TextBox> 
        <asp:ImageButton ID="ImageButton1" runat="server" Height="30px" ImageUrl="~/Admin/Images/calendar.jpg" OnClick="ImageButton1_Click" /> <br />
        <asp:Label ID="Label1" runat="server" Text="Year:" Font-Bold="True"></asp:Label>&nbsp; 
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"> </asp:DropDownList> &nbsp; 
        <asp:Label ID="Label2" runat="server" Text="Month:" Font-Bold="True"></asp:Label>&nbsp; 
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"> </asp:DropDownList> <br /> 
        <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" OnSelectionChanged="Calendar1_SelectionChanged" ShowGridLines="True" Width="220px" >
            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
            <OtherMonthDayStyle ForeColor="#CC9966" />
            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
            <SelectorStyle BackColor="#FFCC66" />
            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
        </asp:Calendar> 
        <asp:Button ID="Button1" runat="server" Text="Click" Cssclass="button" Font-Bold="True" Height="39px" Width="72px" OnClick="Button1_Click" /> <br /><br /> 
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnRowDataBound="GridView1_RowDataBound" >
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:TemplateField HeaderText="Order Status">
                    <ItemTemplate>
                        <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" GroupName="orderstatus" Text="Pending" />
                        &nbsp;<asp:RadioButton ID="RadioButton2" runat="server" GroupName="orderstatus" Text="Completed" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView> <br /> 
        <asp:Button ID="Button2" runat="server" Text="Update Status" Cssclass="button" Font-Bold="True" Height="37px" Width="136px" OnClick="Button2_Click" /> <br /><br /> 
    </div>

</asp:Content>

