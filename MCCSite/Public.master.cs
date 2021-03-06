﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MCCSite {
	public partial class Public : System.Web.UI.MasterPage {

		private bool _hideSideBar = false;
		private bool _showAdminAction = false;
		private bool _showLogin = false;
		private static string _user = null;

		protected void Page_Load (object sender, EventArgs e)
        {
            //Signin stuff - set the value on the page with the user
            currentUser.Value = _user;  //the hidden value on the page so the javascript tells persona if user is logged in
            if (_user != null)
            {
                signout.Visible = true;
            }
           else
            {
                signin.Visible = true;
            }
			if (!IsPostBack)
				ClearPageMessages();
        }

		protected void Page_PreRender (object sender, EventArgs e) {
			if (_hideSideBar)
			{
				sideBar.Visible = false;
				pageBody.Attributes.Add("class", String.Join(" ", pageBody.Attributes["class"].Split(' ').Except(new string[] { "", "span10" })));       //.Concat(new string[]{"offset1"}).ToArray()) to add a class add this on the end 
			}

			if (_showAdminAction )	{
				adminPanel.Visible = true;
			}

			if (_showLogin)
				loginPanel.Visible = true;
		}

		public void AddErrorMessage (string error) {
			messageBar.Visible = true;
			msgText.InnerText = error;
			msgText.Attributes.Add("class", "alert-error");
		}

		public void AddSuccessMessage (string msg) {
			messageBar.Visible = true;
			msgText.InnerText = msg;
			msgText.Attributes.Add("class", "alert-success");
		}

		public void ClearPageMessages () {
			msgText.InnerText = string.Empty;
			messageBar.Visible = false;
		}

		public void EnlargeTree (int girth) {
			tree.Width = girth;
		}

		public void HideTree () {
			tree.Visible = false;
		}

		public void AddPageClass (string cssClass) {
			pageBody.Attributes.Add("class", cssClass);
		}

		public void AddTreeClass (string cssClass) {
			tree.Attributes.Add("class", cssClass);
		}

		public string UserName {
			get {
				return _user;
			}
			set {
				_user = value;
			}
		}

		public bool HideSideBar {
			get {
				return _hideSideBar;
			}
			set {
				_hideSideBar = value;
			}
		}

		public bool ShowAdminAction {
			get {
				return _showAdminAction;
			}
			set {
				_showAdminAction = value;
			}
		}

		public bool ShowLoginAction {
			get {
				return _showLogin;
			}
			set {
				_showLogin = value;
			}
		}
	}
}