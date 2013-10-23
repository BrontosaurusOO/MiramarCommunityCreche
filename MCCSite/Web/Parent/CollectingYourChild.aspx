<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CollectingYourChild.aspx.cs" Inherits="Web.Parent.CollectingYourChild"%>
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
  <li class="active"><a href="/web/parent/collectingyourchild.aspx">Collecting your child</a></li>
  <li><a href="/web/parent/importantinfo.aspx">Important Info</a></li>
  <li><a href="/web/parent/parentnews.aspx">News</a></li>
  <li><a href="/web/parent/community.aspx">Community</a></li>
  <li><a href="/web/parent/emergencies.aspx">Safety & emergencies</a></li>
  <li><a href="/web/parent/handoutforms.aspx">Handouts & forms</a></li>
</ul>
</div>
</div>

<div class="row-fluid">
<h3>Collecting your child</h3>

<div class="span10">
<h4>Home time</h4>

<p>Please collect your child promptly at the end of the session. Our hours of operation are 8.45 am to 1.30 pm Monday to Friday. Please inform the Senior Teacher if a different adult 
is collecting your child and remember to sign the Attendance Register.</p>

</div>
<div class="span10">
<h4>Parking</h4>

<p>For safety reasons, please do not park on the grass outside the crèche or community centre. Thank you for your co-operation with this.
We suggest that you lock your car while you are dropping off or picking up your child from crèche.  Please avoid parking in front of our neighbour’s drive-ways.</p>
</div>

<div class="span10">
<h4>Signing In and Out</h4>

<p>It is a legal requirement for the crèche to have a procedure for children to be signed in and out each session. Please ensure you complete this task each session.
The Attendance Register book is kept on the administration cabinet. Please record the time of your arrival and departure. </p>
</div>
</div>

</asp:Content>
