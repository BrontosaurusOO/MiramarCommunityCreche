﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator.master" AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs" Inherits="MCCSite.Web.Admin.Dashboard" %>

<%@ MasterType VirtualPath="~/Administrator.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentChild" runat="server">
	<div class="row-fluid" id="loggedOutContent" runat="server" >
		<div class="span10">
			<h1>
				Miramar Community Crèche Admin
			</h1>
			<p>
				Please log in to access and use the admin tools.</p>
			<p>
				Only users with Admin access can see this page and the pages in the blue bar at the top of this page.</p>
		</div>
		</div>
        <div class="row-fluid" id="dashboardContent" runat="server" >
			<div class="row-fluid">
				<div class="span10">
					<h1>
						Miramar Community Crèche Admin
					</h1>
					<p>
						Here you can see and edit the content on your website.</p>
					<p>
						Only Admin can see this page and the pages in the blue bar at the top of this page.</p>
				</div>
			</div>
			<div class="row-fluid">
            <div class="span5">
                <h3>
                    Children Quotes</h3>
                <blockquote>
                    <p>
                        Anyone who does anything to help a child in his life is a hero to me.</p>
                    <small><cite title="Goodreads">Fred Rogers</cite></small>
                </blockquote>
                <br />
                <blockquote>
                    <p>
                        Ask yourself: 'Do you feel the need to laminate?' Then teaching is for you.</p>
                    <small><cite title="Goodreads">Gordon Korman</cite></small>
                </blockquote>
                <blockquote>
                    <p>
                       Both young children and old people have a lot of time on their hands. That's probably why they get along so well.</p>
                    <small><cite title="Goodreads">Jonathan Carroll</cite></small>
                </blockquote>
            </div>
            <div class="span5">
                
            </div>
			</div>
        </div>
</asp:Content>
