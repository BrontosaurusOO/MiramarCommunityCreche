<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="CrecheHire.aspx.cs" Inherits="Web.Side.CrecheHire" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageMetaContentChild" runat="server">
    <title>Miramar Community Crèche | Crèche hire</title>
    <meta name="description" content="Miramar Community Crèche is a small not for profit crèche on Chelsea street, Miramar. MCC embraces all of the wonderful cultures of all children who attend." />
    <meta name="keywords" content="creche hire,venue hire, miramar community creche, creche miramar, education, early childhood, child development, childhood education,early childhood education,child development center,early childhood development,child daycare" />
    <link href="http://www.miramarcommunitycreche.org.nz/creche-hire" rel="canonical" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentChild" runat="server">
    <div class="row-fluid">
        <form class="form-horizontal" action="/web/side/crechehire.aspx">
        <div class="span10">
            <h2>
                Crèche Hire</h2>
            <p>
                The crèche may be hired in the weekends for birthday parties or special events.</p>
            <p>
                Payment is by donation of <strong>$50.00</strong> to be paid prior to the event.</p>
            <p>
                The maximum number of people allowed in the building at any one time is 35.
            </p>
            <h4>
                Process of hirage</h4>
            <ol>
                <li>Contact the crèche to confirm date of booking</li>
                <li>Complete and hand in the hirage form</li>
                <li>Payment to be made at least one day prior to the event</li>
                <li>Collect the key the Friday before the event between the times of 8:30am - 3pm</li>
                <li>Enjoy your event and return the key no later than two days after the event.</li>
            </ol>
            <div class="alert alert-warning">
                <span class="label label-warning">Warning</span> If the key is not returned the
                hirer is liable for a $50.00 replacement cost.</div>
            <p>
                See the form for terms and conditions of hirage.</p>
            <a href="/files/hirageform.doc" class="btn btn-warning">Download Hire form</a>
        </div>
        </form>
    </div>
</asp:Content>
