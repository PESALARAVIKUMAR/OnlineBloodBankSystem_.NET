using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using DAO;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
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
                DisplayBloodDonationNeeded();
                DisplayFeedbackComments();
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
            BloodBL bl = new BloodBL();
            Response.Redirect("DonateBlood_and_BookHospital.aspx?id=" + id, false);
        }
    }

    protected void DisplayBloodDonationNeeded()
    {
        BloodBL bl = new BloodBL();
        List<BloodPosting> bpList = bl.GetAllBloodPostings();
        GridViewBloodNeeded.DataSource = bpList;
        GridViewBloodNeeded.DataBind();
    }

    protected void DisplayFeedbackComments()
    {
        BloodBL bl = new BloodBL();
        List<Feedback> feedbackList = bl.GetAllFeedbackComments();
        GridViewFeedbackComments.DataSource = feedbackList;
        GridViewFeedbackComments.DataBind();
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
        catch(Exception ex)
        {

        }
    }

    protected void btnSearchBlood_Click(object sender, EventArgs e)
    {
        Response.Redirect("BloodAvailability.aspx");
    }
}