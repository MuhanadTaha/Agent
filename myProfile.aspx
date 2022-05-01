<%@ Page Title="Profile" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="myProfile.aspx.cs" Inherits="myProfile" enableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

 <link  type="text/css" rel="stylesheet" href="assets/css/profileSettings.css"/>
    	
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
            
                <%-- /////// --%>
 <div class="profile-pic-wrapper">
  <div class="pic-holder">
    <!-- uploaded pic shown here -->
   
      <asp:Image ID="imageUser" runat="server" class="pic" /> 

    
    <input class="uploadProfileInput" type="file" name="profile_pic" id="newProfilePhoto" accept="images/*" style="display: none;" />

  </div>

  </hr>
  <p class="text-info text-center small">
      <asp:FileUpload ID="FileUpload1" runat="server" />
      <br />
  </p>
     <div>
      <asp:Button ID="btnChangeImage" runat="server" Text="Save Image" CssClass="btn btn-primary btn-sm" OnClick="btnChangeImage_Click" />

     </div>
</div>

                <%-- ////// --%>
               
                <span class="font-weight-bold">
                    <asp:Label ID="lblUsername" runat="server"></asp:Label>
                </span>
                <span class="text-black-50">
                    <asp:Label ID="lblIdNumber" runat="server" ></asp:Label>
                </span>
                
                <br />
                <div>
                    
                    
                    <%--<button class="border px-3 p-1 add-experience">
                        <i class="fa fa-plus"></i>
                        &nbsp;Add Image
                    </button> --%>                   
                </div>
            </div>
        </div>
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Profile Settings</h4>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6"><label class="labels">First Name</label><asp:TextBox ID="txtFirstNmae" runat="server" class="form-control" placeholder="first name" value=""></asp:TextBox></div>
                    <div class="col-md-6"><label class="labels">Last Name</label><asp:TextBox ID="txtLastName" runat="server" class="form-control" value="" placeholder="last name"></asp:TextBox></div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-12"><label class="labels">Mobile Number</label><asp:TextBox ID="txtPhone" runat="server" class="form-control" placeholder="enter phone number" ></asp:TextBox></div>
                    <div class="col-md-12"><label class="labels">Address</label><asp:TextBox ID="txtAddress" runat="server" class="form-control" placeholder="enter address" ></asp:TextBox></div>
                    <div class="col-md-12"><label class="labels">Postion</label><asp:TextBox ID="txtPostion" runat="server" class="form-control" placeholder="enter postion" ></asp:TextBox></div>
                    <div class="col-md-12"><label class="labels">Password</label><asp:TextBox ID="txtPass" runat="server" type="password" class="form-control" placeholder="enter password" ></asp:TextBox></div>
                    <div class="col-md-12"><label class="labels">Username</label><asp:TextBox ID="txtUsername" runat="server" class="form-control"  readonly="true"></asp:TextBox></div>

                    
                </div>
                
                <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="button"  runat="server" onserverclick="btnSave_Click">Save Profile</button></div>
            </div>
        </div>
        
    </div>
</div>


</asp:Content>

