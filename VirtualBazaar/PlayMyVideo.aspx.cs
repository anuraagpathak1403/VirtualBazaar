using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace VirtualBazaar
{
    public partial class PlayMyVideo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["LoginName"] != null)
                {
                    lblLoginName.Text = "Logout";
                }
                else
                {
                    lblLoginName.Text = "Join Us";
                }
                if (Request.QueryString["Id"] != null)
                {
                    int Id = Convert.ToInt32(Request.QueryString["Id"]);
                    hdnVideoID.Value = Id.ToString();

                    BazaarModelContainer Db = new BazaarModelContainer();

                    var Video = (from vid in Db.AdvertiserVideos
                                 join Adv in Db.AdvertiserRegisterations on vid.AdvertiserID equals Adv.AdvertiserID
                                 join Catg in Db.AdvertiserCategories on Adv.Category equals Catg.CategoryID
                                 join States in Db.States on Adv.StateID equals States.StateID
                                 join Cty in Db.Cities on Adv.CityID equals Cty.CityID
                                 join Loc in Db.Localities on Adv.LocalityID equals Loc.LocalityID
                                 where vid.VideoID == Id

                                 let VisitorCount = (from Visitor in Db.VideoVisitors
                                                     where Visitor.VideoID == vid.VideoID
                                                     select Visitor).Count()
                                 let CommentsCount = (from Comments in Db.VideoComments
                                                      where Comments.VideoID == vid.VideoID
                                                      select Comments).Count()

                                 select new
                                 {
                                     VideoID = vid.VideoID,
                                     OrgName = Adv.OrganisationName,
                                     AdvImage = Adv.Image,
                                     Category = Catg.Category,
                                     MobileNo = Adv.MobileNo,
                                     EmailID = Adv.EmailID,
                                     Address = Adv.Street + ", " + Adv.Landmark + ", " + Loc.LocalityName + ", " + Cty.CityName + ", " + States.StateName + ", India",
                                     Description = Adv.Description,
                                     ContactName = Adv.CustomerName,
                                     ContactEmail = Adv.CustomerEmailID,
                                     ContactMobileNo = Adv.CustomerMobileNum,
                                     Views = VisitorCount,
                                     Comments = CommentsCount,
                                     VideoTime = vid.Duration,
                                     lat = Adv.Latitude,
                                     longi = Adv.Longitude,
                                 }).ToList();

                    BindCategoryGrid(Id);

                    if (Video != null)
                    {
                        dlVideo.DataSource = Video;
                        dlVideo.DataBind();
                        BindComments();
                    }

                    string IpAddress = Request.UserHostAddress;

                    if(IpAddress == "::1")
                    {
                        IpAddress = string.Empty;
                    }
                    
                    string IP = string.Empty;

                    if (IpAddress != string.Empty)
                    {
                        XmlDocument doc = new XmlDocument();
                        doc.Load(string.Format("http://www.freegeoip.net/json/{0}", IpAddress));
                        XmlNodeList nodeLstCity = doc.GetElementsByTagName("City");
                        IP = "" + nodeLstCity[0].InnerText + "<br>" + IpAddress;                        
                    }

                    try
                    {
                        int Count = Db.VideoVisitors.Count(x => x.IPAddress == IP);


                        VideoVisitor oVisit = new VideoVisitor();

                        if (Count == 0)
                        {

                            oVisit.VideoID = Id;
                            oVisit.UserID = 0;
                            oVisit.IPAddress = IpAddress;
                            oVisit.Region = "Not Found";
                            oVisit.VisitDate = DateTime.Now;

                            Db.VideoVisitors.Add(oVisit);
                            Db.SaveChanges();
                        }
                    }
                    catch (Exception)
                    {
                        string title = "Message from System";
                        string msg = "<p>Unable to submit visitor details, Please try later.</p>";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                        return;
                    }
                }
            }
            catch (Exception ex)
            {
                string title = "Message from System";
                string msg = "<p>Unable to show videos, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }

        public void BindCategoryGrid(int VideoID)
        {
            try
            {
                BazaarModelContainer Db = new BazaarModelContainer();

                int CategoryID = 0;

                var Category = (from video in Db.AdvertiserVideos
                                join Adv in Db.AdvertiserRegisterations on video.AdvertiserID equals Adv.AdvertiserID
                                where video.VideoID == VideoID
                                select new
                                {
                                    id = Adv.Category
                                }).ToList();
                if (Category.Count > 0)
                {
                    CategoryID = Category[0].id;
                }


                var Vid = (from video in Db.AdvertiserVideos
                           join Adv in Db.AdvertiserRegisterations on video.AdvertiserID equals Adv.AdvertiserID
                           where Adv.Category == CategoryID
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
                               Id = video.VideoID,
                               Image = Adv.Image,
                               ViewsAllowed = Adv.ViewsAllowed,
                               Views = VisitorCount,
                               Rating = RatingCount,
                               Comments = CommentsCount,
                               VideoTime = video.Duration,

                           }).Where(x => x.Views < x.ViewsAllowed).ToList();

                dtlistCategoryWiseVideo.DataSource = Vid;
                dtlistCategoryWiseVideo.DataBind();
            }
            catch (Exception ex)
            {
                string title = "Message from System";
                string msg = "<p>Unable to show details, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtComments.Text != string.Empty)
                {
                    BazaarModelContainer Db = new BazaarModelContainer();

                    VideoComment oComments = new VideoComment();

                    oComments.VideoID = Convert.ToInt32(hdnVideoID.Value);
                    oComments.Comments = txtComments.Text;
                    oComments.CommentsBy = Session["LoginName"].ToString();
                    oComments.CommentDate = DateTime.Now;

                    Db.VideoComments.Add(oComments);
                    Db.SaveChanges();

                    txtComments.Text = string.Empty;
                    BindComments();

                    string title = "Message from System";
                    string msg = "<p>Comment has been submitted successfully.</p>";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                    return;
                }
                else
                {
                    string title = "Message from System";
                    string msg = "<p>Please enter comment first.</p>";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                    return;
                }
            }
            catch (Exception)
            {
                string title = "Message from System";
                string msg = "<p>Unable to submit comment, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }

        public void BindComments()
        {
            try
            {
                BazaarModelContainer Db = new BazaarModelContainer();

                int VideoID = Convert.ToInt32(hdnVideoID.Value);

                var Comment = (from com in Db.VideoComments
                               where com.VideoID == VideoID

                               let CommentsCount = (from Comments in Db.VideoComments
                                                    where Comments.VideoID == VideoID
                                                    select Comments).Count()

                               select new
                               {
                                   CommentsBy = com.CommentsBy,
                                   CommentDate = com.CommentDate,
                                   Comments = com.Comments,
                                   CommentsCount = CommentsCount
                               }).ToList();

                if (Comment != null)
                {
                    grdvComments.DataSource = Comment;
                    grdvComments.DataBind();

                    if (Comment.Count > 0)
                    {
                        lblCommentsCount.Text = Comment[0].CommentsCount.ToString();
                    }
                    else
                    {
                        lblCommentsCount.Text = "0";
                    }
                }
            }
            catch (Exception)
            {
                string title = "Message from System";
                string msg = "<p>Unable to bind comments, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }

        protected void VideoRating_Click(object sender, AjaxControlToolkit.RatingEventArgs e)
        {
            try
            {

                VideoRating oRating = new VideoRating();

                oRating.VideoID = Convert.ToInt32(hdnVideoID.Value);
                oRating.UserID = Convert.ToInt32(Session["UserID"]);
                oRating.Rating = VideoRating.CurrentRating;
                oRating.Date = DateTime.Now;

                BazaarModelContainer Db = new BazaarModelContainer();
                Db.VideoRatings.Add(oRating);
                Db.SaveChanges();
            }
            catch (Exception)
            {
                string title = "Message from System";
                string msg = "<p>Unable to submit rating, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
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
    }
}