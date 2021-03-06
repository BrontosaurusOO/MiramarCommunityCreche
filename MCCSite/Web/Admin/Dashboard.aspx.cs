﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MCCSite.Web.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			Master.CheckUser = false;
        }

		protected void Page_PreRender (object sender, EventArgs e) {
			dashboardContent.Visible = false;
			loggedOutContent.Visible = false;

			if (Master.UserHasPermission)
				dashboardContent.Visible = true;
			else
				loggedOutContent.Visible = true;
		}
    }
}