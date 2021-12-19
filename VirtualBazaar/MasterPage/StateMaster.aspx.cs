using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirtualBazaar.MasterPage
{
    public partial class StateMaster : System.Web.UI.Page
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
                    State oState = new State();

                    BazaarModelContainer Db = new BazaarModelContainer();
                    oState.StateName = txtState.Text;
                    Db.States.Add(oState);
                    Db.SaveChanges();

                    string title = "Message from System";
                    string msg = "<p>State has been inserted successfully.</p>";
                    string Url = "StateMaster.aspx";
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
                    int State_ID = Convert.ToInt32(hdfStateID.Value);
                    State oState = Db.States.SingleOrDefault(p => p.StateID == State_ID);

                    oState.StateName = txtState.Text;
                    Db.SaveChanges();

                    string title = "Message from System";
                    string msg = "<p>State has been updated successfully.</p>";
                    string Url = "StateMaster.aspx";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');function Redirect(){window.location='" + Url + "';}setTimeout('Redirect()', 2000);", true);
                    return;
                }
                catch (Exception)
                {
                }
            }
        }

        protected void grdvState_PreRender(object sender, EventArgs e)
        {
            if (grdvState.Rows.Count > 0)
            {
                grdvState.UseAccessibleHeader = false;
                grdvState.HeaderRow.TableSection = TableRowSection.TableHeader;
                grdvState.FooterRow.TableSection = TableRowSection.TableFooter;
                int CellCount = grdvState.FooterRow.Cells.Count;
                grdvState.FooterRow.Cells.Clear();
                grdvState.FooterRow.Cells.Add(new TableCell());
                grdvState.FooterRow.Cells[0].ColumnSpan = CellCount - 1;
                grdvState.FooterRow.Cells[0].HorizontalAlign = HorizontalAlign.Right;
                grdvState.FooterRow.Cells.Add(new TableCell());

                TableFooterRow tfr = new TableFooterRow();
                for (int i = 0; i < CellCount; i++)
                {
                    tfr.Cells.Add(new TableCell());

                    grdvState.FooterRow.Controls[1].Controls.Add(tfr);
                }
            }
        }

        public void BindData()
        {
            try
            {
                BazaarModelContainer Db = new BazaarModelContainer();

                var StateList = from StateName in Db.States
                                select StateName;
                if (Db.States.Count() > 0)
                {
                    List<State> oList = StateList.ToList();

                    grdvState.DataSource = oList;
                    grdvState.DataBind();
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

            HiddenField hdnStateID = (HiddenField)row.FindControl("hdnStateID");

            int State_ID = Convert.ToInt32(hdnStateID.Value);

            BazaarModelContainer Db = new BazaarModelContainer();
            var StateList = from StateName in Db.States
                            where StateName.StateID == State_ID

                            select StateName;

            List<State> oList = StateList.ToList();
            hdfStateID.Value = oList[0].StateID.ToString();
            txtState.Text = oList[0].StateName;
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

                HiddenField hdnStateID = (HiddenField)row.FindControl("hdnStateID");

                int StateID = Convert.ToInt32(hdnStateID.Value);

                State oState = new State() { StateID = StateID };

                BazaarModelContainer Db = new BazaarModelContainer();
                Db.States.Attach(oState);
                Db.States.Remove(oState);

                Db.SaveChanges();
                string title = "Message from System";
                string msg = "<p>State has been deleted successfully.</p>";
                string Url = "StateMaster.aspx";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-danger','" + msg + "');function Redirect(){window.location='" + Url + "';}setTimeout('Redirect()', 2000);", true);
                return;

                BindData();
            }
            catch (Exception)
            {

            }
        }

        protected void btnAddState_Click(object sender, EventArgs e)
        {
            DivEntry.Visible = true;
            DivGridView.Visible = false;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("StateMaster.aspx");
        }
    }
}