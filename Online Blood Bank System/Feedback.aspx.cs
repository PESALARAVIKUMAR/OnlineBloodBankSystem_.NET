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
                List<string> states = bl.GetStateFromHospitalById(int.Parse(lblUserId.Text));
                ddlState.DataSource = states;
                ddlState.DataBind();
                ddlState.Items.Insert(0, "Select State");

            }
            catch(Exception ee)
            {
                Response.Write("<script>alert('Your session expired...Please login again');window.location.href='HomePageBeforeLogin.aspx'</script>");
            }
        }
    }

    protected void btnFeedback_Click(object sender, EventArgs e)
    {
        try
        {
            Feedback f = new Feedback();
            f.HospitalName = ddlHospital.SelectedItem.Text;
            f.State = ddlState.SelectedItem.Text;
            f.Area = ddlArea.SelectedItem.Text;
            f.FeedbackComments = txtFeedback.Text;
            BloodBL bl = new BloodBL();
            int result = bl.SaveFeedbackComments(f, int.Parse(lblUserId.Text));
            if (result == 1)
            {
                Response.Write("<script>alert('Thank you for Feedback');window.location.href='HomePage.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('Your feedback not saved properly... provide feedback again');window.location.href='Feedback';</script>");
            }
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
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

    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlArea.Items.Clear();
        BloodBL bl = new BloodBL();
        List<string> areas = bl.GetAreaFromHospitalByState(int.Parse(lblUserId.Text), ddlState.SelectedItem.Text);
        ddlArea.DataSource = areas;
        ddlArea.DataBind();
        ddlArea.Items.Insert(0, "Select Area");
    }

    protected void ddlArea_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlHospital.Items.Clear();
        BloodBL bl = new BloodBL();
        List<string> hospitals = bl.GetHospitalNameFromHospital(int.Parse(lblUserId.Text), ddlState.SelectedItem.Text, ddlArea.SelectedItem.Text);
        ddlHospital.DataSource = hospitals;
        ddlHospital.DataBind();
        ddlHospital.Items.Insert(0, "Select Hospital");
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
            ddlState.SelectedIndex = -1;
            ddlArea.SelectedIndex = -1;
            ddlHospital.SelectedIndex = -1;
            txtFeedback.Text = "";
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
    }
}