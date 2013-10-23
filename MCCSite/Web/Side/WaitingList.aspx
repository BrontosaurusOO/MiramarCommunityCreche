<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WaitingList.aspx.cs" Inherits="Web.Side.WaitingList" %>
<%@ Register TagPrefix="sbm" TagName="Sidebar" Src="/Web/Controls/Side-Bar-Menu.ascx" %>

 <asp:Content ID="SideContent" runat="server" ContentPlaceHolderID="SideContent">
   <sbm:Sidebar id="Sidebar1" runat="server" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<div class="row-fluid">
<div class="span10">
<h2>Enrolling at our crèche</h2>
</div>
<div class="span2 top-15">
    <a class="btn btn-primary" id="enrolButton" href="/Web/Side/Enrolment.aspx">Enrol now</a>
</div>
</div>
<div class="row-fluid">
<div class="span10">
<h4>Enrolling</h4>
</div>
</div>
<div class="row-fluid">
<div class="span4">
<p >If you would like to find out more about enrolling your child you can do this in the following different ways:</p>
<ul class="unstyled">
    <li>Give our centre a <a href="/web/main/contactus.aspx" >call</a> and ask for the senior teacher or manager</li>
    <li>Come to visit and observe the centre in action upon arrangement</li>
    <li>Download the form and either post or email to go on to the Waiting list</li>
    <li>Or click the 'Enrol Now button to fill out the form online</li>
</ul>

<p >Feel free to ask any questions you've got by contacting the crèche after our session has finished at 1:30pm.</p>
</div>
<div class="span6 right-5">
<img alt="MCC" src="/images/hands-art.png" />
</div>
</div>
<div class="row-fluid">
<div class="span10">
<h4>Waiting List</h4>

<p >If a vacancy does not already exist you can put your child’s name on the waiting list.
We have waiting lists for all the sessions so we suggest early enrolment.
We take enrolments of children from birth. The waiting list is maintained by the Senior Teacher.</p>

<div class="alert alert-info"><span class="label label-info">Please note:</span> There is a minimum of <strong>two days</strong> that we require all children who attend crèche to attend.</div>
</div>
</div>
<div class="row-fluid">
<div class="span10">
<h4>Immunisation Register</h4>

<p >The Ministry of Health requires that all early childhood Centres maintain an update register of all children’s immunisation status.
The Senior Teacher needs to sight your child’s immunisation chart when your child starts attending crèche. Parents are required to bring in their child's plunket book upon starting crèche.</p>
</div>
</div>
<div class="row-fluid">
<div class="span10">
<h4>Casual sessions</h4>
<div class="alert alert-info"><span class="label label-info">Please note:</span> Casual sessions are for children who are enrolled only.</div>
<p >If you would like your child to attend a session on a casual basis please telephone the crèche after 8.30am on the day you wish them to attend or discuss with the Senior teacher if a vacancy is available. 
The rolls are kept full but occasionally we have a vacancy as a result of another child away on holiday or due to sickness. Casual fees are the same amount per session as regular fees.</p>
</div>
</div>

</asp:Content>

