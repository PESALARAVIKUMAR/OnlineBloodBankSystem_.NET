<%@ Page Title="" Language="C#" MasterPageFile="~/BloodBankMasterPage.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">

    </script>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="header">
        <table class="pre-header-table">
            <tr>
                <td class="header-td">
                    <asp:ImageButton ID="imgBtnHome" ImageUrl="~/images/HomeButton.png" runat="server" OnClick="linkBtnHome_Click" Text="Home" Height="22px" Width="28px"/><br />
                    <asp:LinkButton ID="linkBtnHome" runat="server" NavigateUrl="~/HomePageBeforeLogin.aspx" Font-Underline="false" CssClass="header-a" OnClick="linkBtnHome_Click">Home</asp:LinkButton>
                </td>
                <td class="header-td">
                    <asp:LinkButton ID="linkBtnWhyBloodDonation" runat="server" Font-Underline="false" CssClass="header-a" OnClick="linkBtnWhyBloodDonation_Click">Why Blood Donation</asp:LinkButton>
                </td>
                <td class="header-td">
                    <asp:LinkButton ID="linkBtnTips" runat="server" Font-Underline="false" CssClass="header-a" OnClick="linkBtnTips_Click">Tips on Blood Donation</asp:LinkButton>
                </td>
                <td class="header-td">
                    <asp:LinkButton ID="linkBtnDonateBlood" runat="server" Font-Underline="false" CssClass="header-a" OnClick="linkBtnDonateBlood_Click">Donate Blood</asp:LinkButton>
                </td>
                <td class="header-td">
                    <asp:LinkButton ID="linkBtnNotifications" runat="server" Font-Underline="false" CssClass="header-a" OnClick="linkBtnNotifications_Click">Notifications</asp:LinkButton>
                </td>
                <td class="header-td">
                    <asp:LinkButton ID="linkFAQ" runat="server" Font-Underline="false" CssClass="header-a" OnClick="linkFAQ_Click">FAQ</asp:LinkButton>
                </td>
                <td class="header-td">
                    <asp:LinkButton ID="linkLogout" runat="server" Font-Underline="false" CssClass="header-a" OnClick="linkLogout_Click">Logout</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>

    <asp:Label ID="lblUserId" runat="server" Text=""></asp:Label>
    <div class="content">
        <h3 class="content-search-h3">Please enter Blood Donation Experience</h3>
        <br />



        <table class="content-form-table">
            <tr>
                <td class="header-td header-td-field"><strong><em>State</em></strong>&nbsp; </td>


                <td class="header-td">
                    <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True" CssClass="dropdownList" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td class="header-td header-td-validator">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlState" ErrorMessage="* State Required" InitialValue="Select State" ValidationGroup="FeedbackValidations"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="header-td header-td-field"><strong><em>Area</em></strong>&nbsp; </td>


                <td class="header-td">
                    <asp:DropDownList ID="ddlArea" runat="server" AutoPostBack="True" CssClass="dropdownList" OnSelectedIndexChanged="ddlArea_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td class="header-td header-td-validator">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlArea" ErrorMessage="* Area Required" InitialValue="Select Area" ValidationGroup="FeedbackValidations"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="header-td header-td-field"><strong><em>Hospital Name</em></strong></td>


                <td class="header-td">
                    <asp:DropDownList ID="ddlHospital" runat="server" AutoPostBack="True" CssClass="dropdownList">
                    </asp:DropDownList>
                </td>
                <td class="header-td header-td-validator">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlHospital" ErrorMessage="* Hospital Name Required" InitialValue="Select Hospital" ValidationGroup="FeedbackValidations"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="header-td header-td-field"><strong><em>Feedback Comments</em></strong></td>


                <td class="header-td">
                    <asp:TextBox ID="txtFeedback" CssClass="textbox" runat="server"></asp:TextBox>
                </td>
                <td class="header-td header-td-validator">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Feedback Comments Required" ForeColor="Red" ControlToValidate="txtFeedback" ValidationGroup="FeedbackValidations"></asp:RequiredFieldValidator>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="header-td">&nbsp;</td>
                <td class="header-td">

                    <asp:Button ID="btnFeedback" runat="server" CssClass="textbox-button" Text="Submit" OnClick="btnFeedback_Click" ValidationGroup="FeedbackValidations" />

                &nbsp;<asp:Button ID="btnClear" runat="server" CssClass="textbox-button" OnClick="btnClear_Click" Text="Clear" />

                </td>
                <td class="header-td">&nbsp;</td>
            </tr>
        </table>
    </div>

    <div class="footer">
        <h3 class="footer-copyright">Copyright &copy; 2019</h3>
    </div>
</asp:Content>


