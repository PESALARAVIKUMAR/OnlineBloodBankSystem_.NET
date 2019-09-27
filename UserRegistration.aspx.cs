using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using DAO;
using System.Web.Security;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                BloodBL bl = new BloodBL();
                UserBL userBL = new UserBL();
                /*
                List<string> states = bl.GetAllStates();
                ddlState.DataSource = states;
                ddlState.DataBind();
                */
                ddlState.Items.Add("Andhra Pradesh");
                ddlState.Items.Insert(0, "Select State");

                ddlBloodGroup.Items.Add("Select Blood Group");
                ddlBloodGroup.Items.Add("A+");
                ddlBloodGroup.Items.Add("A-");
                ddlBloodGroup.Items.Add("B+");
                ddlBloodGroup.Items.Add("B-");
                ddlBloodGroup.Items.Add("O+");
                ddlBloodGroup.Items.Add("O-");
                ddlBloodGroup.Items.Add("AB+");
                ddlBloodGroup.Items.Add("AB-");

                
                List<string> ageList = new List<string>();
                for (int i = 18; i <= 80; i++)
                {
                    ageList.Add(i.ToString());
                }
                ddlAge.DataSource = ageList;
                ddlAge.DataBind();
                ddlAge.Items.Insert(0, "Select Age");
                radioMale.Checked = true;
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('"+ex.Message+"');</script>");
            }
        }
        string pwd = txtPassword.Text;
        txtPassword.Attributes.Add("value", pwd);
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            UserBL userBL = new UserBL();
            User u = new User();
            u.FirstName = txtFirstName.Text.ToString();
            u.LastName = txtLastName.Text.ToString();
            u.Age = int.Parse(ddlAge.SelectedItem.Text);
            u.Gender = radioMale.Checked == true ? "male" : "female";
            u.ContactNumber = long.Parse(txtPhnNumber.Text.ToString());
            if (txtEmail.Text.ToString() != null || txtEmail.Text.ToString() != "")
            {
                if (userBL.UserExist(txtEmail.Text.ToString()) == 1)
                {
                    Response.Write("<script>alert('Email already exist choose other');window.location.href='UserRegistration.aspx';</script>");
                    txtEmail.Text = "";
                }
            }
            u.Email = txtEmail.Text.ToString();
            Session[Constants.userEmail] = txtEmail.Text.ToString();
            u.Password = userBL.EncryptPassword(txtPassword.Text);
            u.Weight = int.Parse(txtWeight.Text.ToString());
            u.State = ddlState.SelectedValue.ToString();
            u.Area = ddlArea.SelectedValue.ToString();
            u.Pincode = int.Parse(txtPincode.Text.ToString());
            u.BloodGroup = ddlBloodGroup.SelectedValue.ToString();
            int result = userBL.SaveUser(u);
            if (result > 0)
            {
                Response.Write("<script>alert('New user created successfully');window.location.href='UserLogin.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('Error in saving user...please try again');window.location.href='UserRegistration.aspx';</script>");
            }

        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('Error in Saving User');window.location.href='UserRegistration.aspx';</script>");
        }
    }

    protected void radioMale_CheckedChanged(object sender, EventArgs e)
    {
        if (radioMale.Checked == true)
        {
            radioFemale.Checked = false;
        }
    }

    protected void radioFemale_CheckedChanged(object sender, EventArgs e)
    {
        if (radioFemale.Checked == true)
        {
            radioMale.Checked = false;
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
        if (ddlState.SelectedItem.Text == "Andhra Pradesh")
        {
            ddlArea.Items.Add("Anantapur");
            ddlArea.Items.Add("Chittor");
        }
        ddlArea.Items.Insert(0, "Select Area");
    }


    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            ddlAge.SelectedIndex = 0;
            txtPhnNumber.Text = "";
            txtEmail.Text = "";
            txtWeight.Text = "";
            ddlState.SelectedIndex = -1;
            ddlArea.SelectedIndex = -1;
            txtPincode.Text = "";
            ddlBloodGroup.SelectedIndex = 0;
            txtPassword.Text = "";
            lblEmailMessage.Text = "";
            lblContactNumberMessage.Text = "";
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
    }

    protected void txtEmail_TextChanged(object sender, EventArgs e)
    {
        try
        {
            UserBL userBL = new UserBL();
            if (txtEmail.Text.ToString() != null || txtEmail.Text.ToString() != "")
            {
                if (userBL.UserExist(txtEmail.Text.ToString()) == 1)
                {
                    //Response.Write("<script>alert('Email already exist choose other');</script>");
                    lblEmailMessage.Text = "Email already exist choose other";
                    txtEmail.Text = "";
                    txtEmail.Focus();
                }
                else
                {
                    lblEmailMessage.Text = "";
                    lblContactNumberMessage.Text = "";
                }
            }
        }
        catch(Exception ex)
        {
            lblContactNumberMessage.Text = "";
        }
    }

    protected void txtPhnNumber_TextChanged(object sender, EventArgs e)
    {
        try
        {
            UserBL userBL = new UserBL();
            if (txtPhnNumber.Text.ToString() != null || txtPhnNumber.Text.ToString() != "")
            {
                if (userBL.UserExist(long.Parse(txtPhnNumber.Text.ToString())) == 1)
                {
                    //Response.Write("<script>alert('Contact Number already exist choose other');</script>");
                    lblContactNumberMessage.Text = "Contact Number already exist choose other";
                    txtPhnNumber.Text = "";
                    txtPhnNumber.Focus();
                }
                else
                {
                    lblContactNumberMessage.Text = "";
                }
            }
        }
        catch (Exception ex)
        {
            lblContactNumberMessage.Text = "Contact Number should be digits";
        }
    }

    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserLogin.aspx");
    }
}