<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Reviews.aspx.cs" Inherits="Web.Main.Reviews" %>

<%@ MasterType VirtualPath="~/Site.master" %>
<asp:Content ID="Content3" ContentPlaceHolderID="PageMetaContentChild" runat="server">
    <title>Miramar Community Crèche | Reviews</title>
    <meta name="description" content="Miramar Community Creche is a small not for profit crèche on Chelsea street, Miramar. MCC embraces all of the wonderful cultures of all children who attend." />
    <meta name="keywords" content="reviews, testimonials, feedback, like, parents, thanks, miramar community creche, creche miramar, education, early childhood, child development, childhood education,early childhood education,child development center,early childhood development,child daycare" />
    <link href="http://www.miramarcommunitycreche.org.nz/reviews" rel="canonical" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentChild" runat="server">
    <div class="row-fluid">
        <div class="span10">
            <h2>
                Reviews & Testimonials</h2>
            <p>
                Thank You to our parents and whanau who gave feedback on their first impressions
                and their child's experience.</p>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span10">
            <div id="testimonialList">
                <asp:Repeater ID="rptTestimonials" OnItemDataBound="rptTestimonials_ItemDataBound"
                    runat="server">
                    <HeaderTemplate>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="testimonial-card" id="testCard">
                            <p>
                                <span class="inline text-error testimonial-text apos">‘</span><span class="testimonial-text inline"
                                    runat="server" id="testText">I love your crèche!</span><span class=" testimonial-text inline text-error apos">’</span></p>
                            <p>
                                <span class="testimonial-name" runat="server" id="testName">Anonymous</span><span
                                    class="inline pull-right test-date" runat="server" id="testDate">Monday, 6 May 2013</span></p>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
