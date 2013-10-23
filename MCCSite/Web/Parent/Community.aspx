<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Community.aspx.cs" Inherits="Web.Parent.Community"%>
<%@ Register TagPrefix="sbm" TagName="Sidebar" Src="/Web/Controls/Side-Bar-Menu.ascx" %>

 <asp:Content ID="SideContent" runat="server" ContentPlaceHolderID="SideContent">
   <sbm:Sidebar id="Sidebar1" runat="server" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<div class="row-fluid">
<div class="span10">
<h2>For Parents</h2>

<ul class="nav nav-tabs">
  <li><a href="/web/parent/dayatCreche.aspx">Day at crèche</a></li>
  <li><a href="/web/parent/collectingyourchild.aspx">Collecting your child</a></li>
  <li><a href="/web/parent/importantinfo.aspx">Important Info</a></li>
  <li><a href="/web/parent/parentnews.aspx">News</a></li>
  <li class="active"><a href="/web/parent/community.aspx">Community</a></li>
  <li><a href="/web/parent/emergencies.aspx">Safety & emergencies</a></li>
  <li><a href="/web/parent/handoutforms.aspx">Handouts & forms</a></li>
</ul>
</div>
</div>

<div class="row-fluid">
<h3>Our Community</h3>

<div class="span10">
<h4>Parent contribution</h4>

<p >We appreciate parent contribution either during the sessions or out of hours e.g. mending, being involved at committee level, or by sharing any special talents that you may have.
We are particularly appreciative of parents volunteering to join the Advisory Committee as it lightens the load for the existing members. </p>
<p> Being part of the Committee is a good way of being informed about 
what is happening at crèche so please consider joining or come along to a meeting.
All families are placed on a washing roster, called on twice per year, to take a bag of washing home. The washing roster will be pinned up at the front entry of the crèche.</p>
</div>

<div class="span10">
<h4>Resource/collage donations</h4>

<p >We welcome all donations of resources that the children can use in their play, e.g. cardboard boxes, paper, material, old cards, junk, wood offcuts, shells, leaves, bark,
bottle tops, grocery boxes, newspaper, plastic supermarket bags, wool, buttons, wood shavings, twigs, etc.</p>
</div>
<div class="span10">
<h4>Grounds Maintenance</h4>

<p >The crèche is responsible for maintaining the grounds inside the picket fence area outside. We are always keen to hear from parents who are able to assist with the gardening and maintenance 
of the outside area cleaning the safety matting.</p>
</div>
</div>
</asp:Content>
