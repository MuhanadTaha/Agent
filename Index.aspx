<%@ Page Title="" Language="C#" MasterPageFile="~/IndexMaster.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .styleDiv{
            background-color:white; 
            box-shadow: 5px 4px 10px 5px #888888;
        }
        .styleDiv2{
            background-color:white; 
            box-shadow: 2px 2px 10px 5px #cbc6c6;
        }
               /* Google Fonts */
@import url(https://fonts.googleapis.com/css?family=Anonymous+Pro);

/* Global */

.line-1{
    position: relative;
    top: 50%;  
    width: 24em;
    margin: 0 auto;
    border-right: 2px solid rgba(255,255,255,.75);
    font-size: 180%;
    text-align: center;
    white-space: nowrap;
    overflow: hidden;
    transform: translateY(-50%);    
}

/* Animation */
.anim-typewriter{
  animation: typewriter 4s steps(44) 1s 1 normal both,
             blinkTextCursor 500ms steps(44) infinite normal;
}
@keyframes typewriter{
  from{width: 0;}
  to{width: 20em;}
}
@keyframes blinkTextCursor{
  from{border-right-color: rgba(255,255,255,.75);}
  to{border-right-color: transparent;}
}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    
    <div class="container">
       <strong>
       </strong>
        <br />
        <div class="row">
          
        </div>

  <div class="row">
    <div class="col-lg-3 styleDiv">
        <div style="width:250px;padding-bottom:60px;">
           <div style="width:100%">
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
      <ContentTemplate>
      <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Calibri (Body)" Font-Size="10pt" ForeColor="Black" Height="420px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="100%" style="border:none">        
        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="9pt" ForeColor="#333333" Height="30pt" />
        <DayStyle Width="14%" />
        <NextPrevStyle Font-Size="8pt" ForeColor="White" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
        <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
        <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
        <TodayDayStyle BackColor="#CCCC99" />
      </asp:Calendar>
      </ContentTemplate>
     </asp:UpdatePanel>
     </div>
       </div>
    </div>
 <div class="col-lg-6 styleDiv" >
  <div class="w3-content w3-display-container">
  <img class="mySlides" src="images/ImageWebsite/3.jpg" style="width:100%; height:380px" />
  <img class="mySlides" src="images/ImageWebsite/4.jpg" style="width:100%; height:380px">
  <img class="mySlides" src="images/ImageWebsite/2.jpg" style="width:100%; height:380px">



          <script>
              var myIndex = 0;

              carousel();
              function carousel() {
                  var i;
                  var x = document.getElementsByClassName("mySlides");
                  for (i = 0; i < x.length; i++) {
                      x[i].style.display = "none";
                  }
                  myIndex++;
                  if (myIndex > x.length) { myIndex = 1 }
                  x[myIndex - 1].style.display = "block";
                  setTimeout(carousel, 5000); // Change image every 5 seconds
              }
          </script>
     </div>
     <div style="padding:20px">
         <p class="line-1 anim-typewriter">Welcome to the biggest store in Palestine</p>
     </div>
 </div>
      
     <div class="col-lg-3 styleDiv text-center">
         
             
      <link rel="stylesheet" type="text/css" href="https://www.foreignexchange.org.uk/widget/FE-FERT2-css.php?w=180&nb=1&bdrc=CBCBCB&mbg=&fc=000000&tc=1280D0" media="screen" />
         <div id="fefert2">
             <div id="fefert2-widget"></div>
             <div id="fefert2-infolink">Source: <a rel="nofollow" href="https://www.foreignexchange.org.uk/" target="_new" title="ForeignExchange.org.uk">ForeignExchange.org.uk</a></div>
             <script type="text/javascript">
                 var tz = '3';
                 var w = '180';
                 var mc = 'USD';
                 var nb = '1';
                 var c1 = 'ILS';
                 var bc = 'Base Currency';
                 var lc = '1280D0';
                 var bdrc = 'CBCBCB';
                 var t = 'Foreign Exchange Today';
                 var tc = '1280D0';
                 var fc = '000000';
                 var ccHost = (("https:" == document.location.protocol) ? "https://www." : "http://www.");
                 document.write(unescape("%3Cscript src='" + ccHost + "foreignexchange.org.uk/widget/FE-FERT2-1.php' type='text/javascript'%3E%3C/script%3E"));
             </script>
         </div>
  </div>
</div>
    
    <br />

    

    <script>
var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 3000); // Change image every 2 seconds
}
    </script>
    </div>
 </asp:Content>

