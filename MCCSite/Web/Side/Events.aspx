<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Events.aspx.cs" Inherits="Web.Side.Events" %>

<%@ MasterType VirtualPath="~/Site.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageMetaContentChild" runat="server">
    <title>Miramar Community Crèche | News & Events</title>
    <meta name="description" content="Miramar Community Crèche is a small not for profit crèche on Chelsea street, Miramar. MCC embraces all of the wonderful cultures of all children who attend." />
    <meta name="keywords" content="current news, current events, latest events, latest news, news, events, what is happening, coming up, miramar community creche, creche miramar, education, early childhood, child development, childhood education,early childhood education,child development center,early childhood development,child daycare" />
    <link href="http://www.miramarcommunitycreche.org.nz/news-and-events" rel="canonical" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentChild" runat="server">
    <div class="row-fluid">
        <div class="span10">
            <h2>
                What's happening at Miramar Community Crèche</h2>
            <p>
                Here is where you can find out what events are coming up for us or find out the
                latest news</p>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span6">
            <fieldset>
                <legend>Latest News</legend>
                <div class="news-list">
                    <asp:Repeater ID="rptNews" OnItemDataBound="rptNews_ItemDataBound" runat="server">
                        <HeaderTemplate>
                            <div class="news-card" id="newsCard">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="well well-large">
                                <p class="news-title" runat="server" id="newsTitle">
                                    Fish 'n Chip Evening Success</p>
                                <p class="news-description" runat="server" id="newsDesc">
                                    Thank you to all the parents and whanau who came along it was a great night.</p>
                                <p class="pull-right news-date" runat="server" id="newsDate">
                                    <small>Friday, 1 June 2013</small></p>
                            </div>
                        </ItemTemplate>
                        <FooterTemplate>
                            </div>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </fieldset>
        </div>
        <div class="span6">
            <fieldset>
                <legend>Events coming up</legend>
                <div class="event-list">
                    <asp:Repeater ID="rptEvents" OnItemDataBound="rptEvents_ItemDataBound" runat="server">
                        <HeaderTemplate>
                            <div class="event-card " id="eventCard">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="well well-large">
                                <p class="news-title" runat="server" id="eventTitle">
                                    Fish 'n Chip Evening Success</p>
                                <p class="news-description" runat="server" id="eventDesc">
                                    Thank you to all the parents and whanau who came along it was a great night.</p>
                                <p class="pull-right news-date" runat="server" id="eventDate">
                                    <small>Friday, 1 June 2013</small></p>
                            </div>
                        </ItemTemplate>
                        <FooterTemplate>
                            </div>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </fieldset>
        </div>
    </div>
</asp:Content>
