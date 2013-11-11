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
using System.Web.UI.HtmlControls;

namespace MCCSite.Web.Admin
{
    public partial class AddPhotos : System.Web.UI.Page
    {
        private static ArrayList photos = new ArrayList();
        private static ArrayList folderPhotos = new ArrayList();
        private string photoFile = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["f"]))
            {
                ddlFolder.Value = ddlSelectedFolder.Value = Request.QueryString["f"];
            }

            Form.Enctype = "multipart/form-data";

            if (!IsPostBack)
            {
                RefreshPageItems();
            }
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

                            PhotoItem t = new PhotoItem(count, array[0], array[1], array[2], array[3], array[4], date);
                            photos.Add(t);
                            ++count;
                        }
                    }
                }
                photos.Sort(new PhotoItemComparer());
                foreach (PhotoItem p in photos)
                {
                    if (p.Folder.Equals(ddlFolder.Value))
                    {
                        folderPhotos.Add(p);
                    }
                }
            }
            catch (Exception ex)
            {
                // Master.AddErrorMessage("An error occurred retrieving the photos. Please try again soon or contact the crèche for assistance.");
                Console.WriteLine("The file could not be read.");
                Console.WriteLine(ex.Message);
            }

        }

        private void ClearForm()
        {
            ddlFolder.SelectedIndex = 0;
            txtPhotoName.Value = "";
            txtCaption.Value = "";
            txtPhotoDate.Value = "";
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

                photoEditBtn.CommandName = "Edit";
                photoEditBtn.CommandArgument = card.Id.ToString();

                photoDeleteBtn.CommandName = "Delete";
                photoDeleteBtn.CommandArgument = card.Id.ToString();

                ++count;
            }
        }

        protected void calPhotoDate_SelectionChanged(object sender, EventArgs e)
        {
            DateTime date = calPhotoDate.SelectedDate;
            txtPhotoDate.Value = String.Format("{0:dd/MM/yyyy}", date);
        }

        public void btnEdit_Click(Object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtPhotoName.Value) || string.IsNullOrEmpty(txtPhotoDate.Value))
            {
                Master.AddErrorMessage("Please make sure the two required fields title & date have been supplied.");
                if (string.IsNullOrEmpty(txtPhotoName.Value))
                    titleControl.Attributes.Add("class", " error");

                if (string.IsNullOrEmpty(txtPhotoDate.Value))
                    dateControl.Attributes.Add("class", " error");

                return;
            }
            else
            {
                EditItemFromForm();
                UpdatePhotoFileString();
                AddFTPPhotoItem("edit");
                RefreshPageItems();
            }
        }
        public void btnAdd_Click(Object sender, EventArgs e)
        {
            //Quick validation
            string fname = string.Empty;
            if (string.IsNullOrEmpty(txtPhotoName.Value) || string.IsNullOrEmpty(txtPhotoDate.Value))
            {
                Master.AddErrorMessage("Please make sure the two required fields title & start date have been supplied.");
                if (string.IsNullOrEmpty(txtPhotoName.Value))
                    titleControl.Attributes.Add("class", " has-error");

                if (string.IsNullOrEmpty(txtPhotoDate.Value))
                    dateControl.Attributes.Add("class", " has-error");

                return;
            }
            if ((photoUploadFile.PostedFile != null) && (photoUploadFile.PostedFile.ContentLength > 0))
            {
                String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };
                String fileExtension = System.IO.Path.GetExtension(photoUploadFile.PostedFile.FileName).ToLower();
                bool fileOK = false;
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i])
                    {
                        fileOK = true;
                    }
                }
                if (!fileOK)
                {
                    Master.AddErrorMessage("This photo is not in the correct format. Please make sure it is (ends with) any of the following formats: .gif, .png, .jpeg, .jpg ");
                    photoUploadControl.Attributes.Add("class", " has-error");
                    return;
                }
            }
            else
            {
                Master.AddErrorMessage("Please select a file to upload.");
            }

            CreateFilePhotoItemFromPage();
            AddFTPPhotoItem("add");
            AddFTPPhoto(photoUploadFile);
            //Re-grab photo items to show the new item =D
            RefreshPageItems();

        }

        protected void UpdatePhotoFileString()
        {
            photoFile = string.Empty;
            int count = 0;
            foreach (Object card in photos)
            {
                photoFile += CreatePhotoLineStringFromPhotoItem(count, (PhotoItem)card);
                ++count;
            }
        }

        private void RefreshPageItems()
        {
            //Re-grab photo items to show the edited item =D
            photos.Clear();
            folderPhotos.Clear();
            GetPhotos();
            this.rptPhotos.DataSource = folderPhotos;
            this.rptPhotos.DataBind();
            ClearForm();
            btnAdd.Visible = true;
            btnSave.Visible = false;
        }

        protected void ShowItemInForm(int index, PhotoItem card)
        {
            txtHiddenId.Value = index.ToString();
            txtPhotoName.Value = card.Name;
            txtCaption.Value = card.Caption;
            txtPhotoDate.Value = card.Date.ToString("dd/MM/yyyy");
        }

        protected void EditItemFromForm()
        {
            int id = Convert.ToInt32(txtHiddenId.Value);
            try
            {
                //Convert the file string to Date
                if (!string.IsNullOrEmpty(txtPhotoDate.Value))
                {
                    string[] format = { "dd/MM/yyyy" };
                    DateTime date;
                    DateTime.TryParseExact(txtPhotoDate.Value.ToString(), format, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out date);

                    //Edit the photo item by replacing it with this nice new one
                    PhotoItem card = new PhotoItem(id, ddlFolder.Value, txtPhotoName.Value, txtCaption.Value, date);
                    PhotoItem p = (PhotoItem)folderPhotos[id];
                    photos.Remove(p);
                    photos.Insert(0, card);
                }
            }
            catch (Exception ex)
            {
                Master.AddErrorMessage("There was an error adding a new item." + ex);
            }
        }

        protected void CreateFilePhotoItemFromPage()
        {
            //Make the photo into the format to save 
            try
            {
                DateTime date;
                string[] format = { "dd/MM/yyyy" };
                DateTime.TryParseExact(txtPhotoDate.Value.ToString(), format, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out date);

                //Create the new item
                String line = string.Empty;
                line += ddlFolder.Value + "|";
                line += txtPhotoName.Value + "|";
                line += txtCaption.Value + "|";
                line += "|";
                line += "|";
                line += txtPhotoDate.Value.ToString() + "|";
                line += System.Environment.NewLine;

                UpdatePhotoFileString();

                photoFile += line;
            }
            catch (Exception)
            {
                Master.AddErrorMessage("There was an error adding a new photo item.");
                return;
            }

        }

        protected string CreatePhotoLineStringFromPhotoItem(int id, PhotoItem card)
        {
            try
            {
                //Create the new item
                String line = string.Empty;
                line += card.Folder + "|";
                line += card.Name + "|";
                line += card.Caption + "|";
                line += card.Height + "|";
                line += card.Width + "|";
                line += card.Date.ToString() + "|";
                line += System.Environment.NewLine;

                //Edit the photo item by replacing it with this nice new one
                return line;
            }
            catch (Exception ex)
            {
                Master.AddErrorMessage("There was an error adding a new item." + ex);

            }
            return string.Empty;
        }

        protected void AddFTPPhotoItem(string action)
        {
            string locPath = "/Files/Photos.txt";
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
                byte[] fileContents = Encoding.GetEncoding("iso-8859-1").GetBytes(photoFile);

                ftpClient.ContentLength = (int)fileContents.Length;
                Stream rStream = ftpClient.GetRequestStream();

                //Write it all back to the file
                rStream.Write(fileContents, 0, fileContents.Length);

                //Clean up
                rStream.Close();

                if (action == "add")
                {
                    Master.AddSuccessMessage("A new photo item was successfully created.");
                }
                else if (action == "del")
                {
                    Master.AddSuccessMessage("A photo item was successfully deleted.");
                }
                else
                {
                    Master.AddSuccessMessage("A photo item was successfully edited.");
                }
            }
            catch (Exception ex)
            {
                Master.AddErrorMessage("There was an error adding a new photo item." + ex);
            }

        }

        protected void AddFTPPhoto(HtmlInputFile photo)
        {
            string basePath = "Images/Gallery";
            string ftpUserName = ConfigurationManager.AppSettings["testFtpUsername"].ToString();
            string ftpPassword = ConfigurationManager.AppSettings["testFtpPassword"].ToString();
            //string ftpUserName = ConfigurationManager.AppSettings["ftpUsername"].ToString();
            //string ftpPassword = ConfigurationManager.AppSettings["ftpPassword"].ToString();
            string fileUrl = string.Format("ftp://{0}@cca.849.myftpupload.com/{1}/{2}/{3}", ftpUserName, basePath, ddlFolder.Value, photo.PostedFile.FileName);
            try
            {
                //Set up the ftp client
                FtpWebRequest ftpClient = (FtpWebRequest)FtpWebRequest.Create(fileUrl);
                ftpClient.Credentials = new NetworkCredential(ftpUserName, ftpPassword);
                ftpClient.Method = System.Net.WebRequestMethods.Ftp.UploadFile;
                ftpClient.UseBinary = true;
                ftpClient.KeepAlive = true;

                byte[] image = new byte[photo.PostedFile.ContentLength];

                Stream pStream;
                pStream = photo.PostedFile.InputStream;
                pStream.Read(image, 0, photo.PostedFile.ContentLength);

                ftpClient.ContentLength = (int)photo.PostedFile.ContentLength;
                Stream rStream = ftpClient.GetRequestStream();

                //Write it all back to the file
                rStream.Write(image, 0, image.Length);

                //Clean up
                rStream.Close();
                Master.AddSuccessMessage("A photo was successfully uploaded.");

            }
            catch (Exception ex)
            {
                Master.AddErrorMessage("There was an error uploading a new photo" + ex);
            }

        }

        protected void rptPhotos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                // Use the value of e.Item.ItemIndex to retrieve the data 
                // item in the control.
                if (!string.IsNullOrEmpty((string)e.CommandArgument))
                {
                    int index = Convert.ToInt32((int)e.Item.ItemIndex);
                    PhotoItem card = (PhotoItem)folderPhotos[index];

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
                    photos.Remove((PhotoItem)folderPhotos[index]);
                    UpdatePhotoFileString();
                    AddFTPPhotoItem("del");
                    DeleteFTPPhoto(ddlFolder.Value, (PhotoItem)folderPhotos[index]);
                    RefreshPageItems();
                }
            }
        }

        private void DeleteFTPPhoto(string folder, PhotoItem p)
        {
            string basePath = "Images/Gallery";
            string ftpUserName = ConfigurationManager.AppSettings["testFtpUsername"].ToString();
            string ftpPassword = ConfigurationManager.AppSettings["testFtpPassword"].ToString();
            //string ftpUserName = ConfigurationManager.AppSettings["ftpUsername"].ToString();
            //string ftpPassword = ConfigurationManager.AppSettings["ftpPassword"].ToString();
            string fileUrl = string.Format("ftp://{0}@cca.849.myftpupload.com/{1}/{2}/{3}", ftpUserName, basePath, folder, p.Name);
            try
            {
                //Set up the ftp client
                FtpWebRequest ftpClient = (FtpWebRequest)FtpWebRequest.Create(fileUrl);
                ftpClient.Credentials = new NetworkCredential(ftpUserName, ftpPassword);
                ftpClient.Method = System.Net.WebRequestMethods.Ftp.DeleteFile;

                //Clean up

                Master.AddSuccessMessage("A photo was successfully deleted.");

            }
            catch (Exception ex)
            {
                Master.AddErrorMessage("There was an error deleting a photo");
            }
        }
    }
}