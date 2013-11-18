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


namespace Web.Main
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

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

            mail.Subject = "Inquiry from website";
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
                Master.AddSuccessMessage("Your message was sent successfully. ");
                clearAllFields();
            }
            catch (Exception)
            {
                Master.AddErrorMessage("Sorry, an error occurred. Please try again later or feel free to give us a call.");
            }
        }

        protected string MakeEmailBody()
        {
            string body = string.Empty;

            body += "Name: " + txtName.Value + System.Environment.NewLine;
            body += "Phone: " + txtPhone.Value + System.Environment.NewLine;
            body += "Email: " + txtEmail.Value + System.Environment.NewLine;
            body += "Comments: " + txtComments.Value + System.Environment.NewLine;

            return body;
        }

        private void clearAllFields()
        {
            txtName.Value = "";
            txtPhone.Value = "";
            txtEmail.Value = "";
            txtComments.Value = "";
        }
    }
}