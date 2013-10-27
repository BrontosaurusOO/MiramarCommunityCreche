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
    public partial class AddReview : System.Web.UI.Page
    {
        private ArrayList testimonials = new ArrayList();
        private string reviewFile = string.Empty;

            protected void Page_Load(object sender, EventArgs e)
            {
                //Populate the repeater
                GetTestimonials();
                this.rptTestimonials.DataSource = testimonials;
                this.rptTestimonials.DataBind();
            }

            protected void calDate_SelectionChanged(object sender, EventArgs e)
            {
                DateTime date = calDate.SelectedDate;
                txtDate.Value = String.Format("{0:dd/MM/yyyy}", date);
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
                            //Add it to the file string
                            reviewFile += line + System.Environment.NewLine;

                            string[] array;
                            array = line.Split('|');

                            //Convert the file string to Date
                            string[] format = { "dd/MM/yyyy" };
                            DateTime date;
                            DateTime.TryParseExact(array[2], format, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out date);

                            Testimonal t = new Testimonal(count, array[0], array[1], date);
                            testimonials.Add(t);
                            ++count;
                        }
                    }
                }
                //Sort the reviews items by latest date
                testimonials.Sort(new TestimonalComparer());
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
                Testimonal card = ((Testimonal)e.Item.DataItem);

                System.Web.UI.HtmlControls.HtmlGenericControl testimonialText = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("testText");
                System.Web.UI.HtmlControls.HtmlGenericControl testimonialName = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("testName");
                System.Web.UI.HtmlControls.HtmlGenericControl testimonialDate = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("testDate");

                testimonialText.InnerText = card.Text;
                testimonialName.InnerText = card.Name;
                testimonialDate.InnerText = card.Date.ToLongDateString();
            }
        }

            public void btnSubmit_Click(Object sender, EventArgs e)
            {
                AddReviewItem();
                testimonials.Clear();
                //Re-grab review items to show the new item =D
                GetTestimonials();
                this.rptTestimonials.DataSource = testimonials;
                this.rptTestimonials.DataBind();
                clearForm();

            }

            private void clearForm()
            {
                txtReview.Value = "";
                txtFrom.Value = "";
                txtDate.Value = "";
            }

            public void AddReviewItem()
            {
                //Read reviews into Arraylist 
                string sAppPath = System.AppDomain.CurrentDomain.BaseDirectory;
                try
                {
                    StreamWriter sw = new StreamWriter(String.Format("{0}/Files/Testimonials.txt", sAppPath), true);

                    //Create the new item
                    String line = string.Empty;
                    line += txtReview.Value + "|";
                    line += txtFrom.Value + "|";
                    line += txtDate.Value.ToString() + "|";
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

        }
    }
