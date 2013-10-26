<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs"  MasterPageFile="~/Site.Master"  Inherits="_Default"%>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContentChild">
  <div class="row-fluid">
        <div class="span12 text-center">
           <h1 >Welcome to Miramar Community Crèche</h1>
           <h2 class="dark-green">Te Whare Manaaki Tamariki o Te Motu Kairangi</h2>
         </div>
   </div>
     <div class="row-fluid">
     <div class="span6">
          <p class="lead text-left ">
          Miramar Community Crèche is a community owned early childhood service that aims to create a caring, positive, stimulating and learning environment for all children that contributes to their well-being, education and development needs so they develop a sense of belonging where <strong>"they know they have a place"</strong>.
          </p>
          <p class="text-left">We offer qualified and experienced teachers with great ratios of 1 teacher to 5 children in a mixed age range setting. A wonderful purpose built premise with a great outdoor area to provide children with endless opportunities for exploration, learning and fun.</p>
          <p class="text-left">We firmly believe in the community (teachers, parents, whanau and children) working together in partnership and feel a sense of belonging in the crèche</p>
          <p class="text-left">We are committed to our relationship under the Treaty of Waitangi (Te Tiriti O Waitangi) and also recognise the importance of the language and culture to our children in Aotearoa, NZ.</p>
          <p class="text-left">We aim to celebrate the cultural idenities of <strong>every child</strong> through fostering an inclusive learning environment that <em>embraces all cultures</em>.</p>
        </div>
          <div class="span6">
           <div id="myCarousel" class="carousel slide">
                <ol class="carousel-indicators">
                  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                  <li data-target="#myCarousel" data-slide-to="1" class=""></li>
                  <li data-target="#myCarousel" data-slide-to="2" class=""></li>
                </ol>
                <div class="carousel-inner">
                  <div class="item active">
                    <img src="/Images/FeaturedSliderPhotos/Shade_Sails_2012.jpeg" alt=""/>
                    
                  </div>
                  <div class="item ">
                    <img src="/Images/FeaturedSliderPhotos/creche_front.jpg" alt=""/>
                    
                  </div>
                  <div class="item">
                    <img src="/Images/FeaturedSliderPhotos/mat_time.jpg" alt=""/>
                    
                  </div>
                </div>
                <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="icon-prev"></span></a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="icon-next"></span></a>
            </div>
          </div>
          
    </div>
    <div class="row-fluid top-50">
        <div class="span12">
          <ul class="thumbnails">
          <li class="span3 offset1">
            <a href="http://ero.govt.nz/index.php/Early-Childhood-School-Reports/Early-Childhood-Reports?sfilter%5Breport%2Fschool_name%5D=miramar+community+creche&filter%5B%5D=0&sfilter%5Breport%2Fregion%5D=&dfilter%5Breport%2Fdate%5D%5Bmonth%5D=&dfilter%5Breport%2Fdate%5D%5Byear%5D=&filterreport=Search" class="thumbnail">
              <img src="Images/ero-logo.png" alt=""/>
              <h4>Ero Report</h4>
              <p>Click here to read our ero reports.</p>
            </a>
          </li>
             <li class="span4 ">
            <a href="/Web/Main/Reviews.aspx" class="thumbnail">
              <img src="Images/teacher_child_buddy.jpg" alt=""/>
              <h4>Reviews</h4>
              <p>Click here to read some of the comments parents, ERO, community members and ex teachers have made about us.</p>
            </a>
          </li>
           <li class="span3 ">
            <a href="Web/Side/waitinglist.aspx" class="thumbnail">
              <img src="Images/Gallery/Inside/girl_writing.jpg" alt=""/>
              <h4>Enrol Now</h4>
              <p>To join out waiting list click here.</p>
            </a>
          </li>
        </ul>
          </div>
          </div>
    </asp:Content>
