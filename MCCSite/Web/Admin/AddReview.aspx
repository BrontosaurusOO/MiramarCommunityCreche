<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddReview.aspx.cs" Inherits="MCCSite.Web.Admin.AddReview" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<%@ Register TagPrefix="sbm" TagName="Sidebar" Src="/Web/Controls/Side-Bar-Menu.ascx" %>
<asp:Content ID="SideContent" runat="server" ContentPlaceHolderID="SideContent">
    <sbm:sidebar id="Sidebar1" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row-fluid">
        <div class="span10">
            <h2>
                Add a Review item</h2>
            <p>
                Fill out the form to add a review item to the site</p>
        </div>
    </div>
    <div class="row-fluid enrolment">
        <form action="/web/admin/addreview.aspx" method="post" class="form-horizontal">
        <div class="span6">
            <fieldset>
                <legend>Review</legend>
                <div class="control-group">
                    <label id="lblTitle" for="txtFrom" runat="server" class="control-label">
                        From:</label>
                    <div class="controls">
                        <input type="text" id="txtFrom" placeholder="Type something…" runat="server" />
                    </div>
                </div>
                <div class="control-group">
                    <label id="lblNews" for="txtReview" runat="server">
                        Review:</label>
                    <div class="controls">
                        <textarea id="txtReview" placeholder="Type something…" runat="server" rows="5" cols="6"></textarea>
                    </div>
                </div>
                <div class="control-group">
                    <label id="lblDate" for="txtDate" runat="server">
                        Review Date:</label>
                    <div class="controls">
                        <input type="text" id="txtDate" runat="server" rows="6" />
                        <a href="javascript:void(0);" id="linkCal" onclick="displayCalendar()" runat="server">
                            <i class="icon-calendar icon-large" style="padding-left: 6px;"></i></a>
                        <div id="datePicker" style="display: none;">
                            <asp:Calendar ID="calDate" OnSelectionChanged="calDate_SelectionChanged"
                                runat="server" />
                        </div>
                    </div>
                </div>
                <div class="text-center">
                    <asp:Button type="submit" cssclass="btn btn-primary" OnClick="btnSubmit_Click"  runat="server" id="btnSubmit" Text="Add Review"/>
                    <div class="clear bottom-50"  ></div>
                </div>
            </fieldset>
        </div>
        <div class="span6">
             <fieldset>
                <legend>Latest Reviews</legend>
           <div id="testimonialList" >
<asp:Repeater ID="rptTestimonials" OnItemDataBound="rptTestimonials_ItemDataBound" runat="server">
    <HeaderTemplate>
           
    </HeaderTemplate>   
    <ItemTemplate>
     <div class="testimonial-card" id="testCard">
             <p><span class="inline text-error testimonial-text apos">‘</span><span class="testimonial-text inline" runat="server" id="testText">I love your crèche!</span><span class=" testimonial-text inline text-error apos">’</span></p>
             <p> <span class="testimonial-name" runat="server" id="testName">Anonomous</span><span class="inline pull-right test-date" runat="server" id="testDate">Monday, 6 May 2013</span></p>
             </div>
    </ItemTemplate>
    <FooterTemplate>
        
    </FooterTemplate>
</asp:Repeater>
</div>
</fieldset>
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