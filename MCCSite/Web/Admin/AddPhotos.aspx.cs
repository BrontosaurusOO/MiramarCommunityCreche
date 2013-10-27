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
    public partial class AddPhotos : System.Web.UI.Page
    {
        private ArrayList photos = new ArrayList();
        private string photoFile = string.Empty;

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
                            //Add it to the file string
                            photoFile += line + System.Environment.NewLine;

                            string[] array;
                            array = line.Split('|');
                       
                            //Convert the file string to Date
                            string[] format = { "dd/MM/yyyy" };
                            DateTime date;
                            DateTime.TryParseExact(array[5], format, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out date);

                            Photo t = new Photo(count, array[0], array[1], array[2], array[3], array[4], date);
                            photos.Add(t);
                            ++count;
                        }
                    }
                }
                photos.Sort(new PhotoComparer());
            }
            catch (Exception ex)
            {
                // Master.AddErrorMessage("An error occurred retrieving the photos. Please try again soon or contact the crèche for assistance.");
                Console.WriteLine("The file could not be read.");
                Console.WriteLine(ex.Message);
            }

        }

        public void btnSubmit_Click(Object sender, EventArgs e)
        {
            AddPhoto();
            photos.Clear();
            //Re-grab photos to show the new item =D
            GetPhotos();
            this.rptPhotos.DataSource = photos;
            this.rptPhotos.DataBind();
            clearForm();

        }

        private void clearForm()
        {
            ddlFolder.SelectedIndex = 0;
            txtPhotoName.Value = "";
            txtCaption.Value = "";
            txtPhotoDate.Value = "";
        }

        public void AddPhoto()
        {
            //Read reviews into Arraylist 
            string sAppPath = System.AppDomain.CurrentDomain.BaseDirectory;
            try
            {
                StreamWriter sw = new StreamWriter(String.Format("{0}/Files/Events.txt", sAppPath), true);

                //Convert the file string to Date
                if (!string.IsNullOrEmpty(txtPhotoDate.Value))
                {
                    string[] format = { "dd/MM/yyyy" };
                    DateTime date;
                    DateTime.TryParseExact(txtPhotoDate.Value.ToString(), format, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out date);
                }

                //Create the new item
                String line = string.Empty;
                line += ddlFolder.Value + "|";
                line += txtPhotoName.Value + "|";
                line += txtCaption.Value + "|";
                line += "|";
                line += "|";
                line += txtPhotoDate.Value.ToString() + "|";
                line += "\r";

                //Add it
                sw.WriteLine(line);

                //Clean up 
                sw.Close();
            }
            catch (Exception ex)
            {
                Master.AddErrorMessage("There was an Error adding a new photo.");
                Console.WriteLine("The file could not be read:");
                Console.WriteLine(ex.Message);
            }

        }

        int count = 0;
        public void rptPhotos_ItemDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Photo card = (Photo)e.Item.DataItem;

                if (card.Folder.Equals(ddlSelectedFolder.Value))
                {
                    System.Web.UI.HtmlControls.HtmlImage photo = (System.Web.UI.HtmlControls.HtmlImage)e.Item.FindControl("image");
                    System.Web.UI.HtmlControls.HtmlGenericControl photoCaption = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("caption");
                    System.Web.UI.HtmlControls.HtmlGenericControl holder = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("itemHolder");

                    photo.Src = String.Format("/Images/gallery/{0}/{1}", card.Folder.ToLower(), card.Name);
                    photoCaption.InnerText = card.Caption;

                    //if this is the first photo set it to active
                    string activeClass = (count < 1 ? " active" : " ");
                    holder.Attributes["class"] += activeClass;
                    indicators.InnerHtml += String.Format(@"<li data-target=""#myCarousel"" data-slide-to=""{0}"" class=""{1}""></li>", count.ToString(), activeClass);
                }
            }
        }

        protected void calPhotoDate_SelectionChanged(object sender, EventArgs e)
        {
            DateTime date = calPhotoDate.SelectedDate;
            txtPhotoDate.Value = String.Format("{0:dd/MM/yyyy}", date);
        }

        protected void ddlFolderSelected_SelectionChanged(object sender, EventArgs e)
        {
            //Re-bind and display the correct data
            this.rptPhotos.DataBind();
        }
    }
}