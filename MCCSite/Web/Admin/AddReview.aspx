<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator.master" AutoEventWireup="true"
    CodeBehind="AddReview.aspx.cs" Inherits="MCCSite.Web.Admin.AddReview" %>

<%@ MasterType VirtualPath="~/Administrator.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentChild" runat="server">
    <div class="row-fluid">
        <div class="span10">
            <h2>
                Add a Review item</h2>
            <p>
                Fill out the form to add a review to the site</p>
        </div>
    </div>
    <div class="row-fluid">
        <form action="/web/admin/addreview.aspx" method="post" class="form-horizontal">
        <div class="span6">
            <fieldset>
                <legend>Review</legend>
                <div class="control-group enrolment" id="reviewControl" runat="server">
                    <input type="hidden" id="txtHiddenId" runat="server" />
                    <label id="lblReview" for="txtReview" runat="server">
                        Review:</label>
                    <div class="controls">
                        <textarea id="txtReview" placeholder="Type something…" runat="server" rows="5" cols="6"></textarea>
                    </div>
                </div>
                <div class="control-group enrolment">
                    <label id="lblName" for="txtFrom" runat="server" class="control-label">
                        From:</label>
                    <div class="controls">
                        <input type="text" id="txtFrom" placeholder="Type something or Anon Parent" runat="server" />
                    </div>
                </div>
                <div class="control-group enrolment" id="dateControl" runat="server">
                    <label id="lblDate" for="txtDate" runat="server">
                        Review Date:</label>
                    <div class="controls">
                        <input type="text" id="txtDate" runat="server" rows="6" placeholder="Please enter a date in this format dd/MM/YYYY"/>
                        <a href="javascript:void(0);" id="linkCal" onclick="displayCalendar()" runat="server"
                            class="btn btn-info"><i class="icon-calendar icon-large icon-white"></i></a>
                        <div id="datePicker" style="display: none;">
                            <asp:Calendar ID="calDate" OnSelectionChanged="calDate_SelectionChanged" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="text-center">
                    <asp:Button CssClass="btn btn-primary" OnClick="btnAdd_Click" runat="server" ID="btnAdd"
                        Text="Add review" />
                    <asp:Button CssClass="btn btn-info" OnClick="btnEdit_Click" runat="server" ID="btnSave"
                        Text="Save review" Visible="false" />
                    <div class="clear bottom-50">
                    </div>
                </div>
            </fieldset>
        </div>
        <div class="span6">
            <fieldset>
                <legend>Latest Reviews</legend>
                <div id="reviewList">
                    <asp:Repeater ID="rptReviews" OnItemDataBound="rptReviews_ItemDataBound" OnItemCommand="rptReviews_ItemCommand"
                        runat="server">
                        <HeaderTemplate>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="review-card" id="reviewCard">
                                <p>
                                    <span class="inline text-error testimonial-text apos">‘</span><span class="testimonial-text inline"
                                        runat="server" id="reviewText">I love your crèche!</span><span class=" testimonial-text inline text-error apos">’</span></p>
                                <p>
                                    <span class="testimonial-name" runat="server" id="reviewFrom">Anonymous</span><span
                                        class="inline pull-right test-date" runat="server" id="reviewDate">Monday, 6 May
                                        2013</span></p>
                                <div class="button-holder">
                                    <asp:Button CssClass="btn btn-info" runat="server" ID="btnEdit" Text="Edit review" />
                                    <asp:Button CssClass="btn btn-danger" runat="server" ID="btnDelete" Text="Delete review" />
                                </div>
                            </div>
                        </ItemTemplate>
                        <FooterTemplate>
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
