using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirtualBazaar.MasterPage
{
    public partial class LocalityMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
                BindCityName();
                DivEntry.Visible = false;
                DivGridView.Visible = true;
            }
        }


        public void BindCityName()
        {
            try
            {
                BazaarModelContainer Db = new BazaarModelContainer();

                var DistrictList = from District in Db.Cities
                                   select District;

                List<City> oList = DistrictList.ToList();

                if (oList != null)
                {
                    ddlDistrict.DataSource = oList;
                    ddlDistrict.DataTextField = "CityName";
                    ddlDistrict.DataValueField = "CityID";
                    ddlDistrict.DataBind();
                }

                ddlDistrict.Items.Insert(0, new ListItem("Select", "0"));
            }
            catch (Exception ex)
            {
                string title = "Message from System";
                string msg = "<p>Unable to bind state, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (btnSave.Text == "Save")
            {
                try
                {
                    Locality oLocality = new Locality();

                    BazaarModelContainer Db = new BazaarModelContainer();
                    oLocality.LocalityName = txtLocality.Text;
                    oLocality.CityID = Convert.ToInt32(ddlDistrict.SelectedValue);
                    Db.Localities.Add(oLocality);
                    Db.SaveChanges();

                    string title = "Message from System";
                    string msg = "<p>Locality has been inserted successfully.</p>";
                    string Url = "LocalityMaster.aspx";
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
                    int Locality_ID = Convert.ToInt32(hdfLocationID.Value);
                    Locality oLocality = Db.Localities.SingleOrDefault(p => p.LocalityID == Locality_ID);

                    oLocality.LocalityName = txtLocality.Text;
                    Db.SaveChanges();

                    string title = "Message from System";
                    string msg = "<p>Locality has been updated successfully.</p>";
                    string Url = "LocalityMaster.aspx";
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

                var LocationList = from Location in Db.Localities
                                   select Location;

                List<Locality> oList = LocationList.ToList();

                grdvLocation.DataSource = oList;
                grdvLocation.DataBind();
            }
            catch (Exception)
            {
            }
        }

        protected void lnkbtnEdit_Click(object sender, EventArgs e)
        {
            LinkButton Edit = (sender) as LinkButton;
            GridViewRow row = (GridViewRow)Edit.NamingContainer;

            HiddenField hdnLocationID = (HiddenField)row.FindControl("hdnLocationID");

            int LocationID = Convert.ToInt32(hdnLocationID.Value);

            BazaarModelContainer Db = new BazaarModelContainer();
            var LocationList = from Location in Db.Localities
                               where Location.LocalityID == LocationID

                               select Location;

            List<Locality> oList = LocationList.ToList();
            hdfLocationID.Value = oList[0].LocalityID.ToString();
            txtLocality.Text = oList[0].LocalityName;
            btnSave.Text = "Update";
            DivEntry.Visible = true;
            DivGridView.Visible = false;
        }

        protected void lnkbtnforDelete_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton Delete = (sender) as LinkButton;
                GridViewRow row = (GridViewRow)Delete.NamingContainer;

                HiddenField hdnLocationID = (HiddenField)row.FindControl("hdnLocationID");

                int Location_ID = Convert.ToInt32(hdnLocationID.Value);

                Locality oLocality = new Locality() { LocalityID = Location_ID };

                BazaarModelContainer Db = new BazaarModelContainer();
                Db.Localities.Attach(oLocality);
                Db.Localities.Remove(oLocality);

                Db.SaveChanges();
                string title = "Message from System";
                string msg = "<p>Category has been deleted successfully.</p>";
                string Url = "LocalityMaster.aspx";
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

        protected void grdvLocation_PreRender(object sender, EventArgs e)
        {
            if (grdvLocation.Rows.Count > 0)
            {
                grdvLocation.UseAccessibleHeader = false;
                grdvLocation.HeaderRow.TableSection = TableRowSection.TableHeader;
                grdvLocation.FooterRow.TableSection = TableRowSection.TableFooter;
                int CellCount = grdvLocation.FooterRow.Cells.Count;
                grdvLocation.FooterRow.Cells.Clear();
                grdvLocation.FooterRow.Cells.Add(new TableCell());
                grdvLocation.FooterRow.Cells[0].ColumnSpan = CellCount - 1;
                grdvLocation.FooterRow.Cells[0].HorizontalAlign = HorizontalAlign.Right;
                grdvLocation.FooterRow.Cells.Add(new TableCell());

                TableFooterRow tfr = new TableFooterRow();
                for (int i = 0; i < CellCount; i++)
                {
                    tfr.Cells.Add(new TableCell());

                    grdvLocation.FooterRow.Controls[1].Controls.Add(tfr);
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("LocalityMaster.aspx");
        }
    }
}