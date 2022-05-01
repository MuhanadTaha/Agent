<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us</title>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon" />
   
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet" />
    
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap/css/bootstrap.min.css" />
    
    <link rel="stylesheet" href="assets/pages/waves/css/waves.min.css" type="text/css" media="all" />
    
    <link rel="stylesheet" type="text/css" href="assets/icon/themify-icons/themify-icons.css" />
   
    <link rel="stylesheet" type="text/css" href="assets/icon/feather/css/feather.css" />
  
    <link rel="stylesheet" type="text/css" href="assets/icon/font-awesome/css/font-awesome.min.css" />
    
    <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/jquery.mCustomScrollbar.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="container" style="margin-top:25px;margin-bottom:25px;">
    <div class="col-12">
        
           
            <div class="form-group mt-3">
                <input type="text" class="form-control"  placeholder="Subject" >
            </div>
            <div class="form-group mt-3">
                <textarea class="form-control"  rows="5" placeholder="Message" ></textarea>
            </div>
            <div class="my-3">
               
            </div>
            <div ><button class="=btn btn-success" >Send Message</button></div>
        
    </div>
</div>
    </div>
    </form>
</body>
</html>
