using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Threading;
using System.ComponentModel;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;

namespace Web.Side
{
    public partial class Enrolment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { }

        protected void SendMail()
        {
            SmtpClient client = new System.Net.Mail.SmtpClient();

            //Password of your gmail address
            System.Security.SecureString password = new System.Security.SecureString();
            password.AppendChar('p');
            password.AppendChar('o');
            password.AppendChar('h');
            password.AppendChar('u');
            password.AppendChar('t');
            password.AppendChar('a');
            password.AppendChar('k');
            password.AppendChar('a');
            password.AppendChar('w');
            password.AppendChar('a');

            // Set the e-mail destinations.
            string from = "miramarcommunitycreche@gmail.com";
            string to = "miramar.creche@xtra.co.nz";

            client.Host = "smtp.gmail.com";
            client.Port = 587;
            client.EnableSsl = true;
            client.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            client.Credentials = new NetworkCredential(from, password);
            ServicePointManager.ServerCertificateValidationCallback =
   delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors)
   { return true; };
            client.Timeout = 20000;

            // Specify the message content.
            MailMessage mail = new MailMessage();

            //From address to send email
            mail.From = new MailAddress(from);
            //To address to send email
            mail.To.Add(to);

            mail.Body = MakeEmailBody();

            mail.BodyEncoding = System.Text.Encoding.UTF8;

            mail.Subject = "Enrollment from website";
            mail.SubjectEncoding = System.Text.Encoding.UTF8;

            // Passing values to smtp object
            client.Send(mail);

            // Clean up.
            mail.Dispose();
        }

        public void btnSubmit_Click(Object sender, EventArgs e)
        {
            try
            {
                SendMail();
                Master.AddSuccessMessage("Your enrollment was sent successfully. ");
                clearAllFields();
            }
            catch (Exception)
            {
                Master.AddErrorMessage("Sorry, an error occurred. Please try again later or download the form and bring it in to us.");
            }
        }

        private void clearAllFields()
        {
            txtChildName.Value = "";
            txtChildSurname.Value = "";
            chkMale.Checked = false;
            chkFemale.Checked = false;
            ddlDay.SelectedIndex = 0; ddlMonth.SelectedIndex = 0; ddlYear.SelectedIndex = 0;
            txtAddress.Value = "";
            txtPhone.Value = "";
            txtEmail.Value = "";
            txtComments.Value = "";
            txtParentName1.Value = "";
            txtParentName2.Value = "";
            txtParentPhone1.Value = "";
            txtParentPhone2.Value = "";
            txtStartDate.Value = "";
            chkMon.Checked = false;
            chkTue.Checked = false;
            chkWed.Checked = false;
            chkThu.Checked = false;
            chkFri.Checked = false;
            chkY.Checked = false;
            chkN.Checked = false;
        }

        protected void calStartDate_SelectionChanged(object sender, EventArgs e)
        {
            DateTime date = calStartDate.SelectedDate;
            txtStartDate.Value = String.Format("{0:dd/MM/yyyy}", date);
        }

        protected string MakeEmailBody()
        {
            string body = string.Empty;

            body += lblName.InnerText + txtChildName.Value + " " + txtChildSurname.Value + System.Environment.NewLine;
            body += lblGender.InnerText + " " + (chkMale.Checked ? "Male" : "Female") + System.Environment.NewLine;
            body += lblDOB.InnerText + " " + ddlDay.Value + "/" + ddlMonth.Value + "/" + ddlYear.Value + System.Environment.NewLine;
            body += lblAddress.InnerText + " " + txtAddress.Value + System.Environment.NewLine;
            body += lblPhone.InnerText + " " + txtPhone.Value + System.Environment.NewLine;
            body += lblEmail.InnerText + " " + txtEmail.Value + System.Environment.NewLine;
            body += lblComments.InnerText + " " + txtComments.Value + System.Environment.NewLine;

            body += lblParentName1.InnerText + " " + txtParentName1.Value + System.Environment.NewLine;
            body += lblParentName2.InnerText + " " + txtParentName2.Value + System.Environment.NewLine;
            body += lblParentPhone1.InnerText + " " + txtParentPhone1.Value + System.Environment.NewLine;
            body += lblParentPhone2.InnerText + " " + txtParentPhone2.Value + System.Environment.NewLine;
            body += "Ideal start date: " + txtStartDate.Value + System.Environment.NewLine;
            body += lblDays.InnerText + " ";

            if (chkMon.Checked) body += chkMon.Value + ", ";
            if (chkTue.Checked) body += chkTue.Value + ", ";
            if (chkWed.Checked) body += chkWed.Value + ", ";
            if (chkThu.Checked) body += chkThu.Value + ", ";
            if (chkFri.Checked) body += chkFri.Value + " ";

            body += System.Environment.NewLine;

            body += lblFees.InnerText + " ";
            body += (chkY.Checked ? chkY.Value : chkN.Value);


            body += System.Environment.NewLine;

            return body;
        }
    }
}