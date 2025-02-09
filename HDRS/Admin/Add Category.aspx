<%@ Page Language="C#" MasterPageFile="~/Admin/Default.master" AutoEventWireup="true" CodeBehind="Add Category.aspx.cs" Inherits="HDRS.Admin.Add_Category" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style1 {
        font-size: medium;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="background-color: #3399FF">
       <center>
     <table style="font-family: 'Times New Roman', Times, serif; font-size: x-large; font-style: normal; color: #000000; background-color: #FFCC99; width: 313px;">
        <tr>
            <td></td>
            <td>Add Category</td>
            <td>&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
        </tr>
        <tr>
            <td>
                <br />
                <span class="auto-style1">Category</span></td>
            <td>&nbsp;&nbsp;&nbsp;
                <br />
                <asp:TextBox ID="TextBox1" runat="server"/></td>
            <td>
                <br />
            </td>
        </tr>
         <tr>
            
             <td colspan="3" align="center">
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                     ErrorMessage="Enter Category Name" ControlToValidate="TextBox1" 
                     Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
             </td>
            
         </tr>
         <tr>
             <td colspan="3" align="center">
                 <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" BackColor="#FFCC00" BorderColor="#FFCC00" Font-Bold="True" Font-Size="Medium" Height="33px" Width="60px" />
             </td>
         </tr>
         <tr>
             <td colspan="3">
                 </td>
             </tr>
         <tr>
             <td colspan="3" align="center">
             <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderWidth="1px" DataKeyNames="catid" EmptyDataText="No Record to be displayed" Font-Bold="True" HeaderStyle-BorderWidth="3px" BackColor="White" BorderColor="#CC9966" BorderStyle="None" CellPadding="4" Font-Size="Large" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" PageSize="4" Width="257px">
                 <Columns>
                     <asp:TemplateField HeaderText="Category">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox2" runat="server" Font-Bold="True" Height="23px" Text='<%# Eval("catname") %>' Width="131px"></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label2" runat="server" Text='<%# Eval("catname") %>'></asp:Label>
                         </ItemTemplate>
                         <ItemStyle HorizontalAlign="Center" />
                     </asp:TemplateField>
                     <asp:CommandField CausesValidation="False" HeaderText="Operations" ShowDeleteButton="True" ShowEditButton="True">
                     <ItemStyle HorizontalAlign="Center" />
                     </asp:CommandField>
                 </Columns>
                 <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
<HeaderStyle BorderWidth="3px" BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC"></HeaderStyle>
                 <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                 <RowStyle BackColor="White" ForeColor="#330099" />
                 <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                 <SortedAscendingCellStyle BackColor="#FEFCEB" />
                 <SortedAscendingHeaderStyle BackColor="#AF0101" />
                 <SortedDescendingCellStyle BackColor="#F6F0C0" />
                 <SortedDescendingHeaderStyle BackColor="#7E0000" />
                 </asp:GridView></td>
         </tr>
        </table>
           </center>
       </div>
</asp:Content>


