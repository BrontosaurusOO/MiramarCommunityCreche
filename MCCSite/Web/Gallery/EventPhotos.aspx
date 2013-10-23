<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventPhotos.aspx.cs" Inherits="Web.Gallery.EventPhotos" %>
<%@ Register TagPrefix="sbm" TagName="Sidebar" Src="/Web/Controls/Side-Bar-Menu.ascx" %>

 <asp:Content ID="SideContent" runat="server" ContentPlaceHolderID="SideContent">
   <sbm:Sidebar id="Sidebar1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<div class="row-fluid">
<div class="span10">
<ul class="breadcrumb">
              <li><a href="/Web/Side/PhotoGallery.aspx">Gallery</a> <span class="divider">/</span></li>
              <li class="active">Event Photos</li>
            </ul>

</div>
</div>
<div class="row-fluid">
<div class="span10">
<h2>Photos from events at out crèche</h2>
</div>
</div>
<div class="row-fluid">
<div class="span10">
<div id="myCarousel" class="carousel slide">
                <ol class="carousel-indicators">
                  <li data-target="#myCarousel" data-slide-to="0" class=""></li>
                  <li data-target="#myCarousel" data-slide-to="1" class=""></li>
                  <li data-target="#myCarousel" data-slide-to="2" class="active"></li>
                  <li data-target="#myCarousel" data-slide-to="3" class=""></li>
                  <li data-target="#myCarousel" data-slide-to="4" class=""></li>

                </ol>
                <div class="carousel-inner">
                  <div class="item">
                    <img src="/Images/gallery/events/working_bee.jpg" alt="" />
                    <div class="carousel-caption">
                      <p>Working bee. Families, committee members, teachers and children all lending a hand to fix up the crèche.</p>
                    </div>
                  </div>
                  <div class="item">
                   <img src="/Images/gallery/events/Taniwha_building.jpg" alt="" />
                    <div class="carousel-caption">
                      <p>Our Taniwha we created in our outside area.</p>
                    </div>
                  </div>
                  <div class="item active">
                   <img src="/Images/gallery/events/fish_chip_evening_2.jpg"  alt="" />
                    <div class="carousel-caption">
                      <p>Fish n Chip evening. Familes meeting socially with teachers and other familes.</p>
                    </div>
                  </div>
                   <div class="item">
                  <img src="/Images/gallery/events/fish_chip_evening.jpg" alt="" />
                    <div class="carousel-caption">
                    </div>
                  </div>
                   <div class="item">
                   <img src="/Images/gallery/events/boy_birthday_cake.jpg" alt="" width="390"/>
                    <div class="carousel-caption">
                      <p>Birthday celebrations at the crèche</p>
                    </div>
                  </div>
                </div>
                <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="icon-prev"></span></a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="icon-next"></span></a>
              </div>
</div>
</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="JavascriptContent" runat="server">
</asp:Content>
