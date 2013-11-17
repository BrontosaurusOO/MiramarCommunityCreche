<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="OutsidePhotos.aspx.cs" Inherits="Web.Gallery.OutsidePhotos" %>

<%@ MasterType VirtualPath="~/Site.master" %>
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
                <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="icon-prev">
                </span></a><a class="right carousel-control" href="#myCarousel" data-slide="next"><span
                    class="icon-next"></span></a>
            </div>
        </div>
    </div>
</asp:Content>
