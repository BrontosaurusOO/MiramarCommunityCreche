using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    public void AddErrorMessage(string error)
    {
        Master.AddErrorMessage(error);
    }

    public void AddSuccessMessage(string msg)
    {
        Master.AddSuccessMessage(msg);
    }

    public void EnlargeTree(int girth)
    {
        Master.EnlargeTree(girth);
    }

    public void HideTree()
    {
        Master.HideTree(); ;
    }

    public void AddPageClass(string cssClass)
    {
        Master.AddPageClass(cssClass);
    }

    public void AddTreeClass(string cssClass)
    {
        Master.AddTreeClass(cssClass);
    }

    public string CurrentUserName
    {
        get
        {
            return Master.UserName;
        }
        set
        {
            Master.UserName = value;
        }

    }

    public bool HideSideBar
    {
        get
        {
            return Master.HideSideBar;
        }
        set
        {
            Master.HideSideBar = value;
        }

    }

    public bool ShowAdminAction
    {
        get
        {
            return Master.ShowAdminAction;
        }
        set
        {
            Master.ShowAdminAction = value;
        }

    }
}