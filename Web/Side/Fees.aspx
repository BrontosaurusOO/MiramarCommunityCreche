<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Fees.aspx.cs" Inherits="Web.Side.Fees" %>

<%@ Register TagPrefix="sbm" TagName="Sidebar" Src="/Web/Controls/Side-Bar-Menu.ascx" %>
<asp:Content ID="SideContent" runat="server" ContentPlaceHolderID="SideContent">
    <sbm:Sidebar ID="Sidebar1" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row-fluid">
        <div class="span10">
            <h2>
                Payment & Fees</h2>
            <p>
                Fees are payable as soon as your child starts crèche and will be payable for all
                sessions that your child is enrolled for including absence due to sickness, holiday
                or any other reason.</p>
            <p>
                Fees are not payable during the end of year school holidays or public holidays when
                crèche is closed.</p>
            <p>
                Crèche fees are payable even when parents are spending time at the crèche settling
                in their children once they have started.</p>
            <p>
                Crèche fees are payable if a Teacher Only Day should fall on a day that the crèche
                would normally be open.</p>

                <div class="alert alert-info"><span class="label label-info">Please note:</span> All all fees include GST.</div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span5">
            <h3>
                Enrolment Fee</h3>
            <p>
                The enrolment fee of $20.00 is charged per child and will be added to the first
                invoice issued after your child starts crèche.</p>
            <h3>
                Invoices</h3>
            <p>
                Invoices will be issued by the second Friday of each month and should be paid within
                7 days of receipt. Please check your child’s Distribution Pocket each time you come
                to crèche.</p>
            <h3>
                Payment</h3>
            <ul class="unstyled">
                <li>Our preference is for the fees to be paid by cheque or internet banking.</li>
                <li>If paying by cheque, please place your payment in the green money box above the
                    Administration Bay, just outside the crèche office door. Please cross your cheques
                    so they cannot be cashed.</li>
                <li>If paying by internet banking, the crèche bank account details appears on each invoice.
                </li>
                <li>If paying by cash, please see Lynda Hopkin, who will issue a signed receipt for
                    your payment. Alternatively you can post your payment to the Miramar Community Crèche,
                    P O Box 15-054, Miramar.</li>
            </ul>
            <h3>Receipts</h3>
            <p>
                Receipts will be issued as requested. If you would rather have one receipt at the
                end of the financial year (for tax purposes) we are only too happy to do this. Simply
                request this on your invoice at the end of the financial year.</p>
        </div>
        <div class="span5">
            <h3>
                Standard Fees</h3>
            <strong>For Children Under 2 years old</strong>
            <p>
                The current fee per 4 hour session (8.45am to 12.45 pm) is $30.00</p>
            <p class="text-center">
                Or</p>
            <p>
                The current fee per 4.75 hour session (8.45am to 1.30 pm) is $31.50</p>
            <strong>For Children aged between 2 and 3 years old</strong>
            <p>
                The current fee per 4.75 hour session (8.45am to 1.30 pm) is $31.50</p>
            <strong>For children over 3 years of age, receiving 20 hours ECE</strong>
            <p>
                An optional charge of $9.75 per 4.75 hour session (8.45am to 1.30pm)
                Plus $6.53 per unattested hour, over and above 20 hours per week</p>
            <h3>
                Work and Income NZ</h3>
            <p>
                If you are eligible for a childcare subsidy from "Work and Income NZ" you will be
                expected to pay full fees until the crèche receives notification of your subsidy
                approval. If the subsidy is backdated resulting in overpaid fees we will refund
                the difference or credit the next invoice.
            </p>
            <p>
                It is the parents responsiblitity to inform WINZ of any changes to their childs
                crèche attendance.</p>
            <p>
                Please talk to the Senior teacher if you require further information eligilbity
                for the Childcare subsidy. The application form needs to be signed by the Senior
                Teacher.</p>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JavascriptContent" runat="server">
</asp:Content>
