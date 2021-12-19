using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirtualBazaar.MasterPage
{
    public partial class CategoryMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
                DivEntry.Visible = false;
                DivGridView.Visible = true;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (btnSave.Text == "Save")
            {
                try
                {
                    AdvertiserCategory oAdvertiserCategory = new AdvertiserCategory();

                    BazaarModelContainer Db = new BazaarModelContainer();

                    string Dir = "~/CategoryIcons/";

                    if (FileIcon.HasFile)
                    {
                        FileIcon.SaveAs(Server.MapPath(Dir + FileIcon.PostedFile.FileName));
                    }


                    oAdvertiserCategory.Category = txtCategory.Text;
                    oAdvertiserCategory.Icons = "CategoryIcons/" + FileIcon.PostedFile.FileName;
                    Db.AdvertiserCategories.Add(oAdvertiserCategory);
                    Db.SaveChanges();

                    string title = "Message from System";
                    string msg = "<p>Category has been inserted successfully.</p>";
                    string Url = "CategoryMaster.aspx";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');function Redirect(){window.location='" + Url + "';}setTimeout('Redirect()', 2000);", true);
                    return;
                }
                catch (Exception)
                {
                }
            }
            else
            {
                try
                {
                    BazaarModelContainer Db = new BazaarModelContainer();
                    int Category_ID = Convert.ToInt32(hdfCategoryID.Value);
                    AdvertiserCategory oAdvertiserCategory = Db.AdvertiserCategories.SingleOrDefault(p => p.CategoryID == Category_ID);

                    oAdvertiserCategory.Category = txtCategory.Text;
                    Db.SaveChanges();

                    string title = "Message from System";
                    string msg = "<p>Category has been updated successfully.</p>";
                    string Url = "CategoryMaster.aspx";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');function Redirect(){window.location='" + Url + "';}setTimeout('Redirect()', 2000);", true);
                    return;
                }
                catch (Exception)
                {
                }
            }
        }


        public void BindData()
        {
            try
            {
                BazaarModelContainer Db = new BazaarModelContainer();

                var LocationList = from Location in Db.AdvertiserCategories
                                   select Location;

                List<AdvertiserCategory> oList = LocationList.ToList();

                grdvCategory.DataSource = oList;
                grdvCategory.DataBind();
            }
            catch (Exception)
            {
            }
        }

        protected void grdvCategory_PreRender(object sender, EventArgs e)
        {
            if (grdvCategory.Rows.Count > 0)
            {
                grdvCategory.UseAccessibleHeader = false;
                grdvCategory.HeaderRow.TableSection = TableRowSection.TableHeader;
                grdvCategory.FooterRow.TableSection = TableRowSection.TableFooter;
                int CellCount = grdvCategory.FooterRow.Cells.Count;
                grdvCategory.FooterRow.Cells.Clear();
                grdvCategory.FooterRow.Cells.Add(new TableCell());
                grdvCategory.FooterRow.Cells[0].ColumnSpan = CellCount - 1;
                grdvCategory.FooterRow.Cells[0].HorizontalAlign = HorizontalAlign.Right;
                grdvCategory.FooterRow.Cells.Add(new TableCell());

                TableFooterRow tfr = new TableFooterRow();
                for (int i = 0; i < CellCount; i++)
                {
                    tfr.Cells.Add(new TableCell());

                    grdvCategory.FooterRow.Controls[1].Controls.Add(tfr);
                }
            }

        }

        protected void lnkbtnEdit_Click(object sender, EventArgs e)
        {
            LinkButton Edit = (sender) as LinkButton;
            GridViewRow row = (GridViewRow)Edit.NamingContainer;

            HiddenField hdnCategoryID = (HiddenField)row.FindControl("hdnCategoryID");

            int CategoryID = Convert.ToInt32(hdnCategoryID.Value);

            BazaarModelContainer Db = new BazaarModelContainer();
            var LocationList = from Location in Db.AdvertiserCategories
                               where Location.CategoryID == CategoryID

                               select Location;

            List<AdvertiserCategory> oList = LocationList.ToList();
            hdfCategoryID.Value = oList[0].CategoryID.ToString();
            txtCategory.Text = oList[0].Category;
            btnSave.Text = "Update";
        }

        protected void lnkbtnforDelete_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton Delete = (sender) as LinkButton;
                GridViewRow row = (GridViewRow)Delete.NamingContainer;

                HiddenField hdnCategoryID = (HiddenField)row.FindControl("hdnCategoryID");

                int CategoryID = Convert.ToInt32(hdnCategoryID.Value);

                AdvertiserCategory oAdvertiserCategory = new AdvertiserCategory() { CategoryID = CategoryID };

                BazaarModelContainer Db = new BazaarModelContainer();
                Db.AdvertiserCategories.Attach(oAdvertiserCategory);
                Db.AdvertiserCategories.Remove(oAdvertiserCategory);

                Db.SaveChanges();
                string title = "Message from System";
                string msg = "<p>Category has been deleted successfully.</p>";
                string Url = "CategoryMaster.aspx";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-danger','" + msg + "');function Redirect(){window.location='" + Url + "';}setTimeout('Redirect()', 2000);", true);
                return;

                BindData();
            }
            catch (Exception)
            {

            }
        }


        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            DivEntry.Visible = true;
            DivGridView.Visible = false;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("CategoryMaster.aspx");
        }

    }
}