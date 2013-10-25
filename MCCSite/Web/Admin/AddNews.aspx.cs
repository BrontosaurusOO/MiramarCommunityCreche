using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections;
using System.Text;

namespace MCCSite.Web.Admin
{
    public partial class AddNews : System.Web.UI.Page
    {
        private ArrayList news = new ArrayList();

        protected void Page_Load(object sender, EventArgs e)
        {
            GetNewsItems();
            this.rptNews.DataSource = news;
            this.rptNews.DataBind();
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

                            News t = new News(array[0], array[1], date);
                            news.Add(t);
                        }
                    }
                }
                //Sort the news items by latest date
                news.Sort(new NewsComparer());
            }
            catch (Exception ex)
            {
                Console.WriteLine("The file could not be read:");
                Console.WriteLine(ex.Message);
            }

        }

        public void btnSubmit_Click(Object sender, EventArgs e)
        {
            AddNewsItem();
            news.Clear();
            //Re-grab news items to show the new item =D
            GetNewsItems();
            this.rptNews.DataSource = news;
            this.rptNews.DataBind();
            clearForm();

        }

        private void clearForm()
        {
            txtNews.Value = "";
            txtNewsTitle.Value = "";
            txtNewsDate.Value = "";
        }

        public void AddNewsItem()
        {
            //Read reviews into Arraylist 
            string sAppPath = System.AppDomain.CurrentDomain.BaseDirectory;
            try
            {
                StreamWriter sw = new StreamWriter(String.Format("{0}/Files/News.txt", sAppPath),true);

                //Create the new item
                    String line = string.Empty;
                    line += txtNewsTitle.Value + "|";
                    line += txtNews.Value + "|";
                    line += txtNewsDate.Value.ToString() + "|";
                    line += "\r";

                //Add it
                sw.WriteLine(line);

                //Clean up 
                sw.Close();
            }
            catch (Exception ex)
            {
                Master.AddErrorMessage("There was an Error adding a new item.");
                Console.WriteLine("The file could not be read:");
                Console.WriteLine(ex.Message);
            }

        }
        public void rptNews_ItemDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                News card = ((News)e.Item.DataItem);

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