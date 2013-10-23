<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ParentNews.aspx.cs" Inherits="Web.Parent.ParentNews"%>
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
  <li class="active"><a href="/web/parent/parentnews.aspx">News</a></li>
  <li><a href="/web/parent/community.aspx">Community</a></li>
  <li><a href="/web/parent/emergencies.aspx">Safety & emergencies</a></li>
  <li><a href="/web/parent/handoutforms.aspx">Handouts & forms</a></li>
</ul>
</div>
</div>

<div class="row-fluid">
<h3>Where to get crèche news</h3>
<div class="span10">
<h4>Distribution Pockets</h4>

<p >Your child will be allocated a named pocket on the red hessian display pocket system. This will be shown to you when your child begins at crèche. Fee invoices are issued into these 
pockets along with any newsnotes or notices for you.  Please remember to check this pocket every session.</p>
</div>

<div class="span10">
<h4>Notice boards</h4>

<p >Please take the time to read the information on the crèche noticeboards. Information about civil defence procedures, Teachers Profiles, Term dates, a copy of our licence etc are displayed 
on these noticeboards. We also have a daily whiteboard where daily notices and information are written. Please check this noticeboard every session as it often has important information.</p>

<p>The Manager/Advisory Committee also has a noticeboard, which they display the current minutes of meetings, agendas, monthly financial reports and monthly Teachers reports. We also have a washing roster which 
requires parents to take home washing possibly 2 to 3 times in the year. </p>
</div>

<div class="span10">
<h4>Newsnote</h4>

<p >Every week you will receive a news note informing you of happenings, events, etc at the crèche. It contains important information so please ensure you take the time to read it.</p>
</div>

<div class="span10">
<h4>Parent Resource/Library box</h4>

<p >We have a supply of resources and books that parents are welcome to borrow. Included in this are copies of our Charter, ERO report, etc.
We also subscribe to several parent and children magazines so please feel free to borrow any item that interests you.  Please let a Teacher know if you wish to take a book home.</p>
</div>
</div>
</asp:Content>
