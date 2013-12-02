using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections;
using System.Text;
using System.Configuration;
using System.Net;

namespace MCCSite.Web.Admin
{
    public partial class AddReview : System.Web.UI.Page
    {
        private static ArrayList reviews = new ArrayList();
        private string reviewFile = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
			Master.CheckUser = true;
            if (!IsPostBack)
            {
                RefreshPageItems();
            }
        }

        protected void calDate_SelectionChanged(object sender, EventArgs e)
        {
            DateTime date = calDate.SelectedDate;
            txtDate.Value = String.Format("{0:dd/MM/yyyy}", date);
        }

        public void GetReviews()
        {
            //Read reviews into Arraylist 
            string sAppPath = System.AppDomain.CurrentDomain.BaseDirectory;
            try
            {
                using (StreamReader sr = new StreamReader(String.Format("{0}/Files/Reviews.txt", sAppPath), Encoding.GetEncoding("iso-8859-1")))
                {
                    int count = 0;
                    while (sr.Peek() >= 0)
                    {
                        String line = sr.ReadLine();
                        if (!string.IsNullOrEmpty(line))
                        {
                            //Add it to the file string
                            reviewFile += line + System.Environment.NewLine;

                            string[] array;
                            array = line.Split('|');

                            //Convert the file string to Date
                            string[] format = { "dd/MM/yyyy" };
                            DateTime date;
                            DateTime.TryParseExact(array[2], format, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out date);

                            Review t = new Review(count, array[0], array[1], date);
                            reviews.Add(t);
                            ++count;
                        }
                    }
                }
                //Sort the reviews items by latest date
                reviews.Sort(new ReviewComparer());
            }
            catch (Exception)
            {
                Master.AddErrorMessage("There was a problem fetching the reviews. Please try again later.");
            }

        }

        private void ClearForm()
        {
            txtReview.Value = "";
            txtFrom.Value = "";
            txtDate.Value = "";
        }

        public void btnEdit_Click(Object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtDate.Value))
            {
                Master.AddErrorMessage("Please make sure the two required fields title & start date have been supplied.");
                if (string.IsNullOrEmpty(txtReview.Value))
                    reviewControl.Attributes.Add("class", " error");

                if (string.IsNullOrEmpty(txtFrom.Value))
                    txtFrom.Value = "Anon Parent";

                if (string.IsNullOrEmpty(txtDate.Value))
                    dateControl.Attributes.Add("class", " error");

                return;
            }
            else
            {
                EditItemFromForm();
                UpdateReviewFileString();
                AddFTPReview("edit");
                RefreshPageItems();
            }
        }
        public void btnAdd_Click(Object sender, EventArgs e)
        {
            //Quick validation
            if (string.IsNullOrEmpty(txtReview.Value) || string.IsNullOrEmpty(txtDate.Value))
            {
                Master.AddErrorMessage("Please make sure the two required fields title & start date have been supplied.");
                if (string.IsNullOrEmpty(txtReview.Value))
                    reviewControl.Attributes.Add("class", " error");

                if (string.IsNullOrEmpty(txtFrom.Value))
                    txtFrom.Value = "Anon Parent";

                if (string.IsNullOrEmpty(txtDate.Value))
                    dateControl.Attributes.Add("class", " error");

                return;
            }
            else
            {
                CreateFileReviewFromPage();
                AddFTPReview("add");
                //Re-grab news items to show the new item =D
                RefreshPageItems();
            }
        }

        protected void UpdateReviewFileString()
        {
            reviewFile = string.Empty;
            int count = 0;
            foreach (Object card in reviews)
            {
                reviewFile += CreateReviewLineStringFromReviewItem(count, (Review)card);
                ++count;
            }
        }

        private void RefreshPageItems()
        {
            //Re-grab news items to show the edited item =D
            reviews.Clear();
            GetReviews();
            //Show the top 10 reviews
            if (reviews.Count > 10)
                this.rptReviews.DataSource = reviews.GetRange(0, 20);
            else
                this.rptReviews.DataSource = reviews;

            this.rptReviews.DataBind();
            ClearForm();
            btnAdd.Visible = true;
            btnSave.Visible = false;
        }

        protected void ShowItemInForm(int index, Review card)
        {
            txtHiddenId.Value = index.ToString();
            txtReview.Value = card.Text;
            txtFrom.Value = card.Name;
            txtDate.Value = card.Date.ToString("dd/MM/yyyy");
        }

        protected void EditItemFromForm()
        {
            int id = Convert.ToInt32(txtHiddenId.Value);
            try
            {
                //Convert the file string to Date
                if (!string.IsNullOrEmpty(txtDate.Value))
                {
                    string[] format = { "dd/MM/yyyy" };
                    DateTime date;

                    DateTime.TryParseExact(txtDate.Value.ToString(), format, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out date);

                    //Edit the reviews item by replacing it with this nice new one
                    Review card = new Review(id, txtReview.Value, txtFrom.Value, date);
                    reviews.RemoveAt(id);
                    reviews.Insert(id, card);
                }
            }
            catch (Exception)
            {
                Master.AddErrorMessage("There was an error adding a new item.");
            }
        }

        protected void CreateFileReviewFromPage()
        {
            //Make the reviews into the format to save 
            try
            {
                DateTime date;
                string[] format = { "dd/MM/yyyy" };
                DateTime.TryParseExact(txtDate.Value.ToString(), format, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out date);

                //Convert the file string to Date

                //Create the new item
                String line = string.Empty;
                line += txtReview.Value + "|";
                line += txtFrom.Value + "|";
                line += date.ToString("dd/MM/yyyy") + "|";
                line += System.Environment.NewLine;

                UpdateReviewFileString();

                reviewFile += line;
            }
            catch (Exception)
            {
                Master.AddErrorMessage("There was an error adding a new item.");
                return;
            }

        }

        protected string CreateReviewLineStringFromReviewItem(int id, Review card)
        {
            try
            {
                //Create the new item
                String line = string.Empty;
                line += card.Text + "|";
                line += card.Name + "|";
                line += card.Date.ToString("dd/MM/yyyy") + "|";
                line += System.Environment.NewLine;

                //Edit the reviews item by replacing it with this nice new one
                return line;
            }
            catch (Exception)
            {
                Master.AddErrorMessage("There was an error adding a new item.");

            }
            return string.Empty;
        }

        protected void AddFTPReview(string action)
        {
            string locPath = "/Files/Reviews.txt";
            string ftpUserName = ConfigurationManager.AppSettings["ftpUsername"].ToString();
			string ftpPassword = ConfigurationManager.AppSettings["ftpPassword"].ToString();
			string hostName = ConfigurationManager.AppSettings["hostName"].ToString();
			string fileUrl = string.Format("ftp://{0}:{3}@{1}/webroot{2}", ftpUserName, hostName, locPath, ftpPassword);
            try
            {
                //Set up the ftp client
                FtpWebRequest ftpClient = (FtpWebRequest)FtpWebRequest.Create(fileUrl);
                ftpClient.Credentials = new NetworkCredential(ftpUserName, ftpPassword);
                ftpClient.Method = System.Net.WebRequestMethods.Ftp.UploadFile;
                ftpClient.UseBinary = true;
                ftpClient.KeepAlive = true;

                //Read the file we are writing to
                byte[] fileContents = Encoding.GetEncoding("iso-8859-1").GetBytes(reviewFile);

                ftpClient.ContentLength = (int)fileContents.Length;
                Stream rStream = ftpClient.GetRequestStream();

                //Write it all back to the file
                rStream.Write(fileContents, 0, fileContents.Length);

                //Clean up
                rStream.Close();

                if (action == "add")
                {
                    Master.AddSuccessMessage("A new review was successfully created.");
                }
                else if (action == "del")
                {
                    Master.AddSuccessMessage("A review was successfully deleted.");
                }
                else
                {
                    Master.AddSuccessMessage("A review was successfully edited.");
                }
            }
            catch (Exception)
            {
				Master.AddErrorMessage("There was an error trying to process your request. ");
            }

        }

        protected void rptReviews_ItemDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Review card = (Review)e.Item.DataItem;

                System.Web.UI.HtmlControls.HtmlGenericControl reviewText = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("reviewText");
                System.Web.UI.HtmlControls.HtmlGenericControl reviewFrom = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("reviewFrom");
                System.Web.UI.HtmlControls.HtmlGenericControl reviewDate = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("reviewDate");
                System.Web.UI.WebControls.Button reviewsEditBtn = (System.Web.UI.WebControls.Button)e.Item.FindControl("btnEdit");
                System.Web.UI.WebControls.Button reviewsDeleteBtn = (System.Web.UI.WebControls.Button)e.Item.FindControl("btnDelete");

                reviewText.InnerText = card.Text;
                reviewFrom.InnerText = card.Name;
                reviewDate.InnerText = card.Date.ToLongDateString();

                reviewsEditBtn.CommandName = "Edit";
                reviewsEditBtn.CommandArgument = card.Id.ToString();

                reviewsDeleteBtn.CommandName = "Delete";
                reviewsDeleteBtn.CommandArgument = card.Id.ToString();
            }
        }

        protected void rptReviews_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                // Use the value of e.Item.ItemIndex to retrieve the data 
                // item in the control.
                if (!string.IsNullOrEmpty((string)e.CommandArgument))
                {
                    int index = Convert.ToInt32((int)e.Item.ItemIndex);
                    Review card = (Review)reviews[index];

                    ShowItemInForm(index, card);

                    btnSave.Visible = true;
                    btnAdd.Visible = false;
                }
            }

            if (e.CommandName == "Delete")
            {
                // Use the value of e.Item.ItemIndex to retrieve the data 
                // item in the control.
                if (!string.IsNullOrEmpty((string)e.CommandArgument))
                {
                    int index = Convert.ToInt32((int)e.Item.ItemIndex);
                    reviews.RemoveAt(index);
                    UpdateReviewFileString();
                    AddFTPReview("del");
                    RefreshPageItems();
                }
            }
        }

    }
}
