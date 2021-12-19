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
using System.Net.Mail;


namespace VirtualBazaar.LoginMaster
{
    public partial class LoginMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindState();
                BindAdvertiserCategory();

                ddlCity.Items.Insert(0, new ListItem("Select", "0"));
                ddlLocality.Items.Insert(0, new ListItem("Select", "0"));
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            UserInfo obj = new UserInfo();
            obj.UserName = txtUserName.Text;
            obj.Password = txtPassword.Text;
            var pass = EncodeString(obj.Password);
            BazaarModelContainer Db = new BazaarModelContainer();
            var UserName = from emp in Db.UserInfoes
                           where emp.UserName == obj.UserName
                           && emp.Password == pass
                           select emp;

            List<UserInfo> oList = UserName.ToList();

            if (oList.Count > 0)
            {
                Session["UserID"] = oList[0].UserID;
                Session["LoginName"] = oList[0].UserName;
                Session["Advertiser"] = oList[0].AdvertiserID;

                if (oList[0].AdvertiserID > 0)
                {
                    Response.Redirect("~/AdminHome.aspx", false);
                }
                else
                {
                    Response.Redirect("~/UserProfile.aspx", false);
                }
            }
            else
            {
                // message him/her your username or password is wrong
                string title = "Message from System";
                string msg = "<p>Username or Password is wrong</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
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

        public string DecodeString(string sData)
        {
            try
            {
                System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();

                System.Text.Decoder utf8Decode = encoder.GetDecoder();

                byte[] todecode_byte = Convert.FromBase64String(sData);

                int charCount = utf8Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);

                char[] decoded_char = new char[charCount];

                utf8Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);

                string result = new String(decoded_char);

                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error in Decryption : " + ex.Message);
                //InsertException("DecodeString", "CommonDAL", ex.Message);
            }
        }

        protected void btnUser_Click(object sender, EventArgs e)
        {
            SchemeDiv.Visible = false;
            DivEntry.Visible = false;
            DivPlans.Visible = false;
            UserAccount.Visible = true;
            CreateAccount.Visible = false;
        }

        protected void btnAdvertiser_Click(object sender, EventArgs e)
        {
            DivPlans.Visible = true;
            CreateAccount.Visible = false;
            SchemeDiv.Visible = false;
            DivEntry.Visible = false;
            UserAccount.Visible = false;
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

                                        if (VideoDuration.Minutes >= 0 && VideoDuration.Minutes <= 10)
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
                                            obj.Category = 1;
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

                                            if (rbdYes.Checked == true)
                                            {
                                                obj.MobileStatus = 0;
                                            }
                                            else
                                            {
                                                obj.MobileStatus = 1;
                                            }

                                            obj.CustomerName = txtName.Text;
                                            obj.CustomerMobileNum = txtCMobieNum.Text;
                                            obj.CustomerEmailID = txtCEmailID.Text;

                                            GenerateMailFormat(obj.OrganisationName, obj.EmailID, obj.CustomerName, AppConstants.defaultPswd);

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

                                                    int VideoId = oVideo.VideoID;

                                                    if (VideoId > 0)
                                                    {
                                                        int VideoStatus = SaveVideoImageForApproval(ID, 1, "Videos/" + FileVideo.PostedFile.FileName, FileVideo.PostedFile.ContentType, FileVideo.PostedFile.FileName);

                                                        if (FileImage.HasFile)
                                                        {
                                                            int ImageStatus = SaveVideoImageForApproval(ID, 2, "Videos/" + FileImage.PostedFile.FileName, string.Empty, string.Empty);
                                                        }
                                                    }

                                                    int UserResult = CreateUser(ID);

                                                    if (UserResult > 0)
                                                    {
                                                        string title = "Message from System";
                                                        string msg = "<p>Advertiser has been registered successfully. User for advertiser has been also created.</p>";
                                                        string Url = "Default.aspx";
                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                                                        //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');function Redirect(){window.location='" + Url + "';}setTimeout('Redirect()', 4000);", true);
                                                        return;
                                                    }
                                                    else
                                                    {
                                                        string title = "Message from System";
                                                        string msg = "<p>Advertiser has been registered successfully, but unable to create User for advertiser. You can create user from user management page.</p>";
                                                        string Url = "LoginMaster.aspx";
                                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-danger','" + msg + "');function Redirect(){window.location='" + Url + "';}setTimeout('Redirect()', 4000);", true);
                                                        return;
                                                    }
                                                }
                                                catch (Exception ex)
                                                {
                                                    string title = "Message from System";
                                                    string msg = "<p>Advertiser has been registered successfully but unable to upload video.</p>";
                                                    string Url = "LoginMaster.aspx";
                                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-danger','" + msg + "');function Redirect(){window.location='" + Url + "';}setTimeout('Redirect()', 4000);", true);
                                                    return;
                                                }
                                            }
                                        }
                                        else
                                        {
                                            string title = "Message from System";
                                            string msg = "<p>Video duration must be greater than 1 minutes and less than 3 minutes. Please upload a valid file.</p>";
                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-warning','" + msg + "');", true);
                                            return;
                                        }
                                    }
                                    else
                                    {
                                        string title = "Message from System";
                                        string msg = "<p>Invalid video file. File size must be less than 100 MB.</p>";
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-warning','" + msg + "');", true);
                                        return;
                                    }
                                }
                                else
                                {
                                    string title = "Message from System";
                                    string msg = "<p>Invalid video file. Please upload only .mp4 file or .avi file. </p>";
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-warning','" + msg + "');", true);
                                    return;
                                }
                            }
                            else
                            {
                                string title = "Message from System";
                                string msg = "<p>Please select video to upload.</p>";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-warning','" + msg + "');", true);
                                return;
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        string exception = ex.InnerException.ToString();

                        string title = "Message from System";
                        string msg = "<p>Something went wrong while saving data, Please try later.</p>";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-danger','" + msg + "');", true);
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
                            string Url = "Default.aspx";                            
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');function Redirect(){window.location='" + Url + "';}setTimeout('Redirect()', 4000);", true);
                            return;
                        }
                    }
                    catch (Exception)
                    {
                        string title = "Message from System";
                        string msg = "<p>Something went wrong while updating data, Please try later.</p>";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-danger','" + msg + "');", true);
                        return;
                    }
                }
            }
            catch (Exception)
            {
                string title = "Message from System";
                string msg = "<p>Something went wrong while saving data, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-danger','" + msg + "');", true);
                return;
            }
        }
        public int CreateUser(int ID)
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
                obj.AdvertiserID = ID;
                BazaarModelContainer Db = new BazaarModelContainer();
                Db.UserInfoes.Add(obj);
                Db.SaveChanges();
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

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);
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
            DivPlans.Visible = false;
            SchemeDiv.Visible = true;
            txtPlan.Text = "Silver";
            //CreateAccount.Visible = true;
            UserAccount.Visible = false;
        }

        protected void btnBuyGold_Click(object sender, EventArgs e)
        {
            DivEntry.Visible = true;
            DivPlans.Visible = false;
            SchemeDiv.Visible = true;
            txtPlan.Text = "Gold";
            // CreateAccount.Visible = true;
            UserAccount.Visible = false;
        }

        protected void btnBuyDiamond_Click(object sender, EventArgs e)
        {
            DivEntry.Visible = true;
            DivPlans.Visible = false;
            SchemeDiv.Visible = true;
            txtPlan.Text = "Diamond";
            //CreateAccount.Visible = true;
            UserAccount.Visible = false;
        }

        protected void btnBuyPlatinum_Click(object sender, EventArgs e)
        {
            DivEntry.Visible = true;
            DivPlans.Visible = false;
            SchemeDiv.Visible = true;
            txtPlan.Text = "Platinum";
            //CreateAccount.Visible = true;
            UserAccount.Visible = false;

        }

        protected void LnkCreateAccount_Click(object sender, EventArgs e)
        {
            LoginBlock.Visible = false;
            DivPlans.Visible = false;
            DivEntry.Visible = false;
            CreateAccount.Visible = true;
            DivEntry.Visible = false;
            UserAccount.Visible = false;
        }


        public int SaveVideoImageForApproval(int AdvertiserID, int FileType, string Path, string ContentType, string Title)
        {
            try
            {
                BazaarModelContainer db = new BazaarModelContainer();

                VideosApproval Vapprovaal = new VideosApproval();
                Vapprovaal.AdvertiserID = AdvertiserID;
                Vapprovaal.ApprovalStatus = 1;
                Vapprovaal.FileType = FileType;
                Vapprovaal.FileName = Path;
                Vapprovaal.ContentType = ContentType;
                Vapprovaal.Title = Title;
                Vapprovaal.SubmitDate = DateTime.Now; ;
                db.VideosApprovals.Add(Vapprovaal);
                db.SaveChanges();

                return 1;
            }
            catch (Exception Ex)
            {
                string Exception = Ex.InnerException.ToString();
                string title = "Message from System";
                string msg = "<p>Unable to submit Advertiser details for verification, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return -1;
            }
        }


        #region For Mail

        public void GenerateMailFormat(string Name, string EmailID, string UserName, string Password)
        {
            string link = "#";
            string body = this.PopulateBody(Name, EmailID, UserName, Password, link);
            string Sub = "VideoDirectory Username and Password";

            this.sendMail(EmailID, Sub, body, link);
        }

        private string PopulateBody(string Name, String EmailID, String UserName, String Password, string Link)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("EmailTemplate.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{Name}", Name);
            body = body.Replace("{UserName}", UserName);
            body = body.Replace("{Password}", Password);
            body = body.Replace("{Link}", Link);


            return body;
        }

        private void sendMail(string EmailID, string Subject, string Body, string link)
        {
            MailMessage msg = new MailMessage();
            try
            {
                msg.From = new MailAddress(AppConstants.fromMail);
                if (EmailID != "" || EmailID != string.Empty)
                {
                    msg.To.Add(EmailID);
                    msg.Body = Body;
                    msg.IsBodyHtml = true;
                    msg.Subject = Subject;
                    SmtpClient smt = new SmtpClient(AppConstants.mailHost);
                    smt.Port = AppConstants.mailPort;
                    smt.Credentials = new NetworkCredential(AppConstants.fromMail, AppConstants.fromMailPwd);
                    smt.EnableSsl = true;
                    smt.Send(msg);
                }

            }
            catch (Exception ex)
            {
            }
            finally
            {
                msg.Dispose();
            }
        }
        #endregion

        protected void btnSaveUser_Click(object sender, EventArgs e)
        {
            if (btnSave.Text == "Save")
            {
                try
                {
                    UserInfo obj = new UserInfo();

                    obj.Name = txtFullName.Text;
                    obj.UserName = txtUser.Text;
                    obj.MobileNo = txtUserMobile.Text;
                    obj.MailID = txtUserEmail.Text;
                    obj.Password = EncodeString(txtUserPassword.Text);
                    obj.AadharNo = txtAadharNumber.Text;
                    obj.RoleID = 3;
                    obj.Address = txtAddress.Text;
                    obj.CreatedDate = DateTime.Now;
                    obj.AdvertiserID = 0;
                    BazaarModelContainer Db = new BazaarModelContainer();
                    Db.UserInfoes.Add(obj);

                    Db.SaveChanges();

                    string title = "Message from System";
                    string msg = "<p>User has been created successfully.</p>";
                    string Url = "LoginMaster.aspx";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');function Redirect(){window.location='" + Url + "';}setTimeout('Redirect()', 4000);", true);
                    return;
                }
                catch (Exception)
                {
                    string title = "Message from System";
                    string msg = "<p>Something went wrong while saving data, Please try later.</p>";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-danger','" + msg + "');", true);
                    return;
                }
            }
        }

        protected void btnCancelUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }


    }
}