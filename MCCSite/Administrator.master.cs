using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MCCSite
{
    public partial class Administrator : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Master.UserName != "miramar.creche@xtra.co.nz" && Master.UserName != "bronwyn.hopkin@hotmail.com")
            {
                //Response.Redirect("/default.aspx?badAdmin=1");
            }
        }

        public void AddErrorMessage(string error)
        {
            Master.AddErrorMessage(error);
        }

        public void AddSuccessMessage(string msg)
        {
            Master.AddSuccessMessage(msg);
        }
    }
}