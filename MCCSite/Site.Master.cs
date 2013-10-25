using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        public bool HideSideBar = false;
        public bool ShowAdminAction = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                signout.Visible = true;
            }
            else
            {
                signin.Visible = true;
            }
            //signin.Visible = true;
            //signout.Visible = true;

        }
           
        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (HideSideBar)
            {
                sideBar.Visible = false;
                pageBody.Attributes.Add("class", String.Join(" ", pageBody.Attributes["class"].Split(' ').Except(new string[]{"","span10"})));       //.Concat(new string[]{"offset1"}).ToArray()) to add a class add this on the end 
            }

            if (ShowAdminAction && (
                 CurrentUserName == "miramar.creche@xtra.co.nz" ||
                 CurrentUserName == "bronwyn.hopkin@hotmail.com")
                 )
            {
                adminPanel.Visible = true;
            }
        }

        public void AddErrorMessage(string error) 
        {
            messageBar.Visible = true;
            msgText.InnerText = error;
            msgText.Attributes.Add("class", "alert-error");
        }

        public void AddSuccessMessage(string msg)
        {
            messageBar.Visible = true;
            msgText.InnerText = msg;
            msgText.Attributes.Add("class", "alert-success");
        }

         public void EnlargeTree(int girth)
        {
            tree.Width = girth;
        }

         public void HideTree()
         {
             tree.Visible = false;
         }

         public void AddPageClass(string cssClass)
         {
             pageBody.Attributes.Add("class", cssClass);
         }

         public void AddTreeClass(string cssClass)
         {
             tree.Attributes.Add("class", cssClass);
         }

         public string CurrentUserName
         {
             get
             {
                 string userName = "null";

                 if (HttpContext.Current.Request.IsAuthenticated)
                 {
                     userName = HttpContext.Current.User.Identity.Name.Split('|')[0];
                 }

                 return userName;
             }
         }
    }