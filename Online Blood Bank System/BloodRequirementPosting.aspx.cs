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
                ddlBloodGroup.Items.Add("Select Blood Group");
                ddlBloodGroup.Items.Add("A+");
                ddlBloodGroup.Items.Add("A-");
                ddlBloodGroup.Items.Add("B+");
                ddlBloodGroup.Items.Add("B-");
                ddlBloodGroup.Items.Add("O+");
                ddlBloodGroup.Items.Add("O-");
                ddlBloodGroup.Items.Add("AB+");
                ddlBloodGroup.Items.Add("AB-");

                BloodBL bl = new BloodBL();
                /*
                List<string> states = bl.GetAllStates();
                ddlState.DataSource = states;
                ddlState.DataBind();
                */
                ddlState.Items.Add("Andhra Pradesh");
                ddlState.Items.Insert(0, "Select State");
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('Your session expired...Please login again');window.location.href='HomePageBeforeLogin.aspx'</script>");
            }
        }
    }

    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlArea.Items.Clear();
        /*
        BloodBL bl = new BloodBL();
        List<string> areas = bl.GetAreasByState(ddlState.SelectedItem.Text);
        ddlArea.DataSource = areas;
        ddlArea.DataBind();
        */
        ddlArea.Items.Add("Anantapur");
        ddlArea.Items.Add("Chittor");
        ddlArea.Items.Insert(0, "Select Area");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            BloodPosting blood = new BloodPosting();
            blood.State = ddlState.SelectedValue.ToString();
            blood.Area = ddlArea.SelectedValue.ToString();
            blood.Pincode = int.Parse(txtPincode.Text.ToString());
            blood.BloodGroup = ddlBloodGroup.SelectedValue.ToString();
            blood.ContactNumber = long.Parse(txtPhnNumber.Text.ToString());
            BloodBL bl = new BloodBL();
            int result = bl.PostBlood(blood, int.Parse(lblUserId.Text));
            if (result == 1)
            {
                Response.Write("<script>alert('Your blood details posted successfully');window.location.href='HomePage.aspx'</script>");
            }
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("BloodAvailability.aspx");
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
            ddlState.SelectedIndex = -1;
            ddlArea.SelectedIndex = -1;
            txtPincode.Text = "";
            ddlBloodGroup.SelectedIndex = -1;
            txtPhnNumber.Text = "";
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
}