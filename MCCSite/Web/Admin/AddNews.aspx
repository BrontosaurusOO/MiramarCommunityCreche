<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true"
    CodeBehind="AddNews.aspx.cs" Inherits="MCCSite.Web.Admin.AddNews" %>
    
    <%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row-fluid">
        <div class="span10">
            <h2>
                Add a News item</h2>
            <p>
                Fill out the form to add a news item to the site</p>
        </div>
    </div>
    <div class="row-fluid enrolment">
        <form action="/web/admin/addnews.aspx" method="post" class="form-horizontal">
        <div class="span6">
            <fieldset>
                <legend>News item</legend>
                <div class="control-group">
                    <label id="lblTitle" for="txtNewsTitle" runat="server" class="control-label">
                        News title:</label>
                    <div class="controls">
                        <input type="text" id="txtNewsTitle" placeholder="Type something…" runat="server" />
                    </div>
                </div>
                <div class="control-group">
                    <label id="lblNews" for="txtNews" runat="server">
                        News description:</label>
                    <div class="controls">
                        <textarea id="txtNews" placeholder="Type something…" runat="server" rows="5" cols="6"></textarea>
                    </div>
                </div>
                <div class="control-group">
                    <label id="lblStartDate" for="txtNewsDate" runat="server">
                        News Date:</label>
                    <div class="controls">
                        <input type="text" id="txtNewsDate" runat="server" rows="6" />
                        <a href="javascript:void(0);" id="linkCal" onclick="displayCalendar()" runat="server">
                            <i class="icon-calendar icon-large" style="padding-left: 6px;"></i></a>
                        <div id="datePicker" style="display: none;">
                            <asp:Calendar ID="calNewsDate" OnSelectionChanged="calNewsDate_SelectionChanged"
                                runat="server" />
                        </div>
                    </div>
                </div>
                <div class="text-center">
                    <asp:Button type="submit" cssclass="btn btn-primary" OnClick="btnSubmit_Click"  runat="server" id="btnSubmit" Text="Add News"/>
                    <div class="clear bottom-50"  ></div>
                </div>
            </fieldset>
        </div>
        <div class="span6">
             <fieldset>
                <legend>Latest News</legend>
            <div class="news-list">
                <asp:Repeater ID="rptNews" OnItemDataBound="rptNews_ItemDataBound" runat="server">
                    <HeaderTemplate>
                        <div class="news-card" id="newsCard">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <p class="news-title" runat="server" id="newsTitle">
                            Fish 'n Chip Evening Success</p>
                        <p class="news-description" runat="server" id="newsDesc">
                            Thank you to all the parents and whanu who came along it was a great night and helped
                            raised $2500 for the crèche.</p>
                        <p class="pull-right news-date" runat="server" id="newsDate">
                            <small>Friday, 1 June 2013</small></p>
                    </ItemTemplate>
                    <FooterTemplate>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form> </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JavascriptContent" runat="server">
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
