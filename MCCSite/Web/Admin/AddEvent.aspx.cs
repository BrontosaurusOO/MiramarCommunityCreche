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
    public partial class AddEvent : System.Web.UI.Page
    {
        private static ArrayList events = new ArrayList();
        private string eventFile = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RefreshPageItems();
            }
        }

        public void calEventStartDate_SelectionChanged(object sender, EventArgs e)
        {
            DateTime date = calEventStartDate.SelectedDate;
            txtEventStartDate.Value = String.Format("{0:dd/MM/yyyy}", date);
        }
        public void calEventEndDate_SelectionChanged(object sender, EventArgs e)
        {
            DateTime date = calEventEndDate.SelectedDate;
            txtEventEndDate.Value = String.Format("{0:dd/MM/yyyy}", date);
        }
        public void btnEdit_Click(Object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtEventTitle.Value) || string.IsNullOrEmpty(txtEventStartDate.Value))
            {
                Master.AddErrorMessage("Please make sure the two required fields title & start date have been supplied.");
                if (string.IsNullOrEmpty(txtEventTitle.Value))
                    titleControl.Attributes.Add("class"," error");

                if (string.IsNullOrEmpty(txtEventStartDate.Value))
                    dateControl.Attributes.Add("class", " error");

                return;
            }
            else
            {
                EditItemFromForm();
                UpdateEventFileString();
                AddFTPEventItem("edit");
                RefreshPageItems();
            }
        }
        public void btnAdd_Click(Object sender, EventArgs e)
        {
            //Quick validation
            if (string.IsNullOrEmpty(txtEventTitle.Value) || string.IsNullOrEmpty(txtEventStartDate.Value))
            {
                Master.AddErrorMessage("Please make sure the two required fields title & start date have been supplied.");
                if (string.IsNullOrEmpty(txtEventTitle.Value))
                    titleControl.Attributes.Add("class", " error");

                if (string.IsNullOrEmpty(txtEventStartDate.Value))
                    dateControl.Attributes.Add("class", " error");

                return;
            }
            else
            {
                CreateFileEventItemFromPage();
                AddFTPEventItem("add");
                //Re-grab news items to show the new item =D
                RefreshPageItems();
            }
        }

        protected void GetEventItems()
        {
            //Read reviews into Arraylist 
            string sAppPath = System.AppDomain.CurrentDomain.BaseDirectory;
            try
            {
                using (StreamReader sr = new StreamReader(String.Format("{0}/Files/Events.txt", sAppPath), Encoding.GetEncoding("iso-8859-1")))
                {
                    while (sr.Peek() >= 0)
                    {
                        int count = 0;
                        String line = sr.ReadLine();
                        if (!string.IsNullOrEmpty(line))
                        {
                            //Add it to the file string
                            eventFile += line + System.Environment.NewLine;

                            string[] array;
                            array = line.Split('|');

                            //Convert the num of days to an int
                            int days;
                            int.TryParse(array[3], out days);

                            //Convert the file string to Date
                            string[] format = { "dd/MM/yyyy" };
                            DateTime date;
                            DateTime.TryParseExact(array[2], format, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out date);

                            EventItem t = new EventItem(count, array[0], array[1], days, date);
                            events.Add(t);
                            ++count;
                        }
                    }
                }
                events.Sort(new EventComparer());
            }
            catch (Exception ex)
            {
                Master.AddErrorMessage("An error occurred retrieving the events. Please try again soon or contact the crèche for assistance.");
                Console.WriteLine("The file could not be read.");
                Console.WriteLine(ex.Message);
            }

        }

        protected void UpdateEventFileString()
        {
            eventFile = string.Empty;
            int count = 0;
            foreach (Object card in events)
            {
                eventFile += CreateEventLineStringFromEventItem(count, (EventItem)card);
                ++count;
            }
        }

        private void RefreshPageItems()
        {
            //Re-grab news items to show the edited item =D
            events.Clear();
            GetEventItems();
            //Show the top 10 events
            if (events.Count > 10)
                this.rptEvents.DataSource = events.GetRange(0, 10);
            else
                this.rptEvents.DataSource = events;

            this.rptEvents.DataBind();
            ClearForm();
            btnAdd.Visible = true;
            btnSave.Visible = false;
        }

        protected void ClearForm()
        {
            txtEvent.Value = "";
            txtEventTitle.Value = "";
            txtEventStartDate.Value = "";
            txtEventEndDate.Value = "";
        }

        protected void ShowItemInForm(int index, EventItem card)
        {
            txtHiddenId.Value = index.ToString();
            txtEvent.Value = card.Description;
            txtEventTitle.Value = card.Title;
            txtEventStartDate.Value = card.Date.ToString("dd/MM/yyyy");


            if (card.Days > 1)
            {
                DateTime dateEnd;
                dateEnd = card.Date.AddDays((double)card.Days);
                txtEventEndDate.Value = dateEnd.ToString("dd/MM/yyyy");
            }
        }

        protected void EditItemFromForm()
        {
            int id = Convert.ToInt32(txtHiddenId.Value);
            try
            {
                //Grab how many days the event spans
                int days = 1;

                //Convert the file string to Date
                if (!string.IsNullOrEmpty(txtEventEndDate.Value) || !string.IsNullOrEmpty(txtEventStartDate.Value))
                {
                    string[] format = { "dd/MM/yyyy" };
                    DateTime dateStart;
                    DateTime dateEnd;
                    DateTime.TryParseExact(txtEventStartDate.Value.ToString(), format, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out dateStart);

                    if (!string.IsNullOrEmpty(txtEventEndDate.Value))
                    {
                        DateTime.TryParseExact(txtEventEndDate.Value.ToString(), format, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out dateEnd);
                        days = (dateEnd - dateStart).Days;
                    }

                    //Edit the event item by replacing it with this nice new one
                    EventItem card = new EventItem(id, txtEventTitle.Value, txtEvent.Value, days, dateStart);
                    events.RemoveAt(id);
                    events.Insert(id, card);
                }
            }
            catch (Exception ex)
            {
                Master.AddErrorMessage("There was an error adding a new item." + ex);
            }
        }

        protected void CreateFileEventItemFromPage()
        {
            //Make the event into the format to save 
            try
            {
                //Grab how many days the event spans
                int days = 1;

                DateTime dateStart;
                string[] format = { "dd/MM/yyyy" };
                DateTime.TryParseExact(txtEventStartDate.Value.ToString(), format, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out dateStart);

                //Convert the file string to Date
                if (!string.IsNullOrEmpty(txtEventEndDate.Value))
                {
                    DateTime dateEnd;
                    DateTime.TryParseExact(txtEventEndDate.Value.ToString(), format, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out dateEnd);

                    days = (dateEnd - dateStart).Days;
                }
                //Create the new item
                String line = string.Empty;
                line += txtEventTitle.Value + "|";
                line += txtEvent.Value + "|";
                line += dateStart.ToString("dd/MM/yyyy") + "|";
                line += days + "|";
                line += System.Environment.NewLine;

                UpdateEventFileString();

                eventFile += line;
            }
            catch (Exception)
            {
                Master.AddErrorMessage("There was an error adding a new item.");
                return;
            }

        }

        protected string CreateEventLineStringFromEventItem(int id, EventItem card)
        {
            try
            {
                //Create the new item
                String line = string.Empty;
                line += card.Title + "|";
                line += card.Description + "|";
                line += card.Date.ToString("dd/MM/yyyy") + "|";
                line += card.Days.ToString() + "|";
                line += System.Environment.NewLine;

                //Edit the event item by replacing it with this nice new one
                return line;
            }
            catch (Exception ex)
            {
                Master.AddErrorMessage("There was an error adding a new item." + ex);

            }
            return string.Empty;
        }

        protected void AddFTPEventItem(string action)
        {
            string locPath = "/Files/Events.txt";
            string ftpUserName = ConfigurationManager.AppSettings["testFtpUsername"].ToString();
            string ftpPassword = ConfigurationManager.AppSettings["testFtpPassword"].ToString();
            //string ftpUserName = ConfigurationManager.AppSettings["ftpUsername"].ToString();
            //string ftpPassword = ConfigurationManager.AppSettings["ftpPassword"].ToString();
            string fileUrl = string.Format("ftp://{0}@cca.849.myftpupload.com{1}", ftpUserName, locPath);
            try
            {
                //Set up the ftp client
                FtpWebRequest ftpClient = (FtpWebRequest)FtpWebRequest.Create(fileUrl);
                ftpClient.Credentials = new NetworkCredential(ftpUserName, ftpPassword);
                ftpClient.Method = System.Net.WebRequestMethods.Ftp.UploadFile;
                ftpClient.UseBinary = true;
                ftpClient.KeepAlive = true;

                //Read the file we are writing to
                byte[] fileContents = Encoding.GetEncoding("iso-8859-1").GetBytes(eventFile);

                ftpClient.ContentLength = (int)fileContents.Length;
                Stream rStream = ftpClient.GetRequestStream();

                //Write it all back to the file
                rStream.Write(fileContents, 0, fileContents.Length);

                //Clean up
                rStream.Close();

                if (action == "add")
                {
                    Master.AddSuccessMessage("A new event item was successfully created.");
                }
                else if (action == "del")
                {
                    Master.AddSuccessMessage("An event item was successfully deleted.");
                }
                else
                {
                    Master.AddSuccessMessage("An event item was successfully edited.");
                }
            }
            catch (Exception ex)
            {
                Master.AddErrorMessage("There was an error adding a new event item." + ex);
            }

        }

        protected void rptEvents_ItemDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                EventItem card = (EventItem)e.Item.DataItem;

                System.Web.UI.HtmlControls.HtmlGenericControl eventTitle = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("eventTitle");
                System.Web.UI.HtmlControls.HtmlGenericControl eventDescription = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("eventDesc");
                System.Web.UI.HtmlControls.HtmlGenericControl eventDate = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("eventDate");
                System.Web.UI.WebControls.Button eventEditBtn = (System.Web.UI.WebControls.Button)e.Item.FindControl("btnEdit");
                System.Web.UI.WebControls.Button eventDeleteBtn = (System.Web.UI.WebControls.Button)e.Item.FindControl("btnDelete");

                eventTitle.InnerText = card.Title;
                eventDescription.InnerText = card.Description;
                eventDate.InnerText = card.Date.ToLongDateString();

                if (card.Days > 1)
                {
                    eventDate.InnerText += " - " + card.Date.AddDays(card.Days).ToLongDateString();
                }

                eventEditBtn.CommandName = "Edit";
                eventEditBtn.CommandArgument = card.Id.ToString();

                eventDeleteBtn.CommandName = "Delete";
                eventDeleteBtn.CommandArgument = card.Id.ToString();
            }
        }

        protected void rptEvents_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                // Use the value of e.Item.ItemIndex to retrieve the data 
                // item in the control.
                if (!string.IsNullOrEmpty((string)e.CommandArgument))
                {
                    int index = Convert.ToInt32((int)e.Item.ItemIndex);
                    EventItem card = (EventItem)events[index];

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
                    events.RemoveAt(index);
                    UpdateEventFileString();
                    AddFTPEventItem("del");
                    RefreshPageItems();
                }
            }
        }
    }
}