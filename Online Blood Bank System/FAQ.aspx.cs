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
                panelRaiseQuery.Visible = false;
            }
            catch(Exception ee)
            {
                Response.Write("<script>alert('Your session expired...Please login again');window.location.href='HomePageBeforeLogin.aspx'</script>");
            }
        }
    }

    protected void btnRaiseQuery_Click(object sender, EventArgs e)
    {
        panelRaiseQuery.Visible = true;
    }

    protected void btnSubmitQuery_Click(object sender, EventArgs e)
    {
        try
        {
            string query = txtQuery.Text;
            string description = txtDescription.Text;
            RaiseQuery raiseQuery = new RaiseQuery();
            raiseQuery.Query = query;
            raiseQuery.Description = description;
            raiseQuery.Status = "In Progress";
            raiseQuery.Result = "No Result";
            BloodBL bl = new BloodBL();
            int result = bl.RaiseQuery(raiseQuery, int.Parse(lblUserId.Text));
            if (result == 1)
            {
                Response.Write("<script>alert('Query Raised Successfully');window.location.href='FAQ.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('Error in raising query');window.location.href='FAQ.aspx';</script>");
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

    protected void btnReset_Click(object sender, EventArgs e)
    {
        try
        {
            txtQuery.Text = "";
            txtDescription.Text = "";
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
    }
}