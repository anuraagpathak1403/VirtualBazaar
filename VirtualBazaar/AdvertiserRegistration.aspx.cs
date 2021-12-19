using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WMPLib;

namespace VirtualBazaar
{
    public partial class AdvertiserRegistration1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    BindGrid();
                }
            }
            catch (Exception ex)
            {
                string title = "Message from System";
                string msg = "<p>Unable to load page correctly, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }

        public void BindGrid()
        {
            BazaarModelContainer DB = new BazaarModelContainer();

            try
            {
                var Advertiser = (from Adv in DB.AdvertiserRegisterations
                                  join catg in DB.AdvertiserCategories on Adv.Category equals catg.CategoryID
                                  join Vid in DB.AdvertiserVideos on Adv.AdvertiserID equals Vid.AdvertiserID
                                  select new
                                  {
                                      AdvertiserID = Adv.AdvertiserID,
                                      VideoID = Vid.VideoID,
                                      Name = Adv.OrganisationName,
                                      Category = catg.Category,
                                      EmailID = Adv.EmailID,
                                      MobileNo = Adv.MobileNo,
                                      Website = Adv.Website
                                  }).ToList();

                if (Advertiser != null)
                {
                    grdvAdvertisers.DataSource = Advertiser;
                    grdvAdvertisers.DataBind();
                }
            }
            catch (Exception)
            {
                string title = "Message from System";
                string msg = "<p>Unable to bind data into grid, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }

        public void BindAdvertiserCategory()
        {
            try
            {
                BazaarModelContainer Db = new BazaarModelContainer();

                var Catg = from Cat in Db.AdvertiserCategories
                           select Cat;

                List<AdvertiserCategory> oList = Catg.ToList();

                if (Catg != null)
                {
                    ddlCategory.DataSource = oList;
                    ddlCategory.DataTextField = "Category";
                    ddlCategory.DataValueField = "CategoryID";
                    ddlCategory.DataBind();
                }

                ddlCategory.Items.Insert(0, new ListItem("Select", "0"));
            }
            catch (Exception)
            {
                string title = "Message from System";
                string msg = "<p>Unable to bind advertiser category, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }

        public void BindState()
        {
            try
            {
                BazaarModelContainer Db = new BazaarModelContainer();

                var StatesList = from state in Db.States
                                 select state;

                List<State> oList = StatesList.ToList();

                if (oList != null)
                {
                    ddlState.DataSource = oList;
                    ddlState.DataTextField = "StateName";
                    ddlState.DataValueField = "StateID";
                    ddlState.DataBind();
                }

                ddlState.Items.Insert(0, new ListItem("Select", "0"));
            }
            catch (Exception ex)
            {
                string title = "Message from System";
                string msg = "<p>Unable to bind state, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }

        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlState.SelectedIndex > 0)
                {
                    BazaarModelContainer Db = new BazaarModelContainer();

                    int StateID = Convert.ToInt32(ddlState.SelectedValue);

                    var CityList = from city in Db.Cities
                                   where city.StateID == StateID
                                   select city;

                    List<City> oList = CityList.ToList();

                    ddlCity.Items.Clear();

                    if (oList != null)
                    {
                        ddlCity.DataSource = oList;
                        ddlCity.DataTextField = "CityName";
                        ddlCity.DataValueField = "CityID";
                        ddlCity.DataBind();
                    }
                    ddlCity.Items.Insert(0, new ListItem("Select", "0"));
                }
                else
                {
                    ddlCity.Items.Clear();
                    ddlCity.Items.Insert(0, new ListItem("Select", "0"));
                }
            }
            catch (Exception ex)
            {
                string title = "Message from System";
                string msg = "<p>Unable to bind city, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }

        protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlCity.SelectedIndex > 0)
                {
                    BazaarModelContainer Db = new BazaarModelContainer();

                    int CityID = Convert.ToInt32(ddlCity.SelectedValue);

                    var LocalityList = from locality in Db.Localities
                                       where locality.CityID == CityID
                                       select locality;

                    List<Locality> oList = LocalityList.ToList();

                    ddlLocality.Items.Clear();

                    if (oList != null)
                    {
                        ddlLocality.DataSource = oList;
                        ddlLocality.DataTextField = "LocalityName";
                        ddlLocality.DataValueField = "LocalityID";
                        ddlLocality.DataBind();
                    }

                    ddlLocality.Items.Insert(0, new ListItem("Select", "0"));
                }
                else
                {
                    ddlLocality.Items.Clear();
                    ddlLocality.Items.Insert(0, new ListItem("Select", "0"));
                }
            }
            catch (Exception ex)
            {
                string title = "Message from System";
                string msg = "<p>Unable to bind locality, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (btnSave.Text == "Save")
                {
                    try
                    {
                        if (Page.IsValid)
                        {
                            if (FileVideo.HasFile)
                            {
                                string Dir = "~/Videos/";

                                if (FileImage.HasFile)
                                {
                                    FileImage.SaveAs(Server.MapPath(Dir + FileImage.PostedFile.FileName));
                                }

                                //if (!Directory.Exists(Dir))
                                //{
                                //    Directory.CreateDirectory(Dir);
                                //}

                                string FilePath = Server.MapPath(Dir + FileVideo.PostedFile.FileName);

                                int ExtensionResult = CheckExtension(FilePath);

                                if (ExtensionResult > 0)
                                {
                                    if (FileVideo.PostedFile.ContentLength <= 104857600)
                                    {
                                        FileVideo.SaveAs(Server.MapPath(Dir + FileVideo.PostedFile.FileName));

                                        var player = new WindowsMediaPlayer();
                                        var clip = player.newMedia(FilePath);
                                        TimeSpan VideoDuration = TimeSpan.FromSeconds(clip.duration);

                                        if (VideoDuration.Minutes >= 0 && VideoDuration.Minutes <= 3)
                                        {
                                            AdvertiserRegisteration obj = new AdvertiserRegisteration();

                                            string Address = ddlLocality.SelectedItem.Text + ", " + ddlCity.SelectedItem.Text + ", " + ddlState.SelectedItem.Text;

                                            string url = "http://maps.google.com/maps/api/geocode/xml?address=" + Address + "&sensor=false";
                                            WebRequest request = WebRequest.Create(url);

                                            using (WebResponse response = (HttpWebResponse)request.GetResponse())
                                            {
                                                using (StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8))
                                                {
                                                    DataSet dsResult = new DataSet();
                                                    dsResult.ReadXml(reader);
                                                   
                                                    foreach (DataRow row in dsResult.Tables["result"].Rows)
                                                    {
                                                        string geometry_id = dsResult.Tables["geometry"].Select("result_id = " + row["result_id"].ToString())[0]["geometry_id"].ToString();
                                                        DataRow location = dsResult.Tables["location"].Select("geometry_id = " + geometry_id)[0];

                                                        hdnLatitude.Value = location["lat"].ToString();
                                                        hdnLongitude.Value = location["lng"].ToString();
                                                    }
                                                }
                                            }

                                            obj.OrganisationName = txtOrganisationName.Text;
                                            obj.Category = Convert.ToInt32(ddlCategory.SelectedValue);
                                            obj.Street = txtStreetName.Text;
                                            obj.Landmark = txtLandmark.Text;
                                            obj.LocalityID = Convert.ToInt32(ddlLocality.SelectedValue);
                                            obj.CityID = Convert.ToInt32(ddlCity.SelectedValue);
                                            obj.StateID = Convert.ToInt32(ddlState.SelectedValue);
                                            obj.Country = "India";
                                            obj.EmailID = txtEmailID.Text;
                                            obj.MobileNo = txtMobileNo.Text;
                                            obj.Website = txtWebsite.Text;
                                            obj.Description = txtDescription.Text;
                                            obj.RegisterDate = DateTime.Now;
                                            obj.Image = "Videos/" + FileImage.PostedFile.FileName;
                                            obj.Scheme = txtPlan.Text;
                                            obj.Keyword = txtKeyword.Text;
                                            obj.Latitude = hdnLatitude.Value;
                                            obj.Longitude = hdnLongitude.Value;
                                            obj.ApprovalStatus = 1;

                                            if (txtPlan.Text == "Silver")
                                            {
                                                obj.ViewsAllowed = 100;
                                            }
                                            else if (txtPlan.Text == "Gold")
                                            {
                                                obj.ViewsAllowed = 250;
                                            }
                                            else if (txtPlan.Text == "Diamond")
                                            {
                                                obj.ViewsAllowed = 500;
                                            }
                                            else if (txtPlan.Text == "Platinum")
                                            {
                                                obj.ViewsAllowed = 1000;
                                            }

                                            obj.CustomerName = txtName.Text;
                                            obj.CustomerMobileNum = txtCMobieNum.Text;
                                            obj.CustomerEmailID = txtCEmailID.Text;

                                            BazaarModelContainer db = new BazaarModelContainer();
                                            db.AdvertiserRegisterations.Add(obj);
                                            db.SaveChanges();

                                            int ID = obj.AdvertiserID;

                                            if (ID > 0)
                                            {
                                                try
                                                {
                                                    AdvertiserVideo oVideo = new AdvertiserVideo();

                                                    oVideo.AdvertiserID = ID;
                                                    oVideo.Title = FileVideo.PostedFile.FileName;
                                                    oVideo.Extension = Path.GetExtension(FilePath);
                                                    oVideo.ContentType = FileVideo.PostedFile.ContentType;
                                                    oVideo.Video = "Videos/" + FileVideo.PostedFile.FileName;
                                                    oVideo.Duration = VideoDuration;
                                                    oVideo.ApprovalStatus = 1;
                                                    oVideo.ActiveStatus = 0;
                                                    oVideo.CreatedBy = "Admin";
                                                    oVideo.CreatedDate = DateTime.Now;

                                                    db.AdvertiserVideos.Add(oVideo);
                                                    db.SaveChanges();

                                                    int VideoStatus = SaveVideoImageForApproval(ID, 1, "Videos/" + FileVideo.PostedFile.FileName);

                                                    if (FileImage.HasFile)
                                                    {
                                                        int ImageStatus = SaveVideoImageForApproval(ID, 2, "Videos/" + FileImage.PostedFile.FileName);
                                                    }

                                                    int UserResult = CreateUser();

                                                    if (UserResult > 0)
                                                    {
                                                        string title = "Message from System";
                                                        string msg = "<p>Advertiser has been registered successfully. User for advertiser has been also created.</p>";
                                                        string Url = "AdvertiserRegistration.aspx";
                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');function Redirect(){window.location='" + Url + "';}setTimeout('Redirect()', 4000);", true);
                                                        return;
                                                    }
                                                    else
                                                    {
                                                        string title = "Message from System";
                                                        string msg = "<p>Advertiser has been registered successfully, but unable to create User for advertiser. You can create user from user management page.</p>";
                                                        string Url = "AdvertiserRegistration.aspx";
                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');function Redirect(){window.location='" + Url + "';}setTimeout('Redirect()', 4000);", true);
                                                        return;
                                                    }
                                                }
                                                catch (Exception ex)
                                                {
                                                    string title = "Message from System";
                                                    string msg = "<p>Advertiser has been registered successfully but unable to upload video.</p>";
                                                    string Url = "AdvertiserRegistration.aspx";
                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');function Redirect(){window.location='" + Url + "';}setTimeout('Redirect()', 4000);", true);
                                                    return;
                                                }
                                            }
                                        }
                                        else
                                        {
                                            string title = "Message from System";
                                            string msg = "<p>Video duration must be greater than 1 minutes and less than 3 minutes. Please upload a valid file.</p>";
                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                                            return;
                                        }
                                    }
                                    else
                                    {
                                        string title = "Message from System";
                                        string msg = "<p>Invalid video file. File size must be less than 100 MB.</p>";
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                                        return;
                                    }
                                }
                                else
                                {
                                    string title = "Message from System";
                                    string msg = "<p>Invalid video file. Please upload only .mp4 file or .avi file. </p>";
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                                    return;
                                }
                            }
                            else
                            {
                                string title = "Message from System";
                                string msg = "<p>Please select video to upload.</p>";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                                return;
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        string exception = ex.InnerException.ToString();

                        string title = "Message from System";
                        string msg = "<p>Something went wrong while saving data, Please try later.</p>";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                        return;
                    }
                }
                else
                {
                    try
                    {
                        if (Page.IsValid)
                        {
                            BazaarModelContainer Db = new BazaarModelContainer();
                            int AdvertiserID = Convert.ToInt32(hdnAdvertiserID.Value);

                            AdvertiserRegisteration obj = Db.AdvertiserRegisterations.SingleOrDefault(x => x.AdvertiserID == AdvertiserID);

                            obj.OrganisationName = txtOrganisationName.Text;
                            obj.Category = Convert.ToInt32(ddlCategory.SelectedValue);
                            obj.Street = txtStreetName.Text;
                            obj.Landmark = txtLandmark.Text;
                            obj.LocalityID = Convert.ToInt32(ddlLocality.SelectedValue);
                            obj.CityID = Convert.ToInt32(ddlCity.SelectedValue);
                            obj.StateID = Convert.ToInt32(ddlState.SelectedValue);
                            obj.Country = "India";
                            obj.EmailID = txtEmailID.Text;
                            obj.MobileNo = txtMobileNo.Text;
                            obj.Website = txtWebsite.Text;
                            obj.Description = txtDescription.Text;
                            obj.RegisterDate = DateTime.Now;
                            obj.Keyword = txtKeyword.Text;
                            obj.CustomerName = txtName.Text;
                            obj.CustomerMobileNum = txtCMobieNum.Text;
                            obj.CustomerEmailID = txtCEmailID.Text;

                            Db.SaveChanges();

                            string title = "Message from System";
                            string msg = "<p>Advertiser details has been updated successfully.</p>";
                            string Url = "AdvertiserRegistration.aspx";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');function Redirect(){window.location='" + Url + "';}setTimeout('Redirect()', 4000);", true);
                            return;
                        }
                    }
                    catch (Exception)
                    {
                        string title = "Message from System";
                        string msg = "<p>Something went wrong while updating data, Please try later.</p>";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                        return;
                    }
                }
            }
            catch (Exception)
            {
                string title = "Message from System";
                string msg = "<p>Something went wrong while saving data, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdvertiserRegistration.aspx", false);
        }

        protected void lnkbtnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton Edit = (sender) as LinkButton;
                GridViewRow row = (GridViewRow)Edit.NamingContainer;

                HiddenField hdnAdvertiserID = (HiddenField)row.FindControl("hdnAdvertiserID");

                int AdvertiserID = Convert.ToInt32(hdnAdvertiserID.Value);

                BazaarModelContainer Db = new BazaarModelContainer();
                var Advertiser = from Adv in Db.AdvertiserRegisterations
                                 where Adv.AdvertiserID == AdvertiserID
                                 select Adv;

                List<AdvertiserRegisteration> oList = Advertiser.ToList();

                hdnAdvertiserID.Value = oList[0].AdvertiserID.ToString();
                txtOrganisationName.Text = oList[0].OrganisationName;
                ddlCategory.SelectedValue = oList[0].Category.ToString();
                txtEmailID.Text = oList[0].EmailID;
                txtMobileNo.Text = oList[0].MobileNo;

                txtName.Text = oList[0].CustomerName;
                txtCEmailID.Text = oList[0].CustomerEmailID;
                txtCMobieNum.Text = oList[0].CustomerMobileNum;

                BindState();

                ddlState.SelectedValue = oList[0].StateID.ToString();
                ddlState_SelectedIndexChanged(null, null);

                ddlCity.SelectedValue = oList[0].CityID.ToString();
                ddlCity_SelectedIndexChanged(null, null);

                ddlLocality.SelectedValue = oList[0].LocalityID.ToString();

                txtPlan.Text = oList[0].Scheme;
                txtLandmark.Text = oList[0].Landmark;
                txtStreetName.Text = oList[0].Street;
                txtWebsite.Text = oList[0].Website;
                txtDescription.Text = oList[0].Description;
                txtKeyword.Text = oList[0].Description;

                DivGrid.Visible = false;
                DivEntry.Visible = true;
                DivVideo.Visible = false;
                btnSave.Text = "Update";
            }
            catch (Exception)
            {
                string title = "Message from System";
                string msg = "<p>Unable to edit Advertiser details, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }

        protected void lnkbtnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton Delete = (sender) as LinkButton;
                GridViewRow row = (GridViewRow)Delete.NamingContainer;

                HiddenField hdnAdvertiserID = (HiddenField)row.FindControl("hdnAdvertiserID");
                HiddenField hdnVideoID = (HiddenField)row.FindControl("hdnVideoID");

                int AdvertiserID = Convert.ToInt32(hdnAdvertiserID.Value);
                int VideoID = Convert.ToInt32(hdnVideoID.Value);

                BazaarModelContainer Db = new BazaarModelContainer();

                AdvertiserVideo oVideo = new AdvertiserVideo() { VideoID = VideoID };

                Db.AdvertiserVideos.Attach(oVideo);
                Db.AdvertiserVideos.Remove(oVideo);
                Db.SaveChanges();

                AdvertiserRegisteration obj = new AdvertiserRegisteration() { AdvertiserID = AdvertiserID };

                Db.AdvertiserRegisterations.Attach(obj);
                Db.AdvertiserRegisterations.Remove(obj);
                Db.SaveChanges();

                string title = "Message from System";
                string msg = "<p>Advertiser has been deleted successfully.</p>";
                string Url = "AdvertiserRegistration.aspx";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');function Redirect(){window.location='" + Url + "';}setTimeout('Redirect()', 4000);", true);
                return;
            }
            catch (Exception)
            {
                string title = "Message from System";
                string msg = "<p>Unable to delete Advertiser details, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }

        protected void grdvAdvertisers_PreRender(object sender, EventArgs e)
        {
            if (grdvAdvertisers.Rows.Count > 0)
            {
                grdvAdvertisers.UseAccessibleHeader = false;
                grdvAdvertisers.HeaderRow.TableSection = TableRowSection.TableHeader;
                grdvAdvertisers.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }

        protected void btnAdvertiserRegistration_Click(object sender, EventArgs e)
        {
            try
            {
                DivEntry.Visible = false;
                DivGrid.Visible = false;
                DivPlans.Visible = true;

                BindAdvertiserCategory();
                BindState();

                ddlCity.Items.Insert(0, new ListItem("Select", "0"));
                ddlLocality.Items.Insert(0, new ListItem("Select", "0"));
            }
            catch (Exception)
            {
                string title = "Message from System";
                string msg = "<p>Unable to bind data in lists, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }

        public int CreateUser()
        {
            try
            {
                UserInfo obj = new UserInfo();

                obj.Name = txtOrganisationName.Text;
                obj.UserName = txtEmailID.Text;
                obj.MobileNo = txtMobileNo.Text;
                obj.MailID = txtEmailID.Text;
                obj.Password = EncodeString("123456");
                obj.AadharNo = "";
                obj.RoleID = 2;
                obj.Address = string.Empty;
                obj.CreatedDate = DateTime.Now;
                obj.AdvertiserID = 0;
                BazaarModelContainer Db = new BazaarModelContainer();
                Db.UserInfoes.Add(obj);

                return 1;
            }
            catch (Exception ex)
            {
                string title = "Message from System";
                string msg = "<p>Unable to create user, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return -1;
            }
        }

        public string EncodeString(string sData)
        {
            try
            {
                byte[] encData_byte = new byte[sData.Length];

                encData_byte = System.Text.Encoding.UTF8.GetBytes(sData);
                string encodedData = Convert.ToBase64String(encData_byte);

                return encodedData;

            }
            catch (Exception ex)
            {
                throw new Exception("Error in Encryption" + ex.Message);
            }
        }

        public int CheckExtension(string FilePath)
        {
            try
            {
                int result = 0;
                string Extension = Path.GetExtension(FilePath);

                if (Extension.ToLower() == ".mp4" || Extension.ToLower() == ".avi")
                {
                    result = 1;
                }
                else
                {
                    result = 0;
                }

                return result;
            }
            catch (Exception ex)
            {
                string title = "Message from System";
                string msg = "<p>Unable to create user, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return -1;
            }
        }

        protected void btnBuySilver_Click(object sender, EventArgs e)
        {
            DivEntry.Visible = true;
            DivGrid.Visible = false;
            DivPlans.Visible = false;
            SchemeDiv.Visible = true;
            txtPlan.Text = "Silver";
        }

        protected void btnBuyGold_Click(object sender, EventArgs e)
        {
            DivEntry.Visible = true;
            DivGrid.Visible = false;
            DivPlans.Visible = false;
            SchemeDiv.Visible = true;
            txtPlan.Text = "Gold";
        }

        protected void btnBuyDiamond_Click(object sender, EventArgs e)
        {
            DivEntry.Visible = true;
            DivGrid.Visible = false;
            DivPlans.Visible = false;
            SchemeDiv.Visible = true;
            txtPlan.Text = "Diamond";
        }

        public int SaveVideoImageForApproval(int AdvertiserID, int FileType, string Path)
        {
            try
            {
                BazaarModelContainer db = new BazaarModelContainer();

                VideosApproval Vapprovaal = new VideosApproval();
                Vapprovaal.AdvertiserID = AdvertiserID;
                Vapprovaal.ApprovalStatus = 1;
                Vapprovaal.FileType = FileType;
                Vapprovaal.FileName = Path;
                Vapprovaal.SubmitDate = DateTime.Now; ;
                db.VideosApprovals.Add(Vapprovaal);
                db.SaveChanges();

                return 1;
            }
            catch (Exception)
            {
                string title = "Message from System";
                string msg = "<p>Unable to submit Advertiser details for verification, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return -1;
            }
        }
    }
}