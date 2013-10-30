<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator.master" AutoEventWireup="true"
    CodeBehind="AddPhotos.aspx.cs" Inherits="MCCSite.Web.Admin.AddPhotos" %>

<%@ MasterType VirtualPath="~/Administrator.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentChild" runat="server">
    <div class="row-fluid">
        <div class="span10">
            <h2>
                Add a Photo
            </h2>
            <p>
                Fill out the form to add a photo to the site gallery
            </p>
        </div>
    </div>
    <div class="row-fluid enrolment">
        <form method="post" class="form-horizontal">
        <div class="span6">
            <fieldset>
                <legend>Photo item</legend>
                <div class="control-group">
                    <label id="lblFolder" class="inline" runat="server">
                        Folder / Page:</label>
                    <div class="controls">
                        <select id="ddlFolder" runat="server">
                            <option>Events</option>
                            <option>Guests</option>
                            <option>Inside</option>
                            <option>Outside</option>
                            <option>Themes</option>
                            <option>Trips</option>
                        </select>
                    </div>
                </div>
                <div class="control-group">
                    <label id="lblTitle" for="txtPhotoName" runat="server" class="control-label">
                        Photo name:</label>
                    <div class="controls">
                        <input type="text" id="txtPhotoName" placeholder="Type something…" runat="server" />
                    </div>
                </div>
                <div class="control-group">
                    <label id="lblCaption" for="txtCaption" runat="server">
                        Photo caption:</label>
                    <div class="controls">
                        <textarea id="txtCaption" placeholder="Type something…" runat="server" rows="5" cols="6"></textarea>
                    </div>
                </div>
                <div class="control-group">
                    <label id="lblStartDate" for="txtPhotoDate" runat="server">
                        Photo Date:</label>
                    <div class="controls">
                        <input type="text" id="txtPhotoDate" runat="server" rows="6" />
                        <a href="javascript:void(0);" id="linkCal" onclick="displayCalendar()" runat="server">
                            <i class="icon-calendar icon-large icon-white" ></i>Calendar</a>
                        <div id="datePicker" style="display: none;">
                            <asp:Calendar ID="calPhotoDate" OnSelectionChanged="calPhotoDate_SelectionChanged"
                                runat="server" />
                        </div>
                    </div>
                </div>
                <div class="text-center">
                    <asp:Button type="submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" runat="server"
                        ID="btnSubmit" Text="Add Photo" />
                    <div class="clear bottom-50">
                    </div>
                </div>
            </fieldset>
        </div>
        <div class="span6">
            <fieldset>
                <legend runat="server" id="photoGalleryTitle">Photo</legend>
                <div class="control-group">
                    <label class="inline">
                        Folder / Page:</label>
                    <div class="controls">
                        <select id="ddlSelectedFolder" onselectionchanged="ddlSelectedfolder_SelectionChanged"
                            runat="server">
                            <option>Events</option>
                            <option>Guests</option>
                            <option>Inside</option>
                            <option>Outside</option>
                            <option>Themes</option>
                            <option>Trips</option>
                        </select>
                    </div>
                </div>
                <div class="control-group">
                    <div id="myCarousel" class="carousel slide">
                        <ol class="carousel-indicators" runat="server" id="indicators">
                        </ol>
                        <div class="carousel-inner">
                            <asp:Repeater ID="rptPhotos" OnItemDataBound="rptPhotos_ItemDataBound" runat="server">
                                <ItemTemplate>
                                    <div class="item" runat="server" id="itemHolder">
                                        <img src="" alt="" runat="server" id="image" />
                                        <div class="carousel-caption">
                                            <p runat="server" id="caption">
                                                Test caption</p>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="icon-prev">
                                    </span></a><a class="right carousel-control" href="#myCarousel" data-slide="next"><span
                                        class="icon-next"></span></a>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </fieldset>
        </div>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JavascriptContentChild" runat="server">
    <script type="text/javascript">
        function displayCalendar() {

            var cal = document.getElementById('datePicker');
            if (cal.style.display == 'none') {
                cal.style.display = 'block'
            }
            else {
                cal.style.display = 'none'
            }
        };
    </script>
</asp:Content>
