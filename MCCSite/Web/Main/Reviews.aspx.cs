using System;
using System.Collections;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;


namespace Web.Main
{
    public partial class Reviews : System.Web.UI.Page
    {
        private ArrayList testimonials = new ArrayList();

        protected void Page_Load(object sender, EventArgs e)
        {
            Master.ShowAdminAction = true;

            //Populate the repeater
            GetTestimonials();
            this.rptTestimonials.DataSource = testimonials;
            this.rptTestimonials.DataBind();

        }

        public void GetTestimonials()
        {
            //Read reviews into Arraylist 
            string sAppPath = System.AppDomain.CurrentDomain.BaseDirectory;
            try
            {
                using (StreamReader sr = new StreamReader(String.Format("{0}/Files/Testimonials.txt", sAppPath), Encoding.GetEncoding("iso-8859-1")))
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

                            Review t = new Review(count, array[0], array[1], date);
                            testimonials.Add(t);
                            ++count;
                        }
                    }
                }
                //Sort the reviews items by latest date
                testimonials.Sort(new ReviewComparer());
            }
            catch (Exception ex)
            {
                Master.AddErrorMessage("There was a problem fetching the reviews. Please try again later.");
                Console.WriteLine(ex.Message);
            }

        }

        public void rptTestimonials_ItemDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Review card = ((Review)e.Item.DataItem);

                System.Web.UI.HtmlControls.HtmlGenericControl testimonialText = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("testText");
                System.Web.UI.HtmlControls.HtmlGenericControl testimonialName = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("testName");
                System.Web.UI.HtmlControls.HtmlGenericControl testimonialDate = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("testDate");

                testimonialText.InnerText = card.Text;
                testimonialName.InnerText = card.Name;
                testimonialDate.InnerText = card.Date.ToLongDateString();
            }
        }

    }
}