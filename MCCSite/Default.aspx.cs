using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.HideSideBar = true;
            Master.ShowAdminAction = true;
            Master.AddTreeClass("transparent-tree");

            if (!string.IsNullOrEmpty(Request.QueryString["badAdmin"]))
            {
                Master.AddErrorMessage("Only users with permission can access admin.");
            }
        }
    }

