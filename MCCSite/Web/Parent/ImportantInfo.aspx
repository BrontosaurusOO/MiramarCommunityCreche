<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ImportantInfo.aspx.cs" Inherits="Web.Parent.ImportantInfo" %>
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
  <li class="active"><a href="/web/parent/importantinfo.aspx">Important Info</a></li>
  <li><a href="/web/parent/parentnews.aspx">News</a></li>
  <li><a href="/web/parent/community.aspx">Community</a></li>
  <li><a href="/web/parent/emergencies.aspx">Safety & emergencies</a></li>
  <li><a href="/web/parent/handoutforms.aspx">Handouts & forms</a></li>
</ul>
</div>
</div>
<div class="row-fluid">
<h3>Important Information</h3>
<div class="span10">

<h4>Illness</h4>

<p>Please do not bring your child to crèche if he/she is unwell. We do not have the necessary facilities to care for sick children.
We would appreciate a telephone call to let us know that your child is unwell.
If your child becomes unwell while at crèche we will contact you and request that you collect your child.  Please refer to our policy on illness/sickness.</p>

</div>
<div class="span10">

<h4>Sleeping children</h4>

<p >We have a separate policy regarding the procedures for children who require a rest or sleep.  We have 2 beds available for children to use and ample bed linen, which gets changed after every use.
Please talk to the Teachers regarding your child’s particular rest or sleep needs.  The crèche quiet room is set aside for children who need to rest or sleep.</p>
</div>
<div class="span10">
<h4>Withdrawal</h4>

<p >Please give us a <strong>minimum of 3 weeks notice</strong> prior to withdrawing your child from crèche. This then allows us to fill the vacancy as soon as possible.
 Leaving forms are available by Attendance register Bay. Please refer to the terms and conditions of the crèche Fees brochure for further information or contact the Senior teacher or Manager.
 </p>

</div>
<div class="span10">
<h4>Absentees</h4>
<p >If your child is going to be absent from any session please telephone the crèche as soon as possible and preferably before 8.45am. on that day.  Please refer to the “Payment of Fees” terms 
and conditions for information regarding payment of sessions when children are absent. If your child is going to be absent for longer than 3 weeks please talk to the Senior Teacher if you wish your child to 
remain on the roll as we require you to pay your usual child`s crèche fees and the Ministry of Education funding rate in respect of your child for the remainder of their absence (beyond three weeks).</p>
</div>

<div class="span10">
<h4>Allergies</h4>
<p>If your child has any allergies please inform the Senior Teacher immediately.  We keep a Register, which we update and refer to regularly.</p>
</div>

<div class="span10">
<h4>Behaviour Management</h4>
<p>The crèche has a behaviour management policy in place which parents are most welcome to read.  The principles of the policy are that each child will be treated with respect, dignity,
promote a sense of belonging and well-being, and each child is given positive guidance for appropriate behaviour which recognises the child’s developmental stages and age. </p>

<p>There is no physical ill-treatment, 
solitary confinement, deprivation of food or drink.  The Teachers aim to be fair and consistent in their approach.
Our policy also states that “no parent is to physically punish, hit their child or another child while at crèche”.
</p>
</div>

<div class="span10">
<h4>Change of address or telephone number</h4>
<p >Please let us know when you have a change of address or telephone number. This is important in case we need to get hold of you in an emergency. These details are kept by the Teachers and Manager.</p>
</div>

</div>
</asp:Content>
