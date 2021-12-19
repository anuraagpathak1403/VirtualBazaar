using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirtualBazaar
{
    public partial class ApprovevideoPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)            
        {
            if (!Page.IsPostBack)
            {
                if (!Page.IsPostBack)
                {
                    BindGrid();
                    
                }
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
                                join Approval in Db.VideosApprovals on Adv.AdvertiserID equals Approval.AdvertiserID
                                where Adv.Category == CategoryID && Adv.ApprovalStatus == 1 && Approval.FileType==1
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
                                    AdvertiserID = Adv.AdvertiserID,
                                    Name = Adv.OrganisationName,
                                    Image = Adv.Image,
                                    Id = video.VideoID,
                                    ViewsAllowed = Adv.ViewsAllowed,
                                    Views = VisitorCount,
                                    Comments = CommentsCount,
                                    Rating = RatingCount,
                                }).Where(x => x.Views < x.ViewsAllowed)).Take(5).ToList();

                    DtlistAdvertisement.DataSource = Vid;
                    DtlistAdvertisement.DataBind();
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
                string title = "Message from System";
                string msg = "<p>Unable to show details, Please try later.</p>";
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
            catch (Exception)
            {
                string title = "Message from System";
                string msg = "<p>Unable to view all videos, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
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
                string title = "Message from System";
                string msg = "<p>Unable to show details, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }
        }
    }
