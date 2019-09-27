using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using DAO;
using System.Configuration;
using System.Web.Configuration;
using System.Web.Security;


public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {            

        }
    }
    protected void loginButton_Click(object sender, EventArgs e)
    {
        try
        {
            UserBL userBL = new UserBL();
            string adminUserName = WebConfigurationManager.AppSettings["Admin1_UserId"];
            string adminPassword = WebConfigurationManager.AppSettings["Admin1_Password"];
            if (userIdText.Text.Equals(adminUserName) && passwordText.Text.Equals(adminPassword))
            {
                Response.Redirect("AdminHomePage.aspx");
            }
            else
            {
                if (userBL.UserExist(userIdText.Text) == 0)
                {
                    loginLabel.Text = "Invalid Credentials";
                    userIdText.Text = "";
                    passwordText.Text = "";
                    userIdText.Focus();
                }
                else
                {
                    User userDetails = userBL.GetUser(userIdText.Text);
                    if (userDetails.Password == userBL.EncryptPassword(passwordText.Text))
                    {
                        Session[Constants.userId] = userDetails.Id.ToString();
                        Session[Constants.userEmail] = userDetails.Email;
                        loginLabel.Text = "";
                        FormsAuthentication.RedirectFromLoginPage("HomePage.aspx", false); // false --> Not to store user in cookies 
                    }
                    else
                    {
                        loginLabel.Text = "Invalid Credentials";
                        userIdText.Text = "";
                        passwordText.Text = "";
                        userIdText.Focus();
                    }

                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Enter Valid UserEmail,Password');window.location.href='UserLogin.aspx';</script>");
        }
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
            userIdText.Text = "";
            passwordText.Text = "";
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserRegistration.aspx");
    }
}