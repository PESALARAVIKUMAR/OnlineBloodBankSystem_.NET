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
                lblUserId.Visible = false;
                Session[Constants.userId] = lblUserId.Text;

                string bloodPostingId = Request.QueryString[Constants.id].ToString();
                Session["bloodPostingId"] = bloodPostingId;

                BloodBL bl = new BloodBL();
                UserBL userBL = new UserBL();

                if (int.Parse(bloodPostingId) != 0)
                {
                    BloodPosting bp = bl.GetBloodPosting(int.Parse(bloodPostingId));
                    User userDetails = userBL.GetUser(Session[Constants.userEmail].ToString());
                    if (!bp.BloodGroup.Equals(userDetails.BloodGroup))
                    {
                        Response.Write("<script>alert('Posted Blood not matched with your Blood. Please Choose other to Donate Blood');window.location.href='HomePage.aspx'</script>");
                    }

                }
                panelMyLocation.Visible = false;
                panelOtherLocation.Visible = false;

                /*
                List<string> states = bl.GetAllStates();
                ddlStateOtherLocation.DataSource = states;
                ddlStateOtherLocation.DataBind();
                */
                ddlStateOtherLocation.Items.Add("Andhra Pradesh");
                ddlStateOtherLocation.Items.Insert(0, "Select State");                

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Your session expired...Please login again');window.location.href='HomePageBeforeLogin.aspx'</script>");
            }
        }
    }

    protected void btnMyLocationSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            BloodAvailability ba = new BloodAvailability();
            ba.State = txtStateMyLocation.Text;
            ba.Area = txtAreaMyLocation.Text;
            ba.Pincode = int.Parse(txtPincodeMyLocation.Text);
            ba.BloodGroup = txtBloodGroupMyLocation.Text;
            ba.ContactNumber = long.Parse(txtContactNumberMyLocation.Text);

            Hospital h = new Hospital();
            h.State = txtStateMyLocation.Text;
            h.Area = txtAreaMyLocation.Text;
            h.HospitalName = ddlHospitalMyLocation.SelectedItem.Text;
            
            if (txtDateMyLocation.Text != "" || txtDateMyLocation.Text != null)
            {
                if (DateTime.Compare(DateTime.Parse(txtDateMyLocation.Text), DateTime.Now) < 0)
                {
                    //lblDateMyLocation.Text = "* Select Future Date";
                    Response.Write("<script>alert('Select future date');</script>");
                    txtDateMyLocation.Text = "";
                    txtDateMyLocation.Focus();
                }
                else
                {
                    lblDateMyLocation.Text = "";
                }
            }
            
            h.Date = DateTime.Parse(txtDateMyLocation.Text);
            h.Time = txtTimeMyLocation.Text;

            BloodBL bl = new BloodBL();
            int userId = int.Parse(Session[Constants.userId].ToString());
            int donateResult = bl.DonateBlood(ba, userId);
            int hospitalResult = bl.SaveHospital(h, userId);
            if (donateResult + hospitalResult == 2)
            {
                string bloodPostingId = Request.QueryString[Constants.id].ToString();
                bl.RemoveBloodPosting(int.Parse(bloodPostingId));
                Response.Write("<script>alert('You saved a Life! Thank you...');window.location.href='HomePage.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('Failed to Save Blood Details...Try Again');window.location.href='DonateBlood_and_BookHospital.aspx';</script>");
            }
        }
        catch (TypeInitializationException ex)
        {
            Response.Write("<script>alert('Date should be in MM/dd/yyyy format');</script>");
        }
        catch(Exception ex)
        {

        }
    }


    protected void radioMyLocation_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            if (radioMyLocation.Checked == true)
            {
                radioOtherLocation.Checked = false;
                panelOtherLocation.Visible = false;
                panelMyLocation.Visible = true;

                UserBL userBL = new UserBL();
                BloodBL bl = new BloodBL();
                User userDetails = userBL.GetUser(Session[Constants.userEmail].ToString());
                txtStateMyLocation.Text = userDetails.State;
                txtAreaMyLocation.Text = userDetails.Area;
                txtPincodeMyLocation.Text = userDetails.Pincode.ToString();
                txtBloodGroupMyLocation.Text = userDetails.BloodGroup;
                txtContactNumberMyLocation.Text = userDetails.ContactNumber.ToString();
                List<string> hospitals = bl.GetHospitalsByStateArea(userDetails.State, userDetails.Area);
                ddlHospitalMyLocation.DataSource = hospitals;
                ddlHospitalMyLocation.DataBind();
                ddlHospitalMyLocation.Items.Insert(0, "Select Hospital");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Your session expired...Please login again');window.location.href='HomePageBeforeLogin.aspx'</script>");
        }

    }

    protected void btnCancelMyLocation_Click(object sender, EventArgs e)
    {
        try
        {
            txtContactNumberMyLocation.Text = "";
            ddlHospitalMyLocation.SelectedIndex = -1;
            txtDateMyLocation.Text = "";
            txtTimeMyLocation.Text = "";
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
    }

    protected void btnBackMyLocation_Click(object sender, EventArgs e)
    {
        Response.Redirect("HomePage.aspx");
    }


    protected void radioOtherLocation_CheckedChanged(object sender, EventArgs e)
    {
        if (radioOtherLocation.Checked == true)
        {
            radioMyLocation.Checked = false;
            panelMyLocation.Visible = false;
            panelOtherLocation.Visible = true;

            UserBL userBL = new UserBL();
            User userDetails = userBL.GetUser(Session[Constants.userEmail].ToString());
            txtBloodGroupOtherLocation.Text = userDetails.BloodGroup;
        }
    }

    protected void btnOtherLocationSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            UserBL userBL = new UserBL();
            BloodBL bl = new BloodBL();
            User userDetails = userBL.GetUser(Session["userEmail"].ToString());
            BloodAvailability ba = new BloodAvailability();
            ba.State = ddlStateOtherLocation.SelectedItem.Text;
            ba.Area = ddlAreaOtherLocation.SelectedItem.Text;
            ba.Pincode = int.Parse(txtPincodeOtherLocation.Text);
            ba.BloodGroup = txtBloodGroupOtherLocation.Text;
            ba.ContactNumber = long.Parse(txtContactNumber.Text);

            Hospital h = new Hospital();
            h.HospitalName = ddlHospitalOtherLocation.SelectedItem.Text;
            h.State = ddlStateOtherLocation.SelectedItem.Text;
            h.Area = ddlAreaOtherLocation.SelectedItem.Text;
            if (txtDateOtherLocation.Text != "" || txtDateOtherLocation.Text != null)
            {
                if (DateTime.Compare(DateTime.Parse(txtDateOtherLocation.Text), DateTime.Now) < 0)
                {
                    //lblDateMyLocation.Text = "* Select Future Date";
                    Response.Write("<script>alert('Select future date');</script>");
                    txtDateOtherLocation.Text = "";
                    txtDateOtherLocation.Focus();
                }
                else
                {
                    lblDateOtherLocation.Text = "";
                }
            }
            h.Date = DateTime.Parse(txtDateOtherLocation.Text);
            h.Time = txtTimeOtherLocation.Text;

            int userId = int.Parse(Session[Constants.userId].ToString());
            int donateResult = bl.DonateBlood(ba, userId);
            int hospitalResult = bl.SaveHospital(h, userId);

            if (donateResult + hospitalResult == 2)
            {
                Response.Write("<script>alert('You saved a Life! Thank you...');window.location.href='HomePage.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('Failed to Save Blood Details...Try Again');window.location.href='DonateBlood.aspx';</script>");
            }
        }
        catch (TypeInitializationException ex)
        {
            Response.Write("<script>alert('Date should be in MM/dd/yyyy format');</script>");
        }
        catch (Exception ex)
        {

        }
    }

    protected void btnCancelOtherLocation_Click(object sender, EventArgs e)
    {
        try
        {
            ddlStateOtherLocation.SelectedIndex = -1;
            ddlAreaOtherLocation.SelectedIndex = -1;
            txtPincodeOtherLocation.Text = "";
            txtContactNumber.Text = "";
            ddlHospitalOtherLocation.SelectedIndex = -1;
            txtDateOtherLocation.Text = "";
            txtTimeOtherLocation.Text = "";
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
    }

    protected void ddlStateOtherLocation_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlAreaOtherLocation.Items.Clear();
        /*
        BloodBL bl = new BloodBL();
        List<string> areas = bl.GetAreasByState(ddlStateOtherLocation.SelectedItem.Text);
        ddlAreaOtherLocation.DataSource = areas;
        ddlAreaOtherLocation.DataBind();
        */
        ddlAreaOtherLocation.Items.Add("Anantapur");
        ddlAreaOtherLocation.Items.Add("Chittor");
        ddlAreaOtherLocation.Items.Insert(0, "Select Area");
    }

    protected void ddlAreaOtherLocation_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlHospitalOtherLocation.Items.Clear();        
        BloodBL bl = new BloodBL();
        List<string> hospitals = bl.GetHospitalsByStateArea(ddlStateOtherLocation.SelectedItem.Text, ddlAreaOtherLocation.SelectedItem.Text);
        ddlHospitalOtherLocation.DataSource = hospitals;
        ddlHospitalOtherLocation.DataBind();
        /*
        ddlHospitalOtherLocation.Items.Add("Global-ANTPR");
        ddlHospitalOtherLocation.Items.Add("Global-CHTR");
        ddlHospitalOtherLocation.Items.Add("Appolo-ANTPR");
        ddlHospitalOtherLocation.Items.Add("Appolo-CHTR");
        */
        ddlHospitalOtherLocation.Items.Insert(0, "Select Hospital");
    }

    protected void btnBackOtherLocation_Click(object sender, EventArgs e)
    {
        Response.Redirect("HomePage.aspx");
    }

    protected void linkBtnDonateBlood_Click(object sender, EventArgs e)
    {
        Response.Redirect("DonateBlood_and_BookHospital.aspx?id=0");
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

    protected void txtDateOtherLocation_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (DateTime.Compare(DateTime.Parse(txtDateOtherLocation.Text), DateTime.Now) < 0)
            {
                lblDateOtherLocation.Text = "* Select Future Date";
                //Response.Write("<script>alert('Select future date');</script>");
                //txtDateOtherLocation.Text = "";
                txtDateOtherLocation.Focus();
            }
            else
            {
                lblDateOtherLocation.Text = "";
            }
        }
        catch(Exception ex)
        {
            lblDateOtherLocation.Text = "* Date should be in MM/dd/yyyy format";
        }
    }

    protected void txtDateMyLocation_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (txtDateMyLocation.Text != "" || txtDateMyLocation.Text != null)
            {
                if (DateTime.Compare(DateTime.Parse(txtDateMyLocation.Text), DateTime.Now) < 0)
                {
                    lblDateMyLocation.Text = "* Select Future Date";
                    //Response.Write("<script>alert('Select future date');</script>");
                    //txtDateMyLocation.Text = "";
                    txtDateMyLocation.Focus();
                }
                else
                {
                    lblDateMyLocation.Text = "";
                }
            }
        }
        catch (Exception ex)
        {
            lblDateMyLocation.Text = "* Date should be in MM/dd/yyyy format";
        }
    }
}