<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profiles.aspx.cs" Inherits="Web.Side.Profiles" %>
<%@ Register TagPrefix="sbm" TagName="Sidebar" Src="/Web/Controls/Side-Bar-Menu.ascx" %>

 <asp:Content ID="SideContent" runat="server" ContentPlaceHolderID="SideContent">
   <sbm:Sidebar id="Sidebar1" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row-fluid">
<div class="span10">
<h2>What is an individual profile?</h2>
</div>
</div>

<div class="row-fluid">
<div class="span6">
<p> Individual profile is a collection of information about your child during his/her time at crèche.</p>
<p> It is information that the crèche Teachers would like to share with parents/caregivers to inform you how your child is progressing at crèche. </p>

<p >Staff will use a variety of techniques and methods to collect information e.g. samples of artwork – pictures or paintings, anecdotal observations, Learning stories, the ‘Me Sheet’, photos of their work, e.g.; block construction.
The Teachers hope to record information in your child`s profile at least every six weeks. These records will be about your child`s progress and how they are developing. </p>

<p >For example, particular events, situations or happenings, examples of their language, their social interaction for instance of which stage of social development e.g. co-operative, parallel, their physical skills, any humorous anecdotes.
This will not be an opportunity for criticisms or comparisons, rather an opportunity to focus on the uniqueness of each child and their skills that are developing and emerging.</p>

<p >The Teachers Endeavour to do ongoing assessment/observations on each child. These observations form the basis of our programme so that we can meet the needs of your children at this particular crèche.
Each Teacher has a ‘focus group’ of children to observe.</p>

<p >The teachers will share these observations with the child`s parents for their input and guidance. We welcome feedback from parents/whanau using the Parents/Whanau Voice forms and comments in the Feedback forms in the children`s profiles.
If you want to see your child`s Individual Profile at any time just let one of the teachers know or you can access it by the front door below the children's individual pockets. If you do not wish us to develop a Profile of your child please also let us know.</p>

<p>Any queries please chat to one of the teachers</p>

<p><a href="#myModal" data-toggle="modal" class="text-large">Click here</a> to see a brief example of a <a href="#myModal" data-toggle="modal" class="text-large">Child's Individual profile</a>.</p>

            <!-- Modal -->
            <div id="myModal" class="modal hide fade wide" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">An Individual profile</h3>
              </div>
              <div class="modal-body">
                <p>As a nice memento from MCC and a way of seeing what your child does at crèche we construct a profile all about them and their experiences.</p>
                
                <div id="myCarousel" class="carousel slide">
                <ol class="carousel-indicators">
                  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                  <li data-target="#myCarousel" data-slide-to="1" class=""></li>
                  <li data-target="#myCarousel" data-slide-to="2" class=""></li>
                  <li data-target="#myCarousel" data-slide-to="3" class=""></li>
                  <li data-target="#myCarousel" data-slide-to="4" class=""></li>
                  <li data-target="#myCarousel" data-slide-to="5" class=""></li>
                  <li data-target="#myCarousel" data-slide-to="6" class=""></li>
                  <li data-target="#myCarousel" data-slide-to="7" class=""></li>
                </ol>
                <div class="carousel-inner">
                  <div class="item active">
                    <img src="/Images/ProfileScans/front_page.jpeg" alt=""/>
                    
                  </div>
                  <div class="item">
                    <img src="/Images/ProfileScans/aspirations_page.jpg" alt=""/>
                    
                  </div>
                  <div class="item ">
                    <img src="/Images/ProfileScans/teachers_welcome.jpg" alt=""/>
                    
                  </div>
                  <div class="item">
                    <img src="/Images/ProfileScans/about_me_page.jpg" alt=""/>
                    
                  </div>
                  <div class="item">
                    <img src="/Images/ProfileScans/about_profile_page.jpg" alt=""/>
                    
                  </div>
                  <div class="item">
                    <img src="/Images/ProfileScans/Te_Whariki_page.jpg" alt=""/>
                    
                  </div>
                  <div class="item">
                    <img src="/Images/ProfileScans/personal_child_page.jpg" alt=""/>
                    
                  </div>
                  <div class="item">
                    <img src="/Images/ProfileScans/whanau_family_voice_page.jpg" alt=""/>
                    
                  </div>
                </div>
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
            </div>
              </div>
              <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
              </div>
            </div>
</div>
<div class="span4 right-5">
<img alt="" src="/images/profilescans/front_page.jpeg" />
</div>
</div>
<div class="row-fluid">
<div class="span10">
<h4>Download forms</h4>

<p>If you require any forms for your child's profile or want to take a look at what we include you can download the forms here.</p>
<a href="/files/WhanauFamilyVoice.docx" class="btn btn-warning">Download Whanau Family voice</a>
<a href="/files/Individual profile sheet.docx" class="btn btn-warning">Download Individual profile sheet</a>
</div>
</div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JavascriptContent" runat="server">
</asp:Content>
