using System;
using System.Collections;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Web.Side
{
    public partial class Events : System.Web.UI.Page
    {
        private ArrayList news = new ArrayList();
        private ArrayList events = new ArrayList();

        protected void Page_Load(object sender, EventArgs e)
        {

            Master.ShowAdminAction = true;

            //Populate the repeaters
            GetNewsItems();
            
            //Show the top 10 events
            if (news.Count > 10)
                this.rptNews.DataSource = news.GetRange(0, 10);
            else
                this.rptNews.DataSource = news;
            
            this.rptNews.DataBind();

            GetEventItems();
            //Show the top 10 events
            if (events.Count > 10)
                this.rptEvents.DataSource = events.GetRange(0, 10);
            else
                this.rptEvents.DataSource = events;
            
            this.rptEvents.DataBind();

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
                Master.AddErrorMessage("An error occurred retrieving the news. Please try again soon or contact the crèche for assistance.");
            }

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
                        int count = 0;
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

                            EventItem t = new EventItem(count, array[0], array[1], days, date);
                            events.Add(t);
                            ++count;
                        }
                    }
                }
                events.Sort(new EventComparer());
            }
            catch (Exception)
            {
                Master.AddErrorMessage("An error occurred retrieving the events. Please try again soon or contact the crèche for assistance.");
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

        public void rptNews_ItemDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                NewsItem card = ((NewsItem)e.Item.DataItem);

                System.Web.UI.HtmlControls.HtmlGenericControl newsTitle = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("newsTitle");
                System.Web.UI.HtmlControls.HtmlGenericControl newsDescription = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("newsDesc");
                System.Web.UI.HtmlControls.HtmlGenericControl newsDate = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("newsDate");

                newsTitle.InnerText = card.Title;
                newsDescription.InnerText = card.Description;
                newsDate.InnerText = card.Date.ToLongDateString();
            }
        }
    }
}