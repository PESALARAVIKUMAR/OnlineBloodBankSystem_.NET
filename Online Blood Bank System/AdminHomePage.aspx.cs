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
        //lUsersOnline.Text = Application["UsersOnline"].ToString();
        if (!Page.IsPostBack)
        {
            panelBloodAvailabilities.Visible = false;
            panelResolveQueries.Visible = false;
        }
    }

    protected void btnResolveQueries_Click(object sender, EventArgs e)
    {
        try
        {
            panelBloodAvailabilities.Visible = false;
            panelResolveQueries.Visible = true;
            DisplayQueries();
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
    }

    protected void btnViewBloodAvailabilities_Click(object sender, EventArgs e)
    {
        try
        {
            panelBloodAvailabilities.Visible = true;
            panelResolveQueries.Visible = false;
            DisplayBloodAvailabilities();
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
    }

    protected void ResolvedButtonActive(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Resolved"))
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            int id = int.Parse(GridViewResolveQueries.Rows[rowIndex].Cells[0].Text);
            BloodBL bl = new BloodBL();

            string solution1 = GridViewResolveQueries.Rows[rowIndex].Cells[4].Text;
            TextBox solutionTextBox = (TextBox)GridViewResolveQueries.FindControl("txtSolution");
            //Response.Write("<script>alert('"+solution1+"');</script>");
            //Response.Write("<script>alert('" + solutionTextBox.Text + "');</script>");
            //if (bl.UpdateQuery("Resolved", solution1, id) == 1)
            if (bl.UpdateQuery("Resolved", "yet to solve", id) == 1)
            {
                Response.Write("<script>alert('Query Updated Successfully');</script>");
            }
            else
            {
                Response.Write("<script>alert('Error in Query Updating');</script>");
            }
            DisplayQueries();
        }
    }

    protected void DisplayBloodAvailabilities()
    {
        BloodBL bl = new BloodBL();
        List<BloodAvailability> baList = bl.GetAllBloodAvailabilities();
        GridViewBloodAvailabilities.DataSource = baList;
        GridViewBloodAvailabilities.DataBind();
    }

    protected void DisplayQueries()
    {
        BloodBL bl = new BloodBL();
        List<RaiseQuery> rqList = bl.GetAllQueries();
        GridViewResolveQueries.DataSource = rqList;
        GridViewResolveQueries.DataBind();
    }

}