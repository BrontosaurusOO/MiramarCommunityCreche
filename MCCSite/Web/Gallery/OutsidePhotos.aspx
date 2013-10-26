<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="OutsidePhotos.aspx.cs" Inherits="Web.Gallery.OutsidePhotos" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentChild" runat="server">
    <div class="row-fluid">
        <div class="span10">
            <ul class="breadcrumb">
                <li><a href="/Web/Side/PhotoGallery.aspx">Gallery</a> <span class="divider">/</span></li>
                <li class="active">Outside Play Photos</li>
            </ul>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span10">
            <h2>
                Photos from outside play</h2>
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
                    <li data-target="#myCarousel" data-slide-to="11" class=""></li>
                    <li data-target="#myCarousel" data-slide-to="12" class=""></li>
                    <li data-target="#myCarousel" data-slide-to="13" class=""></li>
                    <li data-target="#myCarousel" data-slide-to="14" class=""></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="/Images/gallery/outside/water_play_sand.jpg" alt="" />
                        <div class="carousel-caption">
                            <p>
                                Water exploration</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/outside/sand_puddle.jpg" alt="" />
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/outside/rope_bridge.jpg" alt="" />
                        <div class="carousel-caption">
                            <p>
                                Physical play</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/outside/outside_area_2.jpg" alt="" />
                        <div class="carousel-caption">
                            <p>
                                Outside play equipment</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/outside/outside_area.jpg" alt="" />
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/outside/girl_top_slide.jpg" alt="" />
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/outside/water_play.jpg" alt="" />
                        <div class="carousel-caption">
                            <p>
                                Sensory play</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/outside/girl_sport_together.jpg" alt="" />
                        <div class="carousel-caption">
                            <p>
                                Ball skills - hand eye coordination</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/outside/wall_mural_play.jpg" alt="" />
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/outside/gardening.jpg" alt="" />
                        <div class="carousel-caption">
                            <p>
                                Gardening</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/outside/boy_watering_can.jpg" alt="" />
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/outside/boy_water_play.jpg" alt="" />
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/outside/boy_rope_ladder.jpg" alt="" />
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/outside/boy_building_play.jpg" alt="" />
                        <div class="carousel-caption">
                            <p>
                                Carpentry</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/outside/boy_building_ocean.jpg" alt="" />
                        <div class="carousel-caption">
                            <p>
                                Water week</p>
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
