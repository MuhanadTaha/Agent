<%@ Page Title="Categories" Language="C#" MasterPageFile="~/MasterPage.master" enableEventValidation="false" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container ">
        <div style="background-color:white; width:100%" runat="server" id="divAgent" >
     <center>
       <table style="font-weight:bolder; padding:10px;">
            <tr>
                <td><asp:FileUpload ID="FileUpload1" runat="server" class="form-control" required /> </td>
                <td><asp:TextBox ID="txtName" runat="server" placeholder="Product Name" required class="form-control"></asp:TextBox></td>
                <td><asp:TextBox ID="txtDescription" runat="server" placeholder="Description" required class="form-control"></asp:TextBox></td>
                <td><asp:TextBox ID="txtPrice" runat="server" placeholder="Price"  type="number" step="0.01" required class="form-control"></asp:TextBox></td>
                <td><asp:Button ID="btnAdd" OnClick="btnAdd_Click" runat="server"  Text="Add New Product" CssClass="btn btn-primary btn-sm" ></asp:Button></td>
            </tr>
            <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td><asp:DropDownList ID="ddlProducts" runat="server" Width="100%"></asp:DropDownList></td>
                  <td> <asp:Button ID="btnDeleteComponent" runat="server" formnovalidate Text="Delete Product" CssClass="btn btn-danger btn-sm" Width="100%" OnClick="btnDeleteComponent_Click" ></asp:Button></td>
            </tr>
        </table>
    </center>
    </div>
        <asp:DataList ID="DataList1"  RepeatDirection="Horizontal" RepeatColumns="3" runat="server" OnItemCommand="dlReplies_ItemCommand" >
        <ItemTemplate>
            <div style="border-radius:5px; padding:10px;" runat="server" class="btn1">
                 <center>
                  <table style="width:280px">
                    <tr>
                    <asp:Image ID="imgCategories" runat="server" style="width:230px;height:180px" ImageUrl='<%# "~/Images/ImageProducts/" + Eval("Image") %>' />
                    <br /><br />
                    <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>' ></asp:Label>
                     <br /><br />
                    <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("Price") %>' style="font-weight:bold;"></asp:Label> $
                    <br /> <br />
                    <asp:Label ID="lblDetails" runat="server" Text='<%#Eval("Details") %>' style="font-weight:bold;"></asp:Label>
                    <br /><br />
                    <asp:Button ID="btnBuy"  CommandName="Add" runat="server" Text="Buy" CssClass="btn btn-primary btn-sm"></asp:Button>
                    </tr>
                  </table>
                </center>
            </div>
        </ItemTemplate>
    </asp:DataList>
    </div>
</asp:Content>

