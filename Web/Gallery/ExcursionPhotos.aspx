<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ExcursionPhotos.aspx.cs" Inherits="Web.Gallery.ExcursionPhotos" %>

<%@ Register TagPrefix="sbm" TagName="Sidebar" Src="/Web/Controls/Side-Bar-Menu.ascx" %>
<asp:Content ID="SideContent" runat="server" ContentPlaceHolderID="SideContent">
    <sbm:Sidebar ID="Sidebar1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row-fluid">
        <div class="span10">
            <ul class="breadcrumb">
                <li><a href="/Web/Side/PhotoGallery.aspx">Gallery</a> <span class="divider">/</span></li>
                <li class="active">Trips & Excursions Photos</li>
            </ul>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span10">
            <h2>
                Photos of our crèche on trips and excursions</h2>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span10">
            <div id="myCarousel" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="/Images/gallery/trips/walk_supermarket.jpg" alt="" />
                        <div class="carousel-caption">
                            <p>
                                A spontaneous trip to the supermarket for Mako group children</p>
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
<asp:Content ID="Content4" ContentPlaceHolderID="JavascriptContent" runat="server">
</asp:Content>
