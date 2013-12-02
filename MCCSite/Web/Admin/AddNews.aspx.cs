using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections;
using System.Text;
using System.Net;
using System.Configuration;

namespace MCCSite.Web.Admin
{
    public partial class AddNews : System.Web.UI.Page
    {
        private static ArrayList news = new ArrayList();
        private string newsFile = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
			Master.CheckUser = true;
            if (!IsPostBack)
            {
                RefreshPageItems();
            }
        }

        protected void calNewsDate_SelectionChanged(object sender, EventArgs e)
        {
            DateTime date = calNewsDate.SelectedDate;
            txtNewsDate.Value = String.Format("{0:dd/MM/yyyy}", date);
        }

        public void GetNewsItems()
        {
            //Read reviews into Arraylist 
            string sAppPath = System.AppDomain.CurrentDomain.BaseDirectory;
            try
            {
                using (StreamReader sr = new StreamReader(String.Format("{0}/Files/News.txt", sAppPath), Encoding.GetEncoding("iso-8859-1")))
                {
                    int count = 0;
                    while (sr.Peek() >= 0)
                    {
                        String line = sr.ReadLine();
                        if (!string.IsNullOrEmpty(line))
                        {
                            //Add it to the file string
                            newsFile += line + System.Environment.NewLine;

                            string[] array;
                            array = line.Split('|');

                            //Convert the file string to Date
                            string[] format = { "dd/MM/yyyy" };
                            DateTime date;
                            DateTime.TryParseExact(array[2], format, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out date);

                            NewsItem t = new NewsItem(count, array[0], array[1], date);
                            news.Add(t);
                            ++count;
                        }
                    }
                }
                //Sort the news items by latest date
                news.Sort(new NewsComparer());
            }
            catch (Exception)
            {

            }

        }

        private void ClearForm()
        {
            txtNews.Value = "";
            txtNewsTitle.Value = "";
            txtNewsDate.Value = "";
        }

        public void btnEdit_Click(Object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtNewsTitle.Value) || string.IsNullOrEmpty(txtNewsDate.Value))
            {
                Master.AddErrorMessage("Please make sure the two required fields title & date have been supplied.");
                if (string.IsNullOrEmpty(txtNewsTitle.Value))
                    titleControl.Attributes.Add("class", " error");

                if (string.IsNullOrEmpty(txtNewsDate.Value))
                    dateControl.Attributes.Add("class", " error");

                return;
            }
            else
            {
                EditItemFromForm();
                UpdateNewsFileString();
                AddFTPNewsItem("edit");
                RefreshPageItems();
            }
        }
        public void btnAdd_Click(Object sender, EventArgs e)
        {
            //Quick validation
            if (string.IsNullOrEmpty(txtNewsTitle.Value) || string.IsNullOrEmpty(txtNewsDate.Value))
            {
                Master.AddErrorMessage("Please make sure the two required fields title & start date have been supplied.");
                if (string.IsNullOrEmpty(txtNewsTitle.Value))
                    titleControl.Attributes.Add("class", " error");

                if (string.IsNullOrEmpty(txtNewsDate.Value))
                    dateControl.Attributes.Add("class", " error");

                return;
            }
            else
            {
                CreateFileNewsItemFromPage();
                AddFTPNewsItem("add");
                //Re-grab news items to show the new item =D
                RefreshPageItems();
            }
        }

        protected void UpdateNewsFileString()
        {
            newsFile = string.Empty;
            int count = 0;
            foreach (Object card in news)
            {
                newsFile += CreateNewsLineStringFromNewsItem(count, (NewsItem)card);
                ++count;
            }
        }

        private void RefreshPageItems()
        {
            //Re-grab news items to show the edited item =D
            news.Clear();
            GetNewsItems();
            //Show the top 10 News
            if (news.Count > 10)
                this.rptNews.DataSource = news.GetRange(0, 10);
            else
                this.rptNews.DataSource = news;

            this.rptNews.DataBind();
            ClearForm();
            btnAdd.Visible = true;
            btnSave.Visible = false;
        }

        protected void ShowItemInForm(int index, NewsItem card)
        {
            txtHiddenId.Value = index.ToString();
            txtNews.Value = card.Description;
            txtNewsTitle.Value = card.Title;
            txtNewsDate.Value = card.Date.ToString("dd/MM/yyyy");
        }

        protected void EditItemFromForm()
        {
            int id = Convert.ToInt32(txtHiddenId.Value);
            try
            {
                //Convert the file string to Date
                if (!string.IsNullOrEmpty(txtNewsDate.Value))
                {
                    string[] format = { "dd/MM/yyyy" };
                    DateTime date;
                    DateTime.TryParseExact(txtNewsDate.Value.ToString(), format, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out date);

                    //Edit the News item by replacing it with this nice new one
                    NewsItem card = new NewsItem(id, txtNewsTitle.Value, txtNews.Value, date);
                    news.RemoveAt(id);
                    news.Insert(id, card);
                }
            }
            catch (Exception)
            {
                Master.AddErrorMessage("There was an error adding a new item.");
            }
        }

        protected void CreateFileNewsItemFromPage()
        {
            //Make the News into the format to save 
            try
            {
                DateTime date;
                string[] format = { "dd/MM/yyyy" };
                DateTime.TryParseExact(txtNewsDate.Value.ToString(), format, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out date);

                //Create the new item
                String line = string.Empty;
                line += txtNewsTitle.Value + "|";
                line += txtNews.Value + "|";
                line += date.ToString("dd/MM/yyyy") + "|";
                line += System.Environment.NewLine;

                UpdateNewsFileString();

                newsFile += line;
            }
            catch (Exception)
            {
                Master.AddErrorMessage("There was an error adding a new item.");
                return;
            }

        }

        protected string CreateNewsLineStringFromNewsItem(int id, NewsItem card)
        {
            try
            {
                //Create the new item
                String line = string.Empty;
                line += card.Title + "|";
                line += card.Description + "|";
                line += card.Date.ToString("dd/MM/yyyy") + "|";
                line += System.Environment.NewLine;

                //Edit the News item by replacing it with this nice new one
                return line;
            }
            catch (Exception)
            {
				Master.AddErrorMessage("There was an error trying to process your request. ");

            }
            return string.Empty;
        }

        protected void AddFTPNewsItem(string action)
        {
            string locPath = "/Files/News.txt";
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
                byte[] fileContents = Encoding.GetEncoding("iso-8859-1").GetBytes(newsFile);

                ftpClient.ContentLength = (int)fileContents.Length;
                Stream rStream = ftpClient.GetRequestStream();

                //Write it all back to the file
                rStream.Write(fileContents, 0, fileContents.Length);

                //Clean up
                rStream.Close();

                if (action == "add")
                {
                    Master.AddSuccessMessage("A new News item was successfully created.");
                }
                else if (action == "del")
                {
                    Master.AddSuccessMessage("A News item was successfully deleted.");
                }
                else
                {
                    Master.AddSuccessMessage("A News item was successfully edited.");
                }
            }
            catch (Exception)
            {
                Master.AddErrorMessage("There was an error adding a new News item.");
            }

        }

        protected void rptNews_ItemDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                NewsItem card = (NewsItem)e.Item.DataItem;

                System.Web.UI.HtmlControls.HtmlGenericControl newsTitle = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("newsTitle");
                System.Web.UI.HtmlControls.HtmlGenericControl newsDescription = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("newsDesc");
                System.Web.UI.HtmlControls.HtmlGenericControl newsDate = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("newsDate");
                System.Web.UI.WebControls.Button NewsEditBtn = (System.Web.UI.WebControls.Button)e.Item.FindControl("btnEdit");
                System.Web.UI.WebControls.Button NewsDeleteBtn = (System.Web.UI.WebControls.Button)e.Item.FindControl("btnDelete");

                newsTitle.InnerText = card.Title;
                newsDescription.InnerText = card.Description;
                newsDate.InnerText = card.Date.ToLongDateString();

                NewsEditBtn.CommandName = "Edit";
                NewsEditBtn.CommandArgument = card.Id.ToString();

                NewsDeleteBtn.CommandName = "Delete";
                NewsDeleteBtn.CommandArgument = card.Id.ToString();
            }
        }

        protected void rptNews_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                // Use the value of e.Item.ItemIndex to retrieve the data 
                // item in the control.
                if (!string.IsNullOrEmpty((string)e.CommandArgument))
                {
                    int index = Convert.ToInt32((int)e.Item.ItemIndex);
                    NewsItem card = (NewsItem)news[index];

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
                    news.RemoveAt(index);
                    UpdateNewsFileString();
                    AddFTPNewsItem("del");
                    RefreshPageItems();
                }
            }
        }
    }
}