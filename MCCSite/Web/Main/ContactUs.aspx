<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ContactUs.aspx.cs" Inherits="Web.Main.ContactUs" %>

<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="Content3" ContentPlaceHolderID="PageMetaContentChild" runat="server">
    <title>Miramar Community Crèche | Contact us</title>
    <meta name="description" content="Miramar Community Creche is a small not for profit crèche on Chelsea street, Miramar. MCC embraces all of the wonderful cultures of all children who attend." />
    <meta name="keywords" content="contact, opening hours, address, queries, map, miramar community creche, creche miramar, education, early childhood, child development, childhood education,early childhood education,child development center,early childhood development,child daycare" />
    <link href="http://www.miramarcommunitycreche.org.nz/contact-us" rel="canonical" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentChild" runat="server">
    <div class="row-fluid">
        <div class="span10">
            <h2>
                Contact Us</h2>
            <h4>
                We would love to chat about how we can help your children</h4>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span4">
            <h3>
                Any questions or queries?</h3>
            <div class="control-group">
                <label class="control-label" for="txtName">
                    Name</label>
                <div class="controls">
                    <input type="text" id="txtName" placeholder="Enter name..." runat="server" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="txtPhone">
                    Phone number</label>
                <div class="controls">
                    <input type="text" id="txtPhone" placeholder="Home or cell..." runat="server" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="txtEmail">
                    Email address</label>
                <div class="controls">
                    <input type="text" id="txtEmail" placeholder="E.g. username@gmail.com" runat="server" />
                </div>
            </div>
            <label for="txtComments">
                Comments</label>
            <textarea id="txtComments" rows="3" runat="server" cols="4"></textarea>
            <div>
                <asp:Button type="submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" runat="server"
                    ID="btnSubmit" Text="Send" />
            </div>

        </div>
        <div class="span4">
            <h3>
                Our Details</h3>
            <address>
                <p>
                    <strong>Opening hours</strong><br />
                    <strong>Monday - Friday</strong> 8.45am-1.30pm</p>
                <p>
                    The Teachers are available from 8.30am before each session and until 2.00pm.</p>
            </address>
            <address>
                <strong>Miramar Community Crèche</strong><br />
                29 Chelsea Street, Miramar<br />
                P O Box 15-054<br />
                Wellington, New Zealand
            </address>
            <address>
                <p>
                    <strong>Phone:</strong> +04 380 6547<br />
                    <strong>Fax:</strong> +04 380 6488<br />
                    <strong>Email:</strong> <a href="mailto:miramar.creche@xtra.co.nz">miramar.creche@xtra.co.nz</a></p>
            </address>
        </div>
        <div class="span4">
            <h3>
                Drop in...</h3>
            <div class="map">
                <iframe width="300" height="300" frameborder="0" scrolling="no" marginheight="0"
                    marginwidth="0" src="https://maps.google.co.nz/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=29+Chelsea+Street,+Miramar,+Wellington&amp;aq=0&amp;oq=29+Chelsea+Street,+Miramar&amp;sll=-40.799894,175.310128&amp;sspn=54.608483,120.673828&amp;ie=UTF8&amp;hq=&amp;hnear=29+Chelsea+St,+Miramar,+Wellington+6022&amp;t=m&amp;ll=-41.315852,174.817629&amp;spn=0.008058,0.010729&amp;z=15&amp;iwloc=A&amp;output=embed">
                </iframe>
                <br />
                <small><a href="https://maps.google.co.nz/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=29+Chelsea+Street,+Miramar,+Wellington&amp;aq=0&amp;oq=29+Chelsea+Street,+Miramar&amp;sll=-40.799894,175.310128&amp;sspn=54.608483,120.673828&amp;ie=UTF8&amp;hq=&amp;hnear=29+Chelsea+St,+Miramar,+Wellington+6022&amp;t=m&amp;ll=-41.315852,174.817629&amp;spn=0.008058,0.010729&amp;z=15&amp;iwloc=A"
                    style="color: #0000FF; text-align: left">View Larger Map</a></small>
            </div>
        </div>
    </div>
</asp:Content>
