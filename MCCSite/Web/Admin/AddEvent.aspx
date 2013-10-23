﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEvent.aspx.cs" Inherits="MCCSite.Web.Admin.AddEvent" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<%@ Register TagPrefix="sbm" TagName="Sidebar" Src="/Web/Controls/Side-Bar-Menu.ascx" %>
<asp:Content ID="SideContent" runat="server" ContentPlaceHolderID="SideContent">
    <sbm:sidebar id="Sidebar1" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row-fluid">
        <div class="span10">
            <h2>
                Add a Event item</h2>
            <p>
                Fill out the form to add a event item to the site</p>
        </div>
    </div>
    <div class="row-fluid enrolment">
        <form action="/web/admin/addevent.aspx" method="post" class="form-horizontal">
        <div class="span6">
            <fieldset>
                <legend>Event item</legend>
                <div class="control-group">
                    <label id="lblTitle" for="txtEventTitle" runat="server" class="control-label">
                        Event title:</label>
                    <div class="controls">
                        <input type="text" id="txtEventTitle" placeholder="Type something…" runat="server" />
                    </div>
                </div>
                <div class="control-group">
                    <label id="lblEvent" for="txtEvent" runat="server">
                        Event description:</label>
                    <div class="controls">
                        <textarea id="txtEvent" placeholder="Type something…" runat="server" rows="5" cols="6"></textarea>
                    </div>
                </div>
                <div class="control-group">
                    <label id="lblStartDate" for="txtEventStartDate" runat="server">
                        Event Start Date:</label>
                    <div class="controls">
                        <input type="text" id="txtEventStartDate" runat="server" rows="6" />
                        <a href="javascript:void(0);" id="linkCal" onclick="displayStartCalendar()" runat="server">
                            <i class="icon-calendar icon-large" style="padding-left: 6px;"></i></a>
                        <div id="dateStartPicker" style="display: none;">
                            <asp:Calendar ID="calEventStartDate" OnSelectionChanged="calEventStartDate_SelectionChanged"
                                runat="server" />
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <label id="lblEndDate" for="txtEventEndDate" runat="server">
                        Event End Date: (optional if the event spans multiple days)</label>
                    <div class="controls">
                        <input type="text" id="txtEventEndDate" runat="server" rows="6" />
                        <a href="javascript:void(0);" id="A1" onclick="displayEndCalendar()" runat="server">
                            <i class="icon-calendar icon-large" style="padding-left: 6px;"></i></a>
                        <div id="dateEndPicker" style="display: none;">
                            <asp:Calendar ID="calEventEndDate" OnSelectionChanged="calEventEndDate_SelectionChanged"
                                runat="server" />
                        </div>
                    </div>
                </div>
                <div class="text-center">
                    <asp:Button type="submit" cssclass="btn btn-primary" OnClick="btnSubmit_Click"  runat="server" id="btnSubmit" Text="Add Event"/>
                    <div class="clear bottom-50"  ></div>
                </div>
            </fieldset>
        </div>
        <div class="span6">
             <fieldset>
                <legend>Latest Events</legend>
            <div class="event-list">
<asp:Repeater ID="rptEvents" OnItemDataBound="rptEvents_ItemDataBound" runat="server">
    <HeaderTemplate>
            <div class="event-card " id="eventCard" >
    </HeaderTemplate>   
    <ItemTemplate>

             <p class="news-title" runat="server" id="eventTitle">Fish 'n Chip Evening Success</p>
             <p class="news-description" runat="server" id="eventDesc">Thank you to all the parents and whanu who came along it was a great night and helped raised $2500 for the crèche.</p>
             <p class="pull-right news-date" runat="server" id="eventDate"><small>Friday, 1 June 2013</small></p>
    
    </ItemTemplate>
    <FooterTemplate>
        </div>
    </FooterTemplate>
</asp:Repeater>
</div>
</fieldset>
</div>
    </form> </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JavascriptContent" runat="server">
    <script type="text/javascript">
        function displayStartCalendar() {

            var cal = document.getElementById('dateStartPicker');
            if (cal.style.display == 'none') {
                cal.style.display = 'block'
            }
            else {
                cal.style.display = 'none'
            }
        };
        function displayEndCalendar() {

            var cal = document.getElementById('dateEndPicker');
            if (cal.style.display == 'none') {
                cal.style.display = 'block'
            }
            else {
                cal.style.display = 'none'
            }
        };
    </script>
</asp:Content>