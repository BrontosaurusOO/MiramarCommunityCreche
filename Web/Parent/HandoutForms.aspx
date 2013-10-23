<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HandoutForms.aspx.cs" Inherits="MCCSite.Web.Parent.HandoutForms" %>
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
  <li><a href="/web/parent/community.aspx">Community</a></li>
  <li><a href="/web/parent/emergencies.aspx">Safety & emergencies</a></li>
  <li class="active"><a href="/web/parent/handoutforms.aspx">Handouts & forms</a></li>
</ul>
</div>
</div>

<div class="row-fluid">
<h3>Handouts & Forms</h3>

<div class="span10 top-15">
<h4>Crèche Guide</h4>

<p>When your child first starts crèche to help them settle in and feel a sense of security and belonging we will offer each child a teacher as their primary caregiver.</p>
<a href="/files/crecheguide.doc" class="btn btn-warning">Download crèche guide</a>
</div>

<div class="span10 top-15">
<h4>Crèche Fees</h4>

<p>This flyer will help you understand all about the different methods of paying for you childs learning at MCC or you can check out our <a href="/Web/Side/Fees.aspx"> payment and fees</a> page.</p>
<a href="/files/crechefees.doc" class="btn btn-warning">Download crèche fees flyer</a>
</div>

</div>
</asp:Content>
