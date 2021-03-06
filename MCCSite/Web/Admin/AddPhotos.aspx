﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator.master" AutoEventWireup="true"
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
    <div class="row-fluid">
        <div class="span6">
            <fieldset>
                <legend>Photo item</legend>
                <div class="control-group enrolment">
                    <input type="hidden" id="txtHiddenId" runat="server" />
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
                <div class="control-group enrolment" id="titleControl" runat="server">
                    <label id="lblTitle" for="txtPhotoName" runat="server" class="control-label">
                        Photo name:</label>
                    <div class="controls">
                        <input type="text" id="txtPhotoName" placeholder="Type something…" runat="server" />
                    </div>
                </div>
                <div class="control-group enrolment">
                    <label id="lblCaption" for="txtCaption" runat="server">
                        Photo caption:</label>
                    <div class="controls">
                        <textarea id="txtCaption" placeholder="Type something…" runat="server" rows="5" cols="6"></textarea>
                    </div>
                </div>
                <div class="control-group enrolment" id="dateControl" runat="server">
                    <label id="lblStartDate" for="txtPhotoDate" runat="server">
                        Photo Date:</label>
                    <div class="controls">
                        <input type="text" id="txtPhotoDate" runat="server" rows="6" />
                        <a href="javascript:void(0);" id="linkCal" onclick="displayCalendar()" runat="server"
                            class="btn btn-info"><i class="icon-calendar icon-large icon-white"></i>Calendar</a>
                        <div id="datePicker" style="display: none;">
                            <asp:Calendar ID="calPhotoDate" OnSelectionChanged="calPhotoDate_SelectionChanged"
                                runat="server" />
                        </div>
                    </div>
                </div>
                <div class="control-group enrolment" id="photoUploadControl" runat="server">
                    <input type="file" id="photoUploadFile" name="photoUploadFile" runat="server" text="Choose a photo"
                        class="btn btn-info" />
                </div>
                <div class="text-center">
                    <asp:Button CssClass="btn btn-primary" OnClick="btnAdd_Click" runat="server" ID="btnAdd"
                        Text="Add photo" />
                    <asp:Button CssClass="btn btn-info" OnClick="btnEdit_Click" runat="server" ID="btnSave"
                        Text="Save photo" Visible="false" />
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
                        <select id="ddlSelectedFolder" runat="server">
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
                            <asp:Repeater ID="rptPhotos" OnItemDataBound="rptPhotos_ItemDataBound" OnItemCommand="rptPhotos_ItemCommand"
                                runat="server">
                                <ItemTemplate>
                                    <div class="item" runat="server" id="itemHolder">
                                        <img src=" " alt=" " runat="server" id="image" />
                                        <div class="carousel-caption">
                                            <p runat="server" id="caption">
                                            </p>
                                        </div>
                                        <div class="button-holder centered top-15">
                                            <asp:Button CssClass="btn btn-info" runat="server" ID="btnEdit" Text="Edit photo" />
                                            <asp:Button CssClass="btn btn-danger" runat="server" ID="btnDelete" Text="Delete photo" />
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
            </fieldset>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JavascriptContentChild" runat="server">
    <script type="text/javascript">
        var selectEl = document.getElementById('MainContent_MainContentChild_ddlSelectedFolder');

        selectEl.onchange = function () {
            window.location = "/web/admin/addphotos.aspx?f=" + this.value;
        };

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
