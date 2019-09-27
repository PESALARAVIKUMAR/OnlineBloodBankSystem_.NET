using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAO;
using Model;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                lblQueries.Visible = false;
                lblPreviousDonations.Visible = false;
                lblBloodRequirements.Visible = false;
                if (Session[Constants.userId].ToString() != null || Session[Constants.userId].ToString() != "")
                {
                    lblUserId.Text = Session[Constants.userId].ToString();
                }
                else
                {
                    throw new NullReferenceException();
                }
                lblUserId.Visible = false;
                Session[Constants.userId] = lblUserId.Text;

                BloodBL bl = new BloodBL();
                List<RaiseQuery> rqList = bl.GetQueryStatus(int.Parse(lblUserId.Text));
                if (rqList.Count > 0)
                {
                    GridViewQueries.DataSource = rqList;
                    GridViewQueries.DataBind();
                }
                else
                {
                    lblQueries.Visible = true;
                    lblQueries.Text = "No Queries raised";
                }

                List<Hospital> hList = bl.AlertUserToDonateBlood(int.Parse(lblUserId.Text));
                if (hList.Count > 0)
                {
                    GridViewBloodDonations.DataSource = hList;
                    GridViewBloodDonations.DataBind();
                }
                else
                {
                    lblPreviousDonations.Visible = true;
                    lblPreviousDonations.Text = "No Blood Donations before 3 months";
                }

                List<BloodPosting> bpList = bl.AlertUserSpecificMatchBlood(int.Parse(lblUserId.Text));
                if (bpList.Count > 0)
                {
                    GridViewBloodNeeded.DataSource = bpList;
                    GridViewBloodNeeded.DataBind();
                }
                else
                {
                    lblBloodRequirements.Visible = true;
                    lblBloodRequirements.Text = "No Requirements of your blood type to donate";
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('Your session expired...Please login again');window.location.href='HomePageBeforeLogin.aspx'</script>");
            }
        }
    }

    protected void GridViewBloodDonation_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Donate"))
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            int id = int.Parse(GridViewBloodNeeded.Rows[rowIndex].Cells[0].Text);
            Response.Redirect("DonateBlood_and_BookHospital.aspx?id=" + id);
        }
    }
    protected void linkBtnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("HomePage.aspx");
    }

    protected void linkBtnWhyBloodDonation_Click(object sender, EventArgs e)
    {
        Response.Redirect("WhyBloodDonation.aspx");
    }

    protected void linkBtnTips_Click(object sender, EventArgs e)
    {
        Response.Redirect("TipsOnDonatingBlood.aspx");
    }

    protected void linkBtnDonateBlood_Click(object sender, EventArgs e)
    {
        Response.Redirect("DonateBlood_and_BookHospital.aspx?id=0");
    }

    protected void linkBtnNotifications_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserNotifications.aspx");
    }

    protected void linkFAQ_Click(object sender, EventArgs e)
    {
        Response.Redirect("FAQ.aspx");
    }

    protected void linkLogout_Click(object sender, EventArgs e)
    {
        try
        {
            Session.Abandon();
            Response.Redirect("HomePageBeforeLogin.aspx");
        }
        catch (Exception ex)
        {

        }
    }

    protected void btnFeedback_Click(object sender, EventArgs e)
    {
        Response.Redirect("Feedback.aspx");
    }
}