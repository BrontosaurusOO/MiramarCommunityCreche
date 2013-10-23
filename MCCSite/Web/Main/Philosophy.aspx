<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Philosophy.aspx.cs" Inherits="Web.Main.Philosophy" %>
<%@ Register TagPrefix="sbm" TagName="Sidebar" Src="/Web/Controls/Side-Bar-Menu.ascx" %>

 <asp:Content ID="SideContent" runat="server" ContentPlaceHolderID="SideContent">
   <sbm:Sidebar id="Sidebar1" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="row-fluid">
<div class="span10">
   <h2>What we stand for</h2>
</div>
</div>
<div class="row-fluid">
<div class="span10">
        <h4>Our Mission Statement </h4>
        <p>The crèche is a place and a community in which staff and parents work together to fulfill the child’s developmental potential by providing quality early childhood learning in a safe, secure, supportive and positive environment.  </p>
    </div>

    </div>

    <div class="row-fluid">
<div class="span10">
        <h4>Our Philosophy</h4>
        <h5>Guiding Principles:</h5>
    
        <ul class="unstyled left-15">
            <li>To provide a High Quality Early Childhood Education Programme.</li>
            <li>To work in Partnership with Parents, whanau, children and Teachers.</li>
            <li>To carry out Assessment and Evaluation to ensure Quality.</li>
            <li>To ensure Fairness and Equity for all children, parents and staff.</li>
        </ul>

        <p>At this crèche we believe that children learn most effectively through a <em>“self-choice”</em> approach to early childhood education.  The programme is based on Te Whariki (early childhood education curriculum). Children learn best when their health and well-being is nurtured, they have a sense of belonging; they are encouraged to contribute, through active exploration, by observing and by imitating others and through interaction and communication with others and the environment. </p>

        <p>We are committed to our responsibilities under the Treaty of Waitangi (Te Tiriti o Waitangi) and recognise the value and importance of Maori language and culture to our children here in Aotearoa, New Zealand.  We aim to celebrate the cultural identities of all of our children, fostering an inclusive learning environment, and to respect and celebrate all of our children’s cultural backgrounds.</p>

        <p>We aim to have all core curriculum activities, including outdoor activities, available each session and to all children, (appropriate to their age), regardless of race, special needs, gender and ability.</p>

        <p>We aim to provide a programme that enhances a child’s physical, emotional, social, cognitive, and language development. We recognise the value of shared group activities and encourage the children to participate where appropriate.</p>

        <p>Limits and guidelines are set at crèche on the children’s behaviour to ensure that the children are kept safe from harm.  We aim to be fair and consistent, and use a positive approach to managing children’s behaviour.</p>
        <p>To ensure that we are providing a quality programme we endeavour to regularly assess, observe, and evaluate both the programme and the individual children’s progress.</p>

        <p>We firmly believe in the importance of Teachers and Parents working together in the care and education of the children. Parent involvement is valued and appreciated.</p>

        <p><strong>Last Updated: </strong>August 2012</p>
    </div>
    </div>
        
        <div class="row-fluid">
    <div class="span10">
<h4>Files</h4>

<p>You can download and read our full philosophy, strategic plan below.</p>
<a href="/Files/StrategicPlan2011-2015.doc" class="btn btn-warning">Download Strategic plan</a>
<a href="/files/Philosophy2012.doc" class="btn btn-warning">Download Philosophy</a>
</div>
</div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JavascriptContent" runat="server">
</asp:Content>
