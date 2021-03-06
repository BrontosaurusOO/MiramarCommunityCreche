﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="photo-gallery.aspx.cs" Inherits="Web.Side.PhotoGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageMetaContentChild" runat="server">
    <title>Miramar Community Crèche | Photo gallery</title>
    <meta name="description" content="Miramar Community Crèche is a small not for profit crèche on Chelsea street, Miramar. MCC embraces all of the wonderful cultures of all children who attend." />
    <meta name="keywords" content="inside, outside, events, themes, trips, guests,photos, photo, photo gallery, images, happy children, event photos, miramar community creche, creche miramar, education, early childhood, child development, childhood education,early childhood education,child development center,early childhood development,child daycare" />
    <link href="http://www.miramarcommunitycreche.org.nz/photo-gallery.aspx" rel="canonical" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentChild" runat="server">
    <div class="row-fluid">
        <div class="span10">
            <h2>
                Photo Gallery</h2>
            <p>
                Check out the photos of our wonderful crèche, children and whanau working together.</p>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span10">
            <ul class="thumbnails">
                <li class="span4"><a href="/Gallery/inside-photos.aspx" class="thumbnail">
                    <img data-src="holder.js/300x200" src="/images/gallery/inside/boy_builders_play.jpg"
                        alt="" />
                    <h4>
                        Inside Play</h4>
                    <p>
                        Photos of our children enjoying inside play and discovery.
                    </p>
                </a></li>
                <li class="span4"><a href="/Gallery/outside-photos.aspx" class="thumbnail">
                    <img data-src="holder.js/300x200" src="/images/gallery/outside/outside_area.jpg"
                        alt="" />
                    <h4>
                        Outside Play</h4>
                    <p>
                        Photos of our children playing outside and experimenting</p>
                </a></li>
                <li class="span4"><a href="/Gallery/event-photos.aspx" class="thumbnail">
                    <img data-src="holder.js/300x200" src="/images/gallery/events/working_bee.jpg" alt="" />
                    <h4>
                        Events and Occasions</h4>
                    <p>
                        We have many events at the crèche from working bees to discos</p>
                </a></li>
            </ul>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span10">
            <ul class="thumbnails">
                <li class="span4"><a href="/Gallery/guest-photos.aspx" class="thumbnail">
                    <img data-src="holder.js/300x200" src="/images/gallery/guests/zippty_zoo_1.jpg" alt="" />
                    <h4>
                        Guests and Visitors</h4>
                    <p>
                        Photos of some guests who come and visit the children</p>
                </a></li>
                <li class="span4"><a href="/Gallery/trip-photos.aspx" class="thumbnail">
                    <img data-src="holder.js/300x200" src="/images/gallery/trips/walk_supermarket.jpg"
                        alt="" />
                    <h4>
                        Trips and Excursions</h4>
                    <p>
                        Photos of our trips and excursions to see some interesting places.</p>
                </a></li>
                <li class="span4"><a href="/Gallery/themed-photos.aspx" class="thumbnail">
                    <img data-src="holder.js/300x200" src="/images/gallery/themes/inside_dressup_week.jpg"
                        alt="" />
                    <h4>
                        Themed Weeks</h4>
                    <p>
                        Photos of our special themed weeks for a bit of fun.</p>
                </a></li>
            </ul>
        </div>
    </div>
</asp:Content>
