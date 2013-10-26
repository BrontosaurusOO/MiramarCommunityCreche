<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Emergencies.aspx.cs" Inherits="Web.Parent.Emergencies" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentChild" runat="server">
    <div class="row-fluid">
        <div class="span10">
            <h2>
                For Parents</h2>
            <ul class="nav nav-tabs">
                <li><a href="/web/parent/dayatCreche.aspx">Day at crèche</a></li>
                <li><a href="/web/parent/collectingyourchild.aspx">Collecting your child</a></li>
                <li><a href="/web/parent/importantinfo.aspx">Important Info</a></li>
                <li><a href="/web/parent/parentnews.aspx">News</a></li>
                <li><a href="/web/parent/community.aspx">Community</a></li>
                <li class="active"><a href="/web/parent/emergencies.aspx">Safety & emergencies</a></li>
                <li><a href="/web/parent/handoutforms.aspx">Handouts & forms</a></li>
            </ul>
        </div>
    </div>
    <div class="row-fluid">
        <h3>
            Safety & Emergency Information</h3>
        <div class="span10">
            <h4>
                Medical Emergencies</h4>
            <p>
                The Teachers will take any action necessary to keep the children safe in the event
                of any medical emergency. You will be contacted as soon as possible. In the event
                of a natural emergency please refer to the procedures displayed on the crèche noticeboard
                or in our policy folder which is located above the signin register.</p>
        </div>
        <div class="span10">
            <h4>
                Earthquake & Evacuation procedures</h4>
            <p>
                We hold regular fire and earthquake drills with the children as required by the
                NZ Fire Service. We have a procedure displayed to inform parents what action we
                would take in a civil emergency. In a civil defence emergency we will remain at
                the crèche until parents come to collect their child unless the evacuation is due
                to a Tsunami. If we need to evacuate a sign will be left on the door and we will
                alert all parents by text as soon as we reach a safe destination. Please refer to
                our policy folder for more details.</p>
        </div>
        <div class="span10">
            <h4>
                Civil Defence</h4>
            <p>
                Each child must supply an emergency blanket and yearly, we will be asking for all
                parents to donate an item of food for our civil defence emergency kit. For further
                details, please refer to the civil defence information in the Induction Pack.</p>
        </div>
    </div>
</asp:Content>
