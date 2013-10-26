<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="InsidePhotos.aspx.cs" Inherits="Web.Gallery.InsidePhotos" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentChild" runat="server">
    <div class="row-fluid">
        <div class="span10">
            <ul class="breadcrumb">
                <li><a href="/Web/Side/PhotoGallery.aspx">Gallery</a> <span class="divider">/</span></li>
                <li class="active">Inside Photos</li>
            </ul>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span10">
            <h2>
                Photos of the children inside playing</h2>
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
                    <li data-target="#myCarousel" data-slide-to="5" class=""></li>
                    <li data-target="#myCarousel" data-slide-to="6" class=""></li>
                    <li data-target="#myCarousel" data-slide-to="7" class=""></li>
                    <li data-target="#myCarousel" data-slide-to="8" class=""></li>
                    <li data-target="#myCarousel" data-slide-to="9" class=""></li>
                    <li data-target="#myCarousel" data-slide-to="10" class=""></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="/Images/gallery/inside/boy_builders_play.jpg" alt="" />
                        <div class="carousel-caption">
                            <p>
                                Construction and cooperative play</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/inside/girl_bus_whale.jpg" alt="" />
                        <div class="carousel-caption">
                            <p>
                                Exploring ideas</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/inside/girl_gear_blocks.jpg" alt="" />
                        <div class="carousel-caption">
                            <p>
                                Gear construction</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/inside/girl_jungle_animals.jpg" alt="" />
                        <div class="carousel-caption">
                            <p>
                                Animal interests</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/inside/girl_matching_cards.jpg" alt="" />
                        <div class="carousel-caption">
                            <p>
                                Matching game</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/inside/girl_playdough.jpg" alt="" />
                        <div class="carousel-caption">
                            <p>
                                Finger painting</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/inside/girl_writing.jpg" alt="" />
                        <div class="carousel-caption">
                            <p>
                                Literacy</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/inside/inside_play.jpg" alt="" />
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/inside/magnets.jpg" alt="" />
                        <div class="carousel-caption">
                            <p>
                                Telling stories</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/inside/teacher__child_buddy_lynda.jpg" alt="" />
                        <div class="carousel-caption">
                            <p>
                                Primary caregiving - developing a sense of belonging</p>
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
