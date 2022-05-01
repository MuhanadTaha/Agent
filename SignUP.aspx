<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUP.aspx.cs" Inherits="SignUP" enableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />

      <meta name="keywords" content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
      <meta name="author" content="Codedthemes" />
      <!-- Favicon icon -->

      <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
      <!-- Google font-->
      <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
      <!-- Required Fremwork -->
      <link rel="stylesheet" type="text/css" href="assets/css/bootstrap/css/bootstrap.min.css">
      <!-- waves.css -->
      <link rel="stylesheet" href="assets/pages/waves/css/waves.min.css" type="text/css" media="all">
      <!-- themify-icons line icon -->
      <link rel="stylesheet" type="text/css" href="assets/icon/themify-icons/themify-icons.css">
      <!-- ico font -->
      <link rel="stylesheet" type="text/css" href="assets/icon/icofont/css/icofont.css">
      <!-- Font Awesome -->
      <link rel="stylesheet" type="text/css" href="assets/icon/font-awesome/css/font-awesome.min.css">
      <!-- Style.css -->
      <link rel="stylesheet" type="text/css" href="assets/css/style.css">
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <body themebg-pattern="theme1">
 
  <div class="theme-loader">
      <div class="loader-track">
          <div class="preloader-wrapper">
              <div class="spinner-layer spinner-blue">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
              <div class="spinner-layer spinner-red">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>

              <div class="spinner-layer spinner-yellow">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>

              <div class="spinner-layer spinner-green">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
          </div>
      </div>
  </div>
  <!-- Pre-loader end -->

    <section class="login-block">
        <!-- Container-fluid starts -->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <!-- Authentication card start -->

                        <form class="md-float-material form-material">
                            <div class="text-center">
                                <img src="image/TrustPa.png" alt="logo.png" style="width:100px">
                            </div>
                            <div class="auth-box card">
                                <div class="card-block">
                                    <div class="row m-b-20">
                                        <div class="col-md-12">
                                            <h3 class="text-center">Sign Up</h3>
                                        </div>
                                    </div>
                                    <div class="form-group form-primary">
                                        
                                        <asp:TextBox autocomplete="off" ID="txtUsername" runat="server"  class="form-control"/>

                                       
                                        <span class="form-bar"></span>
                                        <label class="float-label">Username</label>

                                        <div>
                                             <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Username required" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="form-group form-primary">
                                        
                                        <asp:TextBox ID="txtPassword" runat="server" type="password" class="form-control" ></asp:TextBox>
                                        
                                        <span class="form-bar"></span>


                                        <label class="float-label">Password</label>
                                        <div>
                                         <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Password required" ControlToValidate="txtpassword"></asp:RequiredFieldValidator>
                                        </div>
                                        <asp:TextBox ID="txtAddress" runat="server" class="form-control" ></asp:TextBox>
                                        <div>
                                            <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                                        </div>
                                        <div>
                                        <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Address required" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>

                                        </div>

                                        <asp:TextBox ID="txtPhone" runat="server" class="form-control" ></asp:TextBox>
                                        <div>
                                            <asp:Label ID="lblPhone" runat="server" Text="Phone"></asp:Label>
                                        </div>
                                        <div>
                                        <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Phone Number is required" ControlToValidate="txtPhone"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-12">
                                            <asp:Label class="text-danger" ID="lblMessage" runat="server" Text=""></asp:Label>
                                        </div>

                                    </div>
                                   
                                    <div class="row m-t-30">
                                        <div class="col-md-12">
                                             <asp:Button ID="Button1" OnClick="SignUp_Click" runat="server" Text="Sign Up" class="btn btn-primary btn-md btn-block waves-effect waves-light text-center m-b-20"/>
                                            <div>
                                             <asp:Label ID="LblErMe" runat="server" Text="There is an error in email or password" Visible="False" ></asp:Label>
                                            </div>
                                        </div> 
                                    </div>
                                    <hr/>
                                    <div class="row">
                                        <div class="col-md-10">
                                            
                                            <p class="text-inverse text-left"><a href="Default.aspx"><b>Back to Login</b></a></p>
                                        </div>
                                        <div class="col-md-2">
                                            <img src="assets/images/auth/Logo-small-bottom.png" alt="small-logo.png">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                      
                </div>
                
            </div>
            
        </div>
        
    </section>
   
<script type="text/javascript" src="assets/js/jquery/jquery.min.js "></script>
<script type="text/javascript" src="assets/js/jquery-ui/jquery-ui.min.js "></script>
<script type="text/javascript" src="assets/js/popper.js/popper.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap/js/bootstrap.min.js "></script>
<!-- waves js -->
<script src="assets/pages/waves/js/waves.min.js"></script>
<!-- jquery slimscroll js -->
<script type="text/javascript" src="assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
<script type="text/javascript" src="assets/js/common-pages.js"></script>
</body>
    </div>
    </form>
</body>
</html>
