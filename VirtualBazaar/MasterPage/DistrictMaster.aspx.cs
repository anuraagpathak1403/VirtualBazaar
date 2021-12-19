using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirtualBazaar.MasterPage
{
    public partial class DistrictMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
                DivEntry.Visible = false;
                DivGridView.Visible = true;
                BindState();
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
            catch (Exception)
            {
            }
        }
        public void BindData()
        {
            try
            {
                BazaarModelContainer Db = new BazaarModelContainer();

                var DistrictList = from District in Db.Cities
                                   select District;
                if (Db.Cities.Count() > 0)
                {
                    List<City> oList = DistrictList.ToList();

                    grdvDistrict.DataSource = oList;
                    grdvDistrict.DataBind();
                }
            }
            catch (Exception)
            {
            }
        }


        protected void lnkbtnEdit_Click(object sender, EventArgs e)
        {
            LinkButton Edit = (sender) as LinkButton;
            GridViewRow row = (GridViewRow)Edit.NamingContainer;

            HiddenField hdnDistrictID = (HiddenField)row.FindControl("hdnDistrictID");

            int DistrictID = Convert.ToInt32(hdnDistrictID.Value);

            BazaarModelContainer Db = new BazaarModelContainer();
            var DistrictList = from District in Db.Cities
                               where District.CityID == DistrictID

                               select District;

            List<City> oList = DistrictList.ToList();
            hdfDistrictID.Value = oList[0].CityID.ToString();
            txtDistrict.Text = oList[0].CityName;
            btnSave.Text = "Update";
            DivEntry.Visible = true;
            DivGridView.Visible = false;
        }

        protected void lnkbtnforDelete_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton Edit = (sender) as LinkButton;
                GridViewRow row = (GridViewRow)Edit.NamingContainer;

                HiddenField hdnDistrictID = (HiddenField)row.FindControl("hdnDistrictID");

                int DistrictID = Convert.ToInt32(hdnDistrictID.Value);

                City oCity = new City() { CityID = DistrictID };

                BazaarModelContainer Db = new BazaarModelContainer();
                Db.Cities.Attach(oCity);
                Db.Cities.Remove(oCity);

                Db.SaveChanges();
                string title = "Message from System";
                string msg = "<p>District has been deleted successfully.</p>";
                string Url = "DistrictMaster.aspx";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-danger','" + msg + "');function Redirect(){window.location='" + Url + "';}setTimeout('Redirect()', 2000);", true);
                return;

                BindData();
            }
            catch (Exception)
            {

            }
        }

        protected void btnAddDistrict_Click(object sender, EventArgs e)
        {
            DivEntry.Visible = true;
            DivGridView.Visible = false;
        }

        protected void grdvDistrict_PreRender(object sender, EventArgs e)
        {
            if (grdvDistrict.Rows.Count > 0)
            {
                grdvDistrict.UseAccessibleHeader = false;
                grdvDistrict.HeaderRow.TableSection = TableRowSection.TableHeader;
                grdvDistrict.FooterRow.TableSection = TableRowSection.TableFooter;
                int CellCount = grdvDistrict.FooterRow.Cells.Count;
                grdvDistrict.FooterRow.Cells.Clear();
                grdvDistrict.FooterRow.Cells.Add(new TableCell());
                grdvDistrict.FooterRow.Cells[0].ColumnSpan = CellCount - 1;
                grdvDistrict.FooterRow.Cells[0].HorizontalAlign = HorizontalAlign.Right;
                grdvDistrict.FooterRow.Cells.Add(new TableCell());

                TableFooterRow tfr = new TableFooterRow();
                for (int i = 0; i < CellCount; i++)
                {
                    tfr.Cells.Add(new TableCell());

                    grdvDistrict.FooterRow.Controls[1].Controls.Add(tfr);
                }
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (btnSave.Text == "Save")
            {
                try
                {
                    City oCity = new City();

                    BazaarModelContainer Db = new BazaarModelContainer();

                    oCity.StateID = Convert.ToInt32(ddlState.SelectedValue);
                    oCity.CityName = txtDistrict.Text;

                    Db.Cities.Add(oCity);
                    Db.SaveChanges();

                    string title = "Message from System";
                    string msg = "<p>District has been inserted successfully.</p>";
                    string Url = "DistrictMaster.aspx";
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
                    int City_ID = Convert.ToInt32(hdfDistrictID.Value);
                    City oCity = Db.Cities.SingleOrDefault(p => p.CityID == City_ID);

                    oCity.CityName = txtDistrict.Text;
                    Db.SaveChanges();

                    string title = "Message from System";
                    string msg = "<p>District has been updated successfully.</p>";
                    string Url = "DistrictMaster.aspx";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');function Redirect(){window.location='" + Url + "';}setTimeout('Redirect()', 2000);", true);
                    return;
                }
                catch (Exception)
                {
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("DistrictMaster.aspx");
        }
    }
}