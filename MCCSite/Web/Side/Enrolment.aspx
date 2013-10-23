<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Enrolment.aspx.cs" Inherits="Web.Side.Enrolment" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<%@ Register TagPrefix="sbm" TagName="Sidebar" Src="~/Web/Controls/Side-Bar-Menu.ascx" %>
<asp:Content ID="SideContent" runat="server" ContentPlaceHolderID="SideContent">
    <sbm:Sidebar ID="Sidebar1" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row-fluid">
<div class="span10">
<ul class="breadcrumb">
              <li><a href="/Web/Side/waitinglist.aspx">Enrolling at crèche</a> <span class="divider">/</span></li>
              <li class="active">Enrolment</li>
            </ul>

</div>
</div>
    <div class="row-fluid">
        <div class="span10">
            <h2>
                Enrolment</h2>
            <p>
                Please fill in the following to form to add your child to our waiting list.</p>
        </div>
    </div>
    <div class="row-fluid enrolment">
        <form action="/web/side/enrolment.aspx" method="post" class="form-horizontal">
        <div class="span6">
            <fieldset>
                <legend>Child's Details</legend>
                <div class="control-group">
                    <label id="lblName" for="txtChildName" runat="server" class="control-label">
                        Child's First Name/s:</label>
                    <div class="controls">
                        <input type="text" id="txtChildName" placeholder="Type something…" runat="server" />
                    </div>
                </div>
                <div class="control-group">
                    <label id="lblSurname" for="txtChildSurname" runat="server">
                        Child's Surname/s:</label>
                    <div class="controls">
                        <input type="text" id="txtChildSurname" placeholder="Type something…" runat="server" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="checkbox inline" id="lblGender" for="chkGender" runat="server">
                        Gender:</label>
                    <div class="controls">
                        <input id="chkMale" type="checkbox" name="chkGender" runat="server" value="male" />
                        Male
                        <input id="chkFemale" type="checkbox" name="chkGender" runat="server" value="female" />
                        Female
                    </div>
                </div>
                <div class="control-group">
                    <label id="lblDOB" class="inline" runat="server">
                        Date of birth:</label>
                    <div class="controls">
                        <select id="ddlYear" runat="server">
                            <option>2009</option>
                            <option>2010</option>
                            <option>2011</option>
                            <option>2012</option>
                            <option>2013</option>
                            <option>2014</option>
                            <option>2015</option>
                            <option>2016</option>
                            <option>2017</option>
                            <option>2018</option>
                            <option>2019</option>
                        </select>
                        <select id="ddlMonth" runat="server">
                            <option>January</option>
                            <option>February</option>
                            <option>March</option>
                            <option>April</option>
                            <option>May</option>
                            <option>June</option>
                            <option>July</option>
                            <option>August</option>
                            <option>September</option>
                            <option>October</option>
                            <option>November</option>
                            <option>December</option>
                        </select>
                        <select id="ddlDay" runat="server">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>
                            <option>13</option>
                            <option>14</option>
                            <option>15</option>
                            <option>16</option>
                            <option>17</option>
                            <option>18</option>
                            <option>19</option>
                            <option>20</option>
                            <option>21</option>
                            <option>22</option>
                            <option>23</option>
                            <option>24</option>
                            <option>25</option>
                            <option>26</option>
                            <option>27</option>
                            <option>28</option>
                            <option>29</option>
                            <option>30</option>
                            <option>31</option>
                        </select>
                    </div>
                </div>
                <div class="control-group">
                    <label id="lblAddress" for="txtAddress" runat="server">
                        Home Address:</label>
                    <div class="controls">
                        <textarea type="text" id="txtAddress" placeholder="Type something…" runat="server"
                            rows="6" />
                    </div>
                </div>
                <div class="control-group">
                    <label id="lblPhone" for="txtPhone" runat="server">
                        Phone number (04):</label>
                    <div class="controls">
                        <input type="text" id="txtPhone" placeholder="(04) ..." runat="server" rows="6" />
                    </div>
                </div>
                <div class="control-group">
                    <label id="lblEmail" for="txtEmail" runat="server">
                        Email Address:</label>
                    <div class="controls">
                        <input type="text" id="txtEmail" placeholder="E.g. username@hotmail.com" runat="server"
                            rows="4" />
                    </div>
                </div>
                <div class="control-group">
                    <label id="lblComments" for="txtComments" runat="server">
                        Comments:</label>
                    <div class="controls">
                        <textarea type="text" id="txtComments" placeholder="Type something…" runat="server"
                            rows="6" />
                    </div>
                </div>
                </fieldset>
        </div>
        <div class="span6">
        <fieldset>
            <legend>Parent/Whanau's Details</legend><span class="small">(Enrolling parent/guardian
                who lives with the child)</span>
            <div class="control-group">
                <label id="lblParentName1" for="txtParentName1" runat="server">
                    Parent's fullname:</label>
                <div class="controls">
                    <input type="text" id="txtParentName1" placeholder="Type something…" runat="server" />
                </div>
            </div>
            <div class="control-group">
                <label id="lblParentName2" for="txtParentName2" runat="server">
                    Other Parent's fullname:</label>
                <div class="controls">
                    <input type="text" id="txtParentName2" placeholder="Type something..." runat="server" />
                </div>
            </div>
            <div class="control-group">
                <label id="lblParentPhone1" for="txtParentPhone1" runat="server">
                    Parent's Contact number:</label>
                <div class="controls">
                    <input type="text" id="txtParentPhone1" placeholder="Cell phone" runat="server" rows="6" />
                </div>
            </div>
            <div class="control-group">
                <label id="lblParentPhone2" for="txtParentPhone2" runat="server">
                    Other Parent's contact number:</label>
                <div class="controls">
                    <input type="text" id="txtParentPhone2" placeholder="Cell phone" runat="server" rows="6" />
                </div>
            </div>
            <legend>Preferred Days</legend>
            <div class="alert alert-info">
                <span class="label label-info">Please note</span> A minimum of two days is required</div>
            <div class="control-group">
                <label id="lblStartDate" for="txtStartDate" runat="server">
                    Ideal start date:</label>
                <div class="controls">
                    <input type="text" id="txtStartDate" runat="server" rows="6" />
                    <a href="javascript:void(0);" id="linkCal" onclick="displayCalendar()" runat="server">
                        <i class="icon-calendar icon-large" style="padding-left: 6px;"></i></a>
                    <div id="datePicker" style="display: none;">
                        <asp:Calendar ID="calStartDate" OnSelectionChanged="calStartDate_SelectionChanged"
                            runat="server" />
                    </div>
                </div>
            </div>
            <div class="control-group">
                <label class="checkbox inline" id="lblDays" for="chkDays" runat="server">
                    Days wanted:</label>
                <div class="controls">
                    <input id="chkMon" type="checkbox" name="chkDays" runat="server" value="Monday" />
                    Mon
                    <input id="chkTue" type="checkbox" name="chkDays" runat="server" value="Tuesday" />
                    Tue
                    <input id="chkWed" type="checkbox" name="chkDays" runat="server" value="Wednesday" />
                    Wed
                    <input id="chkThu" type="checkbox" name="chkDays" runat="server" value="Thursday" />
                    Thur
                    <input id="chkFri" type="checkbox" name="chkDays" runat="server" value="Friday" />
                    Fri
                </div>
            </div>
            </fieldset>
            <fieldset>
            <legend>Optional donation</legend>
            <p>
                Please Note: Once your child has been offered and has accepted a place at Miramar
                Community Crèche, you will be required to fill in a full enrolment form.</p>
            <p>
                Attached to the form is information and an attestation form for 20hrs ECE, which
                your child is eligible from the age of 3 years old.</p>
            <p>
                For children attesting their 20 hrs ECE, we ask for an optional charge of $9.75
                per session which covers the additional teacher we have employed here.</p>
            <div class="control-group">
                <label class="checkbox inline" id="lblFees" for="chkFees" runat="server">
                    Do you agree to pay this optional charge? :</label>
                <div class="controls">
                    <input id="chkY" type="checkbox" name="chkFees" runat="server" value="Yes" />
                    Yes
                    <input id="chkN" type="checkbox" name="chkFees" runat="server" value="No" />
                    No
                </div>
            </div>
            </fieldset>
        </div>
        <div class="text-center">
            <asp:Button type="submit" cssclass="btn btn-primary" OnClick="btnSubmit_Click"  runat="server" id="btnSubmit" Text="Enrol Now"/>
              <div class="clear bottom-50"  ></div>
        </div>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JavascriptContent" runat="server">
    <script type="text/javascript">
        function displayCalendar() {

            var cal = document.getElementById('datePicker');
            if (cal.style.display == 'none') {
                cal.style.display = 'block'
            }
            else {
                cal.style.display = 'none'
            }
        };
    </script>
</asp:Content>
