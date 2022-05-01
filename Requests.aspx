<%@ Page Title="Requests" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" enableEventValidation="false" CodeFile="Requests.aspx.cs" Inherits="Requests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>

    <div style="padding:10px; background-color:white;" runat="server">
        <%--DataKeyNames="username"--%>
    
    <asp:GridView ID="GridView1" OnRowCommand="GV_OnRowCommand" runat="server" Width="100%" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4"  ForeColor="Black" GridLines="Horizontal" >
        <Columns>
            <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
            <asp:BoundField DataField="UserTypeName" HeaderText="User Type" SortExpression="UserTypeName" />
            <asp:BoundField DataField="idUserType" HeaderText="ID" SortExpression="idUserType" />
            <asp:ButtonField ButtonType="Button" Text="Accept" ItemStyle-Width="10%" CommandName="AcceptCommand">
            <ControlStyle CssClass="btn btn-primary btn-sm" />

<ItemStyle Width="10%"></ItemStyle>
            </asp:ButtonField>
            <asp:ButtonField ButtonType="Button" Text="Delete" ItemStyle-Width="10%" CommandName="DeleteCommand">
            <ControlStyle CssClass="btn btn-danger btn-sm"  />

<ItemStyle Width="10%"></ItemStyle>
            </asp:ButtonField>
        </Columns>
        
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#ccccff" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />

    </asp:GridView>
        </div>
        </center>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" SelectCommand="SELECT username,UserTypeName,idUserType FROM UserPermissions Inner JOIN Requests ON UserPermissions.idUserType = Requests.userRoleID ">
    </asp:SqlDataSource>

    <asp:GridView ID="GridView2" runat="server"></asp:GridView>
</asp:Content>

