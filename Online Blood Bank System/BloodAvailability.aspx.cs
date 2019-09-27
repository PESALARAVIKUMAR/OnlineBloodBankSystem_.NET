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
        if (!IsPostBack)
        {
            try
            {
                if(Session[Constants.userId].ToString() != null || Session[Constants.userId].ToString() != "")
                {
                    lblUserId.Text = Session[Constants.userId].ToString();
                }
                else
                {
                    throw new NullReferenceException();
                }                    
                lblUserId.Visible = false;

                bloodGroupDropDownList.Items.Add("Select");
                bloodGroupDropDownList.Items.Add("A+");
                bloodGroupDropDownList.Items.Add("A-");
                bloodGroupDropDownList.Items.Add("B+");
                bloodGroupDropDownList.Items.Add("B-");
                bloodGroupDropDownList.Items.Add("O+");
                bloodGroupDropDownList.Items.Add("O-");
                bloodGroupDropDownList.Items.Add("AB+");
                bloodGroupDropDownList.Items.Add("AB-");

                BloodBL bl = new BloodBL();
                /*
                List<string> states = bl.GetAllStates();
                stateDropDownList.DataSource = states;
                stateDropDownList.DataBind();
                */
                stateDropDownList.Items.Add("Andhra Pradesh");
                stateDropDownList.Items.Insert(0, "Select State");

                searchResultsLabel.Text = "";
                bloodRequirementsButton.Visible = false;
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('Your session expired...Please login again');window.location.href='HomePageBeforeLogin.aspx'</script>");
            }
        }

    }

    protected void DisplayData()
    {
        try
        {
            BloodBL bl = new BloodBL();
            List<BloodAvailability> baList = bl.GetAllBloodAvailabilities(stateDropDownList.SelectedValue.ToString(),
                AreaDropDownList.SelectedValue.ToString(), bloodGroupDropDownList.SelectedValue.ToString());
            if (baList.Count > 0)
            {
                BloodDonorAvailableGridView.Visible = true;
                BloodDonorAvailableGridView.DataSource = baList;
                BloodDonorAvailableGridView.DataBind();
                searchResultsLabel.Text = "";
                bloodRequirementsButton.Visible = false;
            }
            else
            {
                searchResultsLabel.Text = "Sorry, No results Found.. Post your Blood Requirements by clicking below button.";
                bloodRequirementsButton.Visible = true;
                BloodDonorAvailableGridView.Visible = false;
            }

        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }

    }

    protected void searchButton_Click(object sender, EventArgs e)
    {
        DisplayData();
    }

    protected void stateDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        AreaDropDownList.Items.Clear();
        /*
        BloodBL bl = new BloodBL();
        List<string> areas = bl.GetAreasByState(stateDropDownList.SelectedItem.Text);
        AreaDropDownList.DataSource = areas;
        AreaDropDownList.DataBind();
        */
        AreaDropDownList.Items.Add("Anantapur");
        AreaDropDownList.Items.Add("Chittor");
        AreaDropDownList.Items.Insert(0, "Select Area");

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

    protected void bloodRequirementsButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("BloodRequirementPosting.aspx");
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("HomePage.aspx");
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
            bloodGroupDropDownList.SelectedIndex = -1;
            stateDropDownList.SelectedIndex = -1;
            AreaDropDownList.SelectedIndex = -1;
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
    }
}