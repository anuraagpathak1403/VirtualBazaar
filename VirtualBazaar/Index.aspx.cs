using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace VirtualBazaar
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["LoginName"] != null)
            {
                lblLoginName.Text = "Logout";
            }
            else
            {
                lblLoginName.Text = "Join Us";
            }

            if (!Page.IsPostBack)
            {
                BindGrid();
                BindAdvertiserCategory();
            }
        }

        public void BindGrid()
        {
            try
            {
                BazaarModelContainer Db = new BazaarModelContainer();

                var Catg = from Cat in Db.AdvertiserCategories
                           select Cat;

                List<AdvertiserCategory> oList = Catg.ToList();

                if (oList.Count > 0)
                {
                    grdvCategory.DataSource = oList;
                    grdvCategory.DataBind();
                }
            }
            catch (Exception ex)
            {
                String FUNCTION_NAME = "BindGrid";
                String MODULE_NAME = "Default.aspx";
                String ERROR_TYPE = "Application";
                String ERROR_DESC = ex.Message;
                string lineNumber = ex.StackTrace.Substring(ex.StackTrace.Length - 7, 7);
                string url = HttpContext.Current.Request.Url.AbsoluteUri;
                GenerateMailFormat(FUNCTION_NAME, MODULE_NAME, ERROR_TYPE, ERROR_DESC, url);

                string title = "Message from System";
                string msg = "<p>Unable to show details, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }

        public void BindSearchedCategoryGrid(int CategoryID)
        {
            try
            {
                BazaarModelContainer Db = new BazaarModelContainer();

                var Vid = (from video in Db.AdvertiserVideos
                           join Adv in Db.AdvertiserRegisterations on video.AdvertiserID equals Adv.AdvertiserID
                           join city in Db.Cities on Adv.CityID equals city.CityID
                           where Adv.Category == CategoryID && (city.CityName.Contains(txtSerchValue.Text.Trim()))

                           orderby Adv.AdvertiserID descending

                           let VisitorCount = (from Visitor in Db.VideoVisitors
                                               where Visitor.VideoID == video.VideoID
                                               select Visitor).Count()

                           let CommentsCount = (from Comments in Db.VideoComments
                                                where Comments.VideoID == video.VideoID
                                                select Comments).Count()

                           let RatingCount = (from Rating in Db.VideoRatings
                                              where Rating.VideoID == video.VideoID
                                              select Rating).Average(x => (int?)x.Rating)
                           select new
                           {
                               Name = Adv.OrganisationName,
                               Image = Adv.Image,
                               Id = video.VideoID,
                               ViewsAllowed = Adv.ViewsAllowed,
                               Views = VisitorCount,
                               Comments = CommentsCount,
                               Rating = RatingCount,
                               VideoTime = video.Duration,
                           }).Where(x => x.Views < x.ViewsAllowed).ToList();

                dtlistCategoryWiseVideo.DataSource = Vid;
                dtlistCategoryWiseVideo.DataBind();
            }
            catch (Exception ex)
            {
                String FUNCTION_NAME = "BindSearchedCategoryGrid";
                String MODULE_NAME = "Default.aspx";
                String ERROR_TYPE = "Application";
                String ERROR_DESC = ex.Message;
                string lineNumber = ex.StackTrace.Substring(ex.StackTrace.Length - 7, 7);
                string url = HttpContext.Current.Request.Url.AbsoluteUri;
                GenerateMailFormat(FUNCTION_NAME, MODULE_NAME, ERROR_TYPE, ERROR_DESC, url);

                string title = "Message from System";
                string msg = "<p>Unable to show details, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }

        public void BindCategoryAllVideo(int CategoryID)
        {
            try
            {
                BazaarModelContainer Db = new BazaarModelContainer();

                var Vid = (from video in Db.AdvertiserVideos
                           join Adv in Db.AdvertiserRegisterations on video.AdvertiserID equals Adv.AdvertiserID
                           where Adv.Category == CategoryID

                           orderby Adv.AdvertiserID descending

                           let VisitorCount = (from Visitor in Db.VideoVisitors
                                               where Visitor.VideoID == video.VideoID
                                               select Visitor).Count()

                           let CommentsCount = (from Comments in Db.VideoComments
                                                where Comments.VideoID == video.VideoID
                                                select Comments).Count()

                           let RatingCount = (from Rating in Db.VideoRatings
                                              where Rating.VideoID == video.VideoID
                                              select Rating).Average(x => (int?)x.Rating)
                           select new
                           {
                               Name = Adv.OrganisationName,
                               Image = Adv.Image,
                               Id = video.VideoID,
                               ViewsAllowed = Adv.ViewsAllowed,
                               Views = VisitorCount,
                               Comments = CommentsCount,
                               Rating = RatingCount,
                           }).Where(x => x.Views < x.ViewsAllowed).ToList();

                dtlistCategoryWiseVideo.DataSource = Vid;
                dtlistCategoryWiseVideo.DataBind();
            }
            catch (Exception ex)
            {
                String FUNCTION_NAME = "BindCategoryAllVideo";
                String MODULE_NAME = "Default.aspx";
                String ERROR_TYPE = "Application";
                String ERROR_DESC = ex.Message;
                string lineNumber = ex.StackTrace.Substring(ex.StackTrace.Length - 7, 7);
                string url = HttpContext.Current.Request.Url.AbsoluteUri;
                GenerateMailFormat(FUNCTION_NAME, MODULE_NAME, ERROR_TYPE, ERROR_DESC, url);

                string title = "Message from System";
                string msg = "<p>Unable to show details, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }

        protected void grdvCategory_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    HiddenField hdnCategoryID = (HiddenField)e.Row.FindControl("hdnCategoryID");
                    DataList DtlistAdvertisement = (DataList)e.Row.FindControl("DtlistAdvertisements");

                    int CategoryID = Convert.ToInt32(hdnCategoryID.Value);

                    BazaarModelContainer Db = new BazaarModelContainer();

                    var Vid = ((from video in Db.AdvertiserVideos
                                join Adv in Db.AdvertiserRegisterations on video.AdvertiserID equals Adv.AdvertiserID
                                where Adv.Category == CategoryID && Adv.ApprovalStatus == 2
                                orderby Adv.AdvertiserID descending
                                let VisitorCount = (from Visitor in Db.VideoVisitors
                                                    where Visitor.VideoID == video.VideoID
                                                    select Visitor).Count()
                                let CommentsCount = (from Comments in Db.VideoComments
                                                     where Comments.VideoID == video.VideoID
                                                     select Comments).Count()
                                let RatingCount = (from Rating in Db.VideoRatings
                                                   where Rating.VideoID == video.VideoID
                                                   select Rating).Average(x => (int?)x.Rating)
                                select new
                                {
                                    Name = Adv.OrganisationName,
                                    Image = Adv.Image,
                                    Id = video.VideoID,
                                    ViewsAllowed = Adv.ViewsAllowed,
                                    Views = VisitorCount,
                                    Comments = CommentsCount,
                                    Rating = RatingCount,
                                    VideoTime = video.Duration,
                                }).Where(x => x.Views < x.ViewsAllowed)).Take(4).ToList();

                    DtlistAdvertisement.DataSource = Vid;
                    DtlistAdvertisement.DataBind();
                }
            }
            catch (Exception ex)
            {
                String FUNCTION_NAME = "grdvCategory_RowDataBound";
                String MODULE_NAME = "Default.aspx";
                String ERROR_TYPE = "Application";
                String ERROR_DESC = ex.Message;
                string lineNumber = ex.StackTrace.Substring(ex.StackTrace.Length - 7, 7);
                string url = HttpContext.Current.Request.Url.AbsoluteUri;
                GenerateMailFormat(FUNCTION_NAME, MODULE_NAME, ERROR_TYPE, ERROR_DESC, url);

                string s = ex.InnerException.ToString();
                string title = "Message from System";
                string msg = "<p>Unable to show videos, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }

        public void BindAdvertiserCategory()
        {
            try
            {
                BazaarModelContainer Db = new BazaarModelContainer();

                var Catg = from Cty in Db.Cities
                           select Cty;
                
                List<City> oList = Catg.ToList();

                if (oList != null)
                {
                    ddlCity.DataSource = oList;
                    ddlCity.DataTextField = "CityName";
                    ddlCity.DataValueField = "CityID";
                    ddlCity.DataBind();
                }

                ddlCity.Items.Insert(0, new ListItem("Select", "0"));
            }
            catch (Exception ex)
            {
                String FUNCTION_NAME = "BindAdvertiserCategory";
                String MODULE_NAME = "Default.aspx";
                String ERROR_TYPE = "Application";
                String ERROR_DESC = ex.Message;
                string lineNumber = ex.StackTrace.Substring(ex.StackTrace.Length - 7, 7);
                string url = HttpContext.Current.Request.Url.AbsoluteUri;
                GenerateMailFormat(FUNCTION_NAME, MODULE_NAME, ERROR_TYPE, ERROR_DESC, url);

                string title = "Message from System";
                string msg = "<p>Unable to bind advertiser category, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }

        protected void btnSumit_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlCity.SelectedIndex > 0)
                {
                    int categoryID = Convert.ToInt32(ddlCity.SelectedValue);

                    if (txtSerchValue.Text != string.Empty)
                    {
                        BindSearchedCategoryGrid(categoryID);

                        lblname.Text = "Search result for " + txtSerchValue.Text + ", " + ddlCity.SelectedItem.Text;
                    }
                    else
                    {
                        BindCategoryAllVideo(categoryID);

                        lblname.Text = "Search result for " + ddlCity.SelectedItem.Text;
                    }

                    CategryWise.Visible = true;
                    TopRated.Visible = false;
                }
                else
                {
                    BindGrid();
                    CategryWise.Visible = false;
                    TopRated.Visible = true;
                }
            }
            catch (Exception ex)
            {
                String FUNCTION_NAME = "btnSumit_Click";
                String MODULE_NAME = "Default.aspx";
                String ERROR_TYPE = "Application";
                String ERROR_DESC = ex.Message;
                string lineNumber = ex.StackTrace.Substring(ex.StackTrace.Length - 7, 7);
                string url = HttpContext.Current.Request.Url.AbsoluteUri;
                GenerateMailFormat(FUNCTION_NAME, MODULE_NAME, ERROR_TYPE, ERROR_DESC, url);

                string title = "Message from System";
                string msg = "<p>Unable to show search result, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }

        protected void lnkbtnViewAll_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton ViewAll = (sender) as LinkButton;
                GridViewRow row = (GridViewRow)ViewAll.NamingContainer;

                HiddenField hdnCategoryID = (HiddenField)row.FindControl("hdnCategoryID");
                Label lblCategory = (Label)row.FindControl("lblCategory");
                BindCategoryAllVideo(Convert.ToInt32(hdnCategoryID.Value));

                lblname.Text = lblCategory.Text;
                CategryWise.Visible = true;
                TopRated.Visible = false;
            }
            catch (Exception ex)
            {
                String FUNCTION_NAME = "lnkbtnViewAll_Click";
                String MODULE_NAME = "Default.aspx";
                String ERROR_TYPE = "Application";
                String ERROR_DESC = ex.Message;
                string lineNumber = ex.StackTrace.Substring(ex.StackTrace.Length - 7, 7);
                string url = HttpContext.Current.Request.Url.AbsoluteUri;
                GenerateMailFormat(FUNCTION_NAME, MODULE_NAME, ERROR_TYPE, ERROR_DESC, url);

                string title = "Message from System";
                string msg = "<p>Unable to view all videos, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }

        protected void btnviewmap_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewMap.aspx", false);
        }

        [WebMethod]
        public static List<string> GetOrgName(string SearchValue)
        {
            try
            {
                List<string> Result = new List<string>();

                BazaarModelContainer Db = new BazaarModelContainer();

                var Suggestion = (from Adv in Db.AdvertiserRegisterations
                                  join Cat in Db.AdvertiserCategories on Adv.Category equals Cat.CategoryID
                                  join City in Db.Cities on Adv.CityID equals City.CityID
                                  where Adv.OrganisationName.Contains(SearchValue) || Cat.Category.Contains(SearchValue)

                                  select new
                                  {
                                      Name = City.CityName
                                  }).Distinct().ToList();

                foreach (var item in Suggestion)
                {
                    Result.Add(item.Name);
                }

                return Result;
            }
            catch (Exception)
            {
                return null;
            }
        }

        protected void lblLoginName_Click(object sender, EventArgs e)
        {
            if (lblLoginName.Text == "Join Us")
            {
                Response.Redirect("LoginMaster.aspx", false);
            }
            else
            {
                Session["UserID"] = null;
                Session["LoginName"] = null;
                Session["Advertiser"] = null;
                Response.Redirect("Default.aspx", false);
            }
        }

        protected void GenerateMailFormat(String FunctionName, String ModuleName, String ErrorType, String ErrorDesc, String url)
        {
            string body = this.PopulateBody(FunctionName, ModuleName, ErrorType, ErrorDesc, url);

            //Pass Parameters to SendMail function
            this.sendMail("anuraagp14@gmail.com", Convert.ToString("Error MESSEGE"), body);

        }

        private string PopulateBody(String FunctionName, string ModuleName, String ErrorName, String ErrorDesc, string url)
        {
            string body = string.Empty;

            body = body.Replace("{FunctionName}", FunctionName);
            body = body.Replace("{ModuleName}", ModuleName);
            body = body.Replace("{ErrorName}", ErrorName);
            body = body.Replace("{ErrorDesc}", ErrorDesc);
            body = body.Replace("{url}", url);
            return body;
        }
        
        private void sendMail(string EmailID, string Subject, string Body)
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
            catch (Exception Ex)
            {

            }
            finally
            {

                msg.Dispose();
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
    }
}