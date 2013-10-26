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

namespace MCCSite.Web.Admin
{
    public partial class AddEvent : System.Web.UI.Page
    {
        private ArrayList events = new ArrayList();

        protected void Page_Load(object sender, EventArgs e)
        {
            GetEventItems();
            this.rptEvents.DataSource = events;
            this.rptEvents.DataBind();
        }

        protected void calEventStartDate_SelectionChanged(object sender, EventArgs e)
        {
            DateTime date = calEventStartDate.SelectedDate;
            txtEventStartDate.Value = String.Format("{0:dd/MM/yyyy}", date);
        }
        protected void calEventEndDate_SelectionChanged(object sender, EventArgs e)
        {
            DateTime date = calEventEndDate.SelectedDate;
            txtEventEndDate.Value = String.Format("{0:dd/MM/yyyy}", date);
        }

        public void GetEventItems()
        {
            //Read reviews into Arraylist 
            string sAppPath = System.AppDomain.CurrentDomain.BaseDirectory;
            try
            {
                using (StreamReader sr = new StreamReader(String.Format("{0}/Files/Events.txt", sAppPath), Encoding.GetEncoding("iso-8859-1")))
                {
                    while (sr.Peek() >= 0)
                    {
                        String line = sr.ReadLine();
                        if (!string.IsNullOrEmpty(line))
                        {
                            string[] array;
                            array = line.Split('|');

                            //Convert the num of days to an int
                            int days;
                            int.TryParse(array[3], out days);

                            //Convert the file string to Date
                            string[] format = { "dd/MM/yyyy" };
                            DateTime date;
                            DateTime.TryParseExact(array[2], format, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out date);

                            EventItem t = new EventItem(array[0], array[1], days, date);
                            events.Add(t);
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

        public void btnSubmit_Click(Object sender, EventArgs e)
        {
            AddFTPEventItem();
            events.Clear();
            //Re-grab news items to show the new item =D
            GetEventItems();
            this.rptEvents.DataSource = events;
            this.rptEvents.DataBind();
            clearForm();

        }

        private void clearForm()
        {
            txtEvent.Value = "";
            txtEventTitle.Value = "";
            txtEventStartDate.Value = "";
            txtEventEndDate.Value = "";
        }

        public void AddEventItem()
        {
            //Read reviews into Arraylist 
            string sAppPath = System.AppDomain.CurrentDomain.BaseDirectory;
            try
            {
                StreamWriter sw = new StreamWriter(String.Format("{0}/Files/Events.txt", sAppPath), true);

                //Grab how many days the event spans
                int days = 1;

                //Convert the file string to Date
                if (!string.IsNullOrEmpty(txtEventEndDate.Value))
                {
                    string[] format = { "dd/MM/yyyy" };
                    DateTime dateStart;
                    DateTime dateEnd;
                    DateTime.TryParseExact(txtEventStartDate.Value.ToString(), format, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out dateStart);
                    DateTime.TryParseExact(txtEventEndDate.Value.ToString(), format, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out dateEnd);

                    days = (dateEnd - dateStart).Days;
                }
                //Create the new item
                String line = string.Empty;
                line += txtEventTitle.Value + "|";
                line += txtEvent.Value + "|";
                line += txtEventStartDate.Value.ToString() + "|";
                line += days + "|";
                line += "\r";

                //Add it
                sw.WriteLine(line);

                //Clean up 
                sw.Close();
            }
            catch (Exception ex)
            {
                Master.AddErrorMessage("There was an error adding a new item." + ex);
                Console.WriteLine("The file could not be read:");
                Console.WriteLine(ex.Message);
            }

        }
        //        FtpWebRequest ftpClient = (FtpWebRequest)FtpWebRequest.Create(ftpurl + "" + username + "_" + filename);
        //ftpClient.Credentials = new System.Net.NetworkCredential(ftpusername, ftppassword);
        //ftpClient.Method = System.Net.WebRequestMethods.Ftp.UploadFile;
        //ftpClient.UseBinary = true;
        //ftpClient.KeepAlive = true;
        //System.IO.FileInfo fi = new System.IO.FileInfo(fileurl);
        //ftpClient.ContentLength = fi.Length;
        //byte[] buffer = new byte[4097];
        //int bytes = 0;
        //int total_bytes = (int)fi.Length;
        //System.IO.FileStream fs = fi.OpenRead();
        //System.IO.Stream rs = ftpClient.GetRequestStream();
        //while (total_bytes > 0)
        //{
        //   bytes = fs.Read(buffer, 0, buffer.Length);
        //   rs.Write(buffer, 0, bytes);
        //   total_bytes = total_bytes - bytes;
        //}
        ////fs.Flush();
        //fs.Close();
        //rs.Close();
        //FtpWebResponse uploadResponse = (FtpWebResponse)ftpClient.GetResponse();
        //value = uploadResponse.StatusDescription;
        //uploadResponse.Close();

        public void AddFTPEventItem()
        {
            string locPath = "/Files/Events.txt";
            string fname = "Events.txt";
            string ftpUserName = "bronwynh";
            string ftpPassword = "Crazykids123!";
            string fileUrl = string.Format("ftp://{0}@cca.849.myftpupload.com{1}", ftpUserName, locPath);
            //ftp://bronwynh@cca.849.myftpupload.com/Files/Events.txt
            try
            {
                FtpWebRequest ftpClient = (FtpWebRequest)FtpWebRequest.Create(fileUrl);
                ftpClient.Credentials = new NetworkCredential(ftpUserName, ftpPassword);
                ftpClient.Method = System.Net.WebRequestMethods.Ftp.UploadFile;
                ftpClient.UseBinary = true;
                ftpClient.KeepAlive = true;
                FileInfo fi = new FileInfo(fname);
                ftpClient.ContentLength = fi.Length;

                FileStream stream = fi.OpenRead();
                Stream rStream = ftpClient.GetRequestStream();

                //Grab how many days the event spans
                int days = 1;

                //Convert the file string to Date
                if (!string.IsNullOrEmpty(txtEventEndDate.Value))
                {
                    string[] format = { "dd/MM/yyyy" };
                    DateTime dateStart;
                    DateTime dateEnd;
                    DateTime.TryParseExact(txtEventStartDate.Value.ToString(), format, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out dateStart);
                    DateTime.TryParseExact(txtEventEndDate.Value.ToString(), format, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out dateEnd);

                    days = (dateEnd - dateStart).Days;
                }
                //Create the new item
                string line = string.Empty;
                line += txtEventTitle.Value + "|";
                line += txtEvent.Value + "|";
                line += txtEventStartDate.Value.ToString() + "|";
                line += days + "|";
                line += "\r";

                byte[] eventLine = Encoding.GetEncoding("iso-8859-1").GetBytes(line + "|");

                int bytes = stream.Read(eventLine, 0, eventLine.Length);
                rStream.Write(eventLine, 0, bytes);

                rStream.Close();
                stream.Close();

            }
            catch (Exception ex)
            {
                Master.AddErrorMessage("There was an error adding a new item." + ex);
            }

        }

        public void rptEvents_ItemDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                EventItem card = (EventItem)e.Item.DataItem;

                System.Web.UI.HtmlControls.HtmlGenericControl eventTitle = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("eventTitle");
                System.Web.UI.HtmlControls.HtmlGenericControl eventDescription = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("eventDesc");
                System.Web.UI.HtmlControls.HtmlGenericControl eventDate = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("eventDate");

                eventTitle.InnerText = card.Title;
                eventDescription.InnerText = card.Description;
                eventDate.InnerText = card.Date.ToLongDateString();

                if (card.Days > 1)
                {
                    eventDate.InnerText += " - " + card.Date.AddDays(card.Days).ToLongDateString();
                }
            }
        }
    }
}