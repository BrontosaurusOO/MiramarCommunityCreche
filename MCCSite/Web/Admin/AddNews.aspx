<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator.master" AutoEventWireup="true"
    CodeBehind="AddNews.aspx.cs" Inherits="MCCSite.Web.Admin.AddNews" %>

<%@ MasterType VirtualPath="~/Administrator.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentChild" runat="server">
    <div class="row-fluid">
        <div class="span10">
            <h2>
                Add a News item</h2>
            <p>
                Fill out the form to add a news item to the site</p>
        </div>
    </div>
    <div class="row-fluid ">
        <form action="/web/admin/addnews.aspx" method="post" class="form-horizontal">
        <div class="span6">
            <fieldset>
                <legend>News item</legend>
                 <div class="control-group enrolment" id="titleControl" runat="server">
                    <input type="hidden" id="txtHiddenId" runat="server" />
                    <label id="lblTitle" for="txtNewsTitle" runat="server" class="control-label">
                        News title:</label>
                    <div class="controls">
                        <input type="text" id="txtNewsTitle" placeholder="Type something…" runat="server" />
                    </div>
                </div>
                <div class="control-group enrolment">
                    <label id="lblNews" for="txtNews" runat="server">
                        News description:</label>
                    <div class="controls">
                        <textarea id="txtNews" placeholder="Type something…" runat="server" rows="5" cols="6"></textarea>
                    </div>
                </div>
                <div class="control-group enrolment" id="dateControl" runat="server">
                    <label id="lblDate" for="txtNewsDate" runat="server">
                        News Date:</label>
                    <div class="controls">
                        <input type="text" id="txtNewsDate" placeholder="Please enter a date in this format dd/MM/YYYY" runat="server" rows="6" />
                        <a href="javascript:void(0);" id="linkCal" onclick="displayCalendar()" runat="server" class="btn btn-info">
                            <i class="icon-calendar icon-large icon-white"></i></a>
                        <div id="datePicker" style="display: none;">
                            <asp:Calendar ID="calNewsDate" OnSelectionChanged="calNewsDate_SelectionChanged"
                                runat="server" />
                        </div>
                    </div>
                </div>
                <div class="text-center">
                    <asp:Button CssClass="btn btn-primary" OnClick="btnAdd_Click" runat="server" ID="btnAdd"
                        Text="Add news" />
                    <asp:Button CssClass="btn btn-info" OnClick="btnEdit_Click" runat="server" ID="btnSave"
                        Text="Save news" Visible="false" />
                    <div class="clear bottom-50">
                    </div>
                </div>
            </fieldset>
        </div>
        <div class="span6">
            <fieldset>
                <legend>Latest News</legend>
                <div class="news-list">
                    <asp:Repeater ID="rptNews" OnItemDataBound="rptNews_ItemDataBound" OnItemCommand="rptNews_ItemCommand"
                        runat="server">
                        <HeaderTemplate>
                            <div class="news-card" id="newsCard">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="well well-small">
                                <p class="news-title" runat="server" id="newsTitle">
                                    Fish 'n Chip Evening Success</p>
                                <p class="news-description" runat="server" id="newsDesc">
                                    Thank you to all the parents and whanau who came along it was a great night and helped
                                    raised $2500 for the crèche.</p>
                                <p class="pull-right news-date" runat="server" id="newsDate">
                                    <small>Friday, 1 June 2013</small></p>
                                <div class="button-holder">
                                    <asp:Button CssClass="btn btn-info" runat="server" ID="btnEdit" Text="Edit event" />
                                    <asp:Button CssClass="btn btn-danger" runat="server" ID="btnDelete" Text="Delete event" />
                                </div>
                            </div>
                        </ItemTemplate>
                        <FooterTemplate>
                            </div>
                        </FooterTemplate>
                    </asp:Repeater>
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
