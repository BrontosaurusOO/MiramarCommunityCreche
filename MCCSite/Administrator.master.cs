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
		private bool _userNeedsPermission = false;
		private bool _userCanAccessPage = false;

        protected void Page_Load(object sender, EventArgs e)
        {
			Master.ShowLoginAction = true;
				if (Master.UserName != "miramar.creche@xtra.co.nz" && Master.UserName != "bronwyn.hopkin@hotmail.com")
				{
					if (CheckUser)
						Response.Redirect("/default.aspx?badAdmin=1");
					else
						_userCanAccessPage = false;
				}else{
					_userCanAccessPage = true;
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

		public bool CheckUser {
			get {
				return _userNeedsPermission;
			}
			set {
				_userNeedsPermission = value;
			}
		}

		public bool UserHasPermission {
			get {
				return _userCanAccessPage;
			}
			set {
				_userCanAccessPage = value;
			}
		}
    }
}