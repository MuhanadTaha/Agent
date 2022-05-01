<%@ Page Title="Categories" Language="C#" MasterPageFile="~/MasterPage.master" enableEventValidation="false" AutoEventWireup="true" CodeFile="Categories.aspx.cs" Inherits="Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link  type="text/css" rel="stylesheet" href="assets/css/profileSettings.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div style="background-color:white; width:100%" runat="server" id="divAdmin">
     <center>
       <table style="font-weight:bolder; padding:10px;">
            <tr>
                <td><asp:FileUpload ID="FileUpload1" runat="server" class="form-control" required/> </td>
                <td><asp:TextBox ID="txtName" runat="server" placeholder="Category Name" required class="form-control"></asp:TextBox></td>
                <td><asp:TextBox ID="txtDescription" runat="server" placeholder="Description" required class="form-control"></asp:TextBox></td>
                <td><asp:Button ID="imgNewComponent" runat="server" Text="Add New Product" CssClass="btn btn-primary btn-sm" OnClick="imgNewComponent_Click"></asp:Button></td>
            </tr>
            <tr>
                  <td></td>
                  <td></td>
                  <td><asp:DropDownList ID="ddlProducts" runat="server" Width="100%"></asp:DropDownList></td>
                  <td> <asp:Button ID="btnDeleteComponent" formnovalidate runat="server" Text="Delete Product" CssClass="btn btn-danger btn-sm" Width="100%" OnClick="btnDeleteComponent_Click" ></asp:Button></td>
            </tr>
        </table>
    </center>
    </div>
    <br />
   
 <div class="container">
    <asp:DataList ID="DataList1"  RepeatDirection="Horizontal" RepeatColumns="3" runat="server" >
        <ItemTemplate>
            <div style="border-radius:5px; padding:10px;" runat="server" class="btn1">
                <a href="Products.aspx?id=<%#Eval("idCategories") %>" class="btn1">
                 <center>
                  <table style="width:280px">
                    <tr>
                    <asp:Image ID="imgCategories" runat="server" style="width:230px;height:180px" ImageUrl='<%# "~/Images/ImageCategories/" + Eval("ImageMainProducts") %>' />
                    <br /><br />
                    <asp:Label ID="lblName" runat="server" Text='<%#Eval("NameCategories") %>' ></asp:Label>
                     <br /><br />
                    <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("Description") %>' style="font-weight:bold;"></asp:Label>
                    <br /> <br />
                    </tr>
                  </table>
                </center>
                    </a>
            </div>
        </ItemTemplate>
    </asp:DataList>
 </div>
</asp:Content>

