using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Text;
using JsonFx.Json;
using System.Web.Security;
using System.Collections.Specialized;

namespace auth
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string assertion = string.Empty;

            if (!String.IsNullOrEmpty(Request.QueryString["assert"]))
            {
                assertion = Request.QueryString["assert"];
            }

            using (var web = new WebClient())
            {
                // Build the data we're going to POST.
                var data = new NameValueCollection();
                data["assertion"] = assertion;
                //data["audience"] = "http://localhost:1696/"; // Use your web site's URL here.   
                data["audience"] = "http://bronwyntestsite.info/mccsite/"; // Use your web site's URL here.   

                // POST the data to the Persona provider (in this case Mozilla)
                var response = web.UploadValues("https://verifier.login.persona.org/verify", "POST", data);
                var buffer = Encoding.Convert(Encoding.GetEncoding("iso-8859-1"), Encoding.UTF8, response);

                // Convert the response to JSON.
                var tempString = Encoding.UTF8.GetString(buffer, 0, response.Length);
                var reader = new JsonReader();
                dynamic output = reader.Read(tempString);
                if (output.status == "okay")
                {
                    string email = output.email; // Since this is dynamic, convert it to string.
                    FormsAuthentication.SetAuthCookie(email, true);
                    Response.Redirect("/mccsite/default.aspx?user=" + email);
                }
                else
                {
                    Response.Redirect("/mccsite/auth.logout.aspx");
                }

                // Example JSON response.
                /*{"status":"okay","email":"johndoe@smith.com","audience":"http://localhost:1696/","expires":1349141963794,"issuer":"login.persona.org"}*/
            }
        }
    }
}