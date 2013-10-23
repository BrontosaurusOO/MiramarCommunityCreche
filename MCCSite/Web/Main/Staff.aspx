<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Staff.aspx.cs" Inherits="Web.Main.Staff" %>

<%@ Register TagPrefix="sbm" TagName="Sidebar" Src="/Web/Controls/Side-Bar-Menu.ascx" %>
<asp:Content ID="SideContent" runat="server" ContentPlaceHolderID="SideContent">
    <sbm:Sidebar ID="Sidebar1" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Staff</h2>
    <div class="row-fluid">
        <div class="span10" id="staffWelcome">
            <p>
                The Teachers have a variety of Early childhood education qualifications and experience.
                Ongoing training and courses are budgeted for in the annual budget and Teachers
                take opportunities to continue their training and knowledge. The crèche employs
                one Senior Teacher, three permanent Teachers, a part-time teacher, a manager, financial
                administrator, and a cleaner. We also employ relievers when a permanent staff member
                is absent and currently we have a voulenteer that works two days at the crèche who
                is currently studying for his teaching diploma in ECE and gaining experience working
                at the crèche.
            </p>
        </div>
        <div class="row-fluid">
            <div class="span10">
                <ul class="thumbnails">
                    <li class="span4">
                        <div class="thumbnail">
                            <img data-src="holder.js/300x200" src="/images/staff/lynda_hopkin.jpg" alt=""/>
                            <h4>
                                Lynda Hopkin</h4>
                            <strong>Senior Teacher</strong>
                            <p class="staff-attributes">
                                <strong>Qualifications:</strong> Diploma of Teaching ECE and fullteacher
                                regitration. First Aid</p>
                            <p class="staff-attributes">
                                <strong>Years of service:</strong> 16 years</p>
                        </div>
                    </li>
                    <li class="span4">
                        <div class="thumbnail">
                            <img data-src="holder.js/300x200" src="/images/staff/linda_tinson_1.jpg" alt=""/>
                            <h4>
                                Linda Tinson</h4>
                            <strong>Teacher</strong>
                           <p class="staff-attributes">
                                <strong>Qualifications:</strong> Dipolma Teaching ECE, full teacher registration.
                                First Aid</p>
                            <p class="staff-attributes">
                                <strong>Years of service:</strong> 2 years</p>
                        </div>
                    </li>
                    <li class="span4">
                        <div class="thumbnail">
                            <img data-src="holder.js/300x200" src="/images/staff/jane_hann.jpg" alt=""/>
                            <h4>
                                Jane Hann</h4>
                            <strong>Teacher</strong>
                           <p class="staff-attributes">
                                <strong>Qualifications:</strong> BA Graduate Dipolma Teaching ECE and
                                Full teacher registration. First Aid
                            </p>
                           <p class="staff-attributes">
                                <strong>Years of service:</strong> 6 years</p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span10">
                <ul class="thumbnails">
                    <li class="span4">
                        <div class="thumbnail">
                            <img data-src="holder.js/300x200" src="/images/staff/ellen_grenville.jpg" alt=""/>
                            <h4>
                                Ellen Grenville</h4>
                            <strong>Teacher</strong>
                           <p class="staff-attributes">
                                <strong>Qualifications:</strong> Bachelor of Education Teaching ECE, Diploma
                                Teaching ECE and full teacher registration</p>
                            <p class="staff-attributes">
                                <strong>Years of service:</strong> 1 years</p>
                        </div>
                    </li>
                    <li class="span4">
                        <div class="thumbnail">
                            <img data-src="holder.js/300x200" src="/images/staff/helen_lynch.jpg" alt=""/>
                            <h4>
                                Helen Lynch</h4>
                            <strong>Part-time Teacher</strong>
                          <p class="staff-attributes">
                                <strong>Qualifications:</strong> Bachelor of Education Teaching Early
                                Childhood</p>
                           <p class="staff-attributes">
                                <strong>Years of service:</strong> 2 years (former Teacher until 2006)</p>
                        </div>
                    </li>
                    <li class="span4">
                        <div class="thumbnail">
                            <img data-src="holder.js/300x200" src="/images/staff/tracey_edwards.jpg" alt=""/>
                            <h4>
                                Tracey Edwards</h4>
                            <strong>Manager/Privacy Officer</strong>
                           <p class="staff-attributes">
                                <strong>Qualifications:</strong> Certificate Playcentre</p>
                            <p class="staff-attributes">
                                <strong>Years of service:</strong> New Employee</p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JavascriptContent" runat="server">
</asp:Content>
