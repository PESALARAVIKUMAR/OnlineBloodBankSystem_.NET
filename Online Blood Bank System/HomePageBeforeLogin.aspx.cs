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
            if (Session["userId"] != null)
            {
                Response.Redirect("HomePage.aspx");
            }
            DisplayBloodDonationNeeded();
            DisplayFeedbackComments();
        }
    }

    protected void GridViewBloodDonation_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Donate"))
        {
            Response.Write("<script>alert('Please Login to Donate Blood');</script>");
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

    protected void btnSearchBlood_Click(object sender, EventArgs e)
    {
        Response.Write("<script>alert('Please Login to Search');window.location.href='HomePageBeforeLogin.aspx';</script>");
    }

    protected void linkBtnLoginOrRegistration_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserLogin.aspx");
    }

    protected void linkBtnWhyBloodDonation_Click(object sender, EventArgs e)
    {
        Response.Write("<script>alert('Please Login');window.location.href='HomePageBeforeLogin.aspx'</script>");
    }

    protected void linkBtnTips_Click(object sender, EventArgs e)
    {
        Response.Write("<script>alert('Please Login');window.location.href='HomePageBeforeLogin.aspx'</script>");
    }

    protected void linkBtnDonateBlood_Click(object sender, EventArgs e)
    {
        Response.Write("<script>alert('Please Login to Donate Blood');window.location.href='HomePageBeforeLogin.aspx'</script>");
    }

    protected void linkBtnNotifications_Click(object sender, EventArgs e)
    {
        Response.Write("<script>alert('Please Login to see Notifications');window.location.href='HomePageBeforeLogin.aspx'</script>");
    }

    protected void linkFAQ_Click(object sender, EventArgs e)
    {
        Response.Write("<script>alert('Please Login to Raise any Query');window.location.href='HomePageBeforeLogin.aspx'</script>");
    }
}