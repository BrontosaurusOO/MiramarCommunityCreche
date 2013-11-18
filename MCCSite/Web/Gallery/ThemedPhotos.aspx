<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ThemedPhotos.aspx.cs" Inherits="Web.Gallery.ThemedPhotos" %>

<%@ MasterType VirtualPath="~/Site.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageMetaContentChild" runat="server">
    <title>Miramar Community Crèche | Themed photos</title>
    <meta name="description" content="Miramar Community Crèche is a small not for profit crèche on Chelsea street, Miramar. MCC embraces all of the wonderful cultures of all children who attend." />
    <meta name="keywords" content="themed week, theme, themes,photos, photo, gallery, photo gallery, miramar community creche, creche miramar, education, early childhood, child development, childhood education,early childhood education,child development center,early childhood development,child daycare" />
    <link href="http://www.miramarcommunitycreche.org.nz/gallery/theme-photos" rel="canonical" />
</asp:Content>
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
                <ol class="carousel-indicators" runat="server" id="indicators">
                </ol>
                <div class="carousel-inner">
                    <asp:Repeater ID="rptPhotos" OnItemDataBound="rptPhotos_ItemDataBound" runat="server">
                        <ItemTemplate>
                            <div class="item" runat="server" id="itemHolder">
                                <img src=" " alt=" " runat="server" id="image" />
                                <div class="carousel-caption">
                                    <p runat="server" id="caption">
                                    </p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <a class=" carousel-control" href="#myCarousel" data-slide="prev"><span class="icon-prev">
                </span></a><a class="right carousel-control" href="#myCarousel" data-slide="next"><span
                    class="icon-next"></span></a>
            </div>
        </div>
    </div>
</asp:Content>
