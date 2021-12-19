using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace VirtualBazaar
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    BindGrid();
                    bindCategory();
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
        
        public void bindCategory()
        {
            try
            {                
                BazaarModelContainer Db = new BazaarModelContainer();

                var Catg = from Cat in Db.AdvertiserCategories
                           select Cat;

                List<AdvertiserCategory> oList = Catg.ToList();

                if (oList.Count > 0)
                {
                    rbtLstCategory.DataSource = oList;
                    rbtLstCategory.DataTextField = "Category";
                    rbtLstCategory.DataValueField = "CategoryID";
                    rbtLstCategory.DataBind();

                    rbtLstCategory.Items.Insert(0, new ListItem("Top Rated", "0"));

                    rbtLstCategory.SelectedIndex = 0;
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
        
        public void BindGrid()
        {
            try
            {                
                BazaarModelContainer Db=new BazaarModelContainer();

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

        public void BindCategoryGrid(int CategoryID)
        {
            try
            {
                BazaarModelContainer Db = new BazaarModelContainer();

                var Vid = (from video in Db.AdvertiserVideos
                           join Adv in Db.AdvertiserRegisterations on video.AdvertiserID equals Adv.AdvertiserID
                           where Adv.Category == CategoryID
                           let VisitorCount = (from Visitor in Db.VideoVisitors
                                               where Visitor.VideoID == video.VideoID
                                               select Visitor).Count()
                           let CommentsCount = (from Comments in Db.VideoComments
                                                where Comments.VideoID == video.VideoID
                                                select Comments).Count()
                           select new
                           {
                               Name = Adv.OrganisationName,
                               Id = video.VideoID,
                               ViewsAllowed = Adv.ViewsAllowed,
                               Views = VisitorCount,
                               Comments = CommentsCount
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

                    var Vid = (from video in Db.AdvertiserVideos
                               join Adv in Db.AdvertiserRegisterations on video.AdvertiserID equals Adv.AdvertiserID
                               where Adv.Category == CategoryID
                               let VisitorCount = (from Visitor in Db.VideoVisitors
                                                   where Visitor.VideoID == video.VideoID
                                                   select Visitor).Count()
                               let CommentsCount = (from Comments in Db.VideoComments
                                                    where Comments.VideoID == video.VideoID
                                                    select Comments).Count()
                               select new
                               {
                                   Name = Adv.OrganisationName,
                                   Image = Adv.Image,
                                   Id = video.VideoID,
                                   ViewsAllowed = Adv.ViewsAllowed,
                                   Views = VisitorCount,
                                   Comments = CommentsCount
                               }).Where(x => x.Views < x.ViewsAllowed).ToList();

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

        protected void rbtLstCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbtLstCategory.SelectedIndex == 0)
            {
                BindGrid();
                CategryWise.Visible = false;
                TopRated.Visible = true;
                
            }
            else
            {
                int categoryID = Convert.ToInt32(rbtLstCategory.SelectedValue);
                BindCategoryGrid(categoryID);
                lblname.Text = rbtLstCategory.SelectedItem.Text;
                CategryWise.Visible = true;
                TopRated.Visible = false;
            }
        }
    }
}