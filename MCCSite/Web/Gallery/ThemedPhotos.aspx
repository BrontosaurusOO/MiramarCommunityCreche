<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ThemedPhotos.aspx.cs" Inherits="Web.Gallery.ThemedPhotos" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentChild" runat="server">
    <div class="row-fluid">
        <div class="span10">
            <ul class="breadcrumb">
                <li><a href="/Web/Side/PhotoGallery.aspx">Gallery</a> <span class="divider">/</span></li>
                <li class="active">Themed Photos</li>
            </ul>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span10">
            <h2>
                Photos from our themed weeks</h2>
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
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="/Images/gallery/themes/boys_dressup_week.jpg" alt="" />
                        <div class="carousel-caption">
                            <p>
                                Dress Up week</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/themes/girl_dressup_week.jpg" alt="" />
                        <div class="carousel-caption">
                            <p>
                                Dress Up week</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/themes/inside_dressup_week.jpg" alt="" />
                        <div class="carousel-caption">
                            <p>
                                Dress Up week</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="/Images/gallery/themes/lynda_pj_week.jpg" alt="" />
                        <div class="carousel-caption">
                            <p>
                                Pyjama week- eating breakfast with the children</p>
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
