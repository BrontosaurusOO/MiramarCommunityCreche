using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.IO;
using System.Text;

namespace Web.Gallery
{
    public partial class EventPhotos : System.Web.UI.Page
    {
        private static ArrayList photos = new ArrayList();

        protected void Page_Load(object sender, EventArgs e)
        {
            GetPhotos();
            this.rptPhotos.DataSource = photos;
            this.rptPhotos.DataBind();

        }

        public void GetPhotos()
        {
            //Read reviews into Arraylist 
            string sAppPath = System.AppDomain.CurrentDomain.BaseDirectory;
            try
            {
                using (StreamReader sr = new StreamReader(String.Format("{0}/Files/Photos.txt", sAppPath), Encoding.GetEncoding("iso-8859-1")))
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
                            DateTime.TryParseExact(array[5], format, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out date);

                            PhotoItem t = new PhotoItem(count, array[0], array[1], array[2], array[3], array[4], date);
                            if (t.Folder.Equals("Events"))
                            {
                                photos.Add(t);
                            }
                            ++count;
                        }
                    }
                }
                photos.Sort(new PhotoItemComparer());
            }
            catch (Exception ex)
            {
                Master.AddErrorMessage("An error occurred retrieving the photos. Please try again soon or contact the crèche for assistance.");
            }

        }

        int count = 0;
        public void rptPhotos_ItemDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                PhotoItem card = (PhotoItem)e.Item.DataItem;

                System.Web.UI.HtmlControls.HtmlImage photo = (System.Web.UI.HtmlControls.HtmlImage)e.Item.FindControl("image");
                System.Web.UI.HtmlControls.HtmlGenericControl photoCaption = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("caption");
                System.Web.UI.HtmlControls.HtmlGenericControl holder = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("itemHolder");
                System.Web.UI.WebControls.Button photoEditBtn = (System.Web.UI.WebControls.Button)e.Item.FindControl("btnEdit");
                System.Web.UI.WebControls.Button photoDeleteBtn = (System.Web.UI.WebControls.Button)e.Item.FindControl("btnDelete");

                photo.Src = String.Format("/Images/gallery/{0}/{1}", card.Folder.ToLower(), card.Name);
                photoCaption.InnerText = card.Caption;

                //if this is the first photo set it to active
                string activeClass = (count < 1 ? " active" : " ");
                holder.Attributes["class"] += activeClass;
                indicators.InnerHtml += String.Format(@"<li data-target=""#myCarousel"" data-slide-to=""{0}"" class=""{1}""></li>", count.ToString(), activeClass);

                ++count;
            }
        }
    }
}