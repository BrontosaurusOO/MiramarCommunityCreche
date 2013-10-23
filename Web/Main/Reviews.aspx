<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reviews.aspx.cs" Inherits="Web.Main.Reviews"%>
<%@ MasterType VirtualPath="~/Site.Master" %>
<%@ Register TagPrefix="sbm" TagName="Sidebar" Src="/Web/Controls/Side-Bar-Menu.ascx" %>

 <asp:Content ID="SideContent" runat="server" ContentPlaceHolderID="SideContent">
   <sbm:Sidebar id="Sidebar1" runat="server" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row-fluid">
<div class="span10">
<h2>Reviews & Testimonials</h2>

<p>Thank You to our parents and whanau who gave feedback on their first impressions and their child's experience.</p>
</div>
</div>

<div class="row-fluid">
<div class="span10">
<div id="testimonialList" >
<asp:Repeater ID="rptTestimonials" OnItemDataBound="rptTestimonials_ItemDataBound" runat="server">
    <HeaderTemplate>
           
    </HeaderTemplate>   
    <ItemTemplate>
     <div class="testimonial-card" id="testCard">
             <p><span class="inline text-error testimonial-text apos">‘</span><span class="testimonial-text inline" runat="server" id="testText">I love your crèche!</span><span class=" testimonial-text inline text-error apos">’</span></p>
             <p> <span class="testimonial-name" runat="server" id="testName">Anonymous</span><span class="inline pull-right test-date" runat="server" id="testDate">Monday, 6 May 2013</span></p>
             </div>
    </ItemTemplate>
    <FooterTemplate>
        
    </FooterTemplate>
</asp:Repeater>
</div>

</div>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JavascriptContent" runat="server">
</asp:Content>
