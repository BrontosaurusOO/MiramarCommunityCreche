<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="GuestPhotos.aspx.cs" Inherits="Web.Gallery.GuestPhotos" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentChild" runat="server">
    <div class="row-fluid">
        <div class="span10">
            <ul class="breadcrumb">
                <li><a href="/Web/Side/PhotoGallery.aspx">Gallery</a> <span class="divider">/</span></li>
                <li class="active">Guests Photos</li>
            </ul>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span10">
            <h2>
                Photos of Guest at crèche</h2>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span10">
            <div id="myCarousel" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class=""></li>
                    <li data-target="#myCarousel" data-slide-to="1" class=""></li>
                    <li data-target="#myCarousel" data-slide-to="2" class="active"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="/Images/gallery/guests/zippty_zoo_1.jpg" alt="" />
                        <div class="carousel-caption">
                            <p>
                                Visit from Zippty Zoo</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/guests/zippty_zoo_3.jpg" alt="" />
                        <div class="carousel-caption">
                            <p>
                                Visit from Zippty Zoo</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/guests/zippty_zoo_2.jpg" alt="" />
                        <div class="carousel-caption">
                            <p>
                                Visit from Zippty Zoo</p>
                        </div>
                    </div>
                </div>
                <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="icon-prev">
                </span></a><a class="right carousel-control" href="#myCarousel" data-slide="next"><span
                    class="icon-next"></span></a>
            </div>
        </div>
    </div>
</asp:Content>
