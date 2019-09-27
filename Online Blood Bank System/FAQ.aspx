<%@ Page Title="" Language="C#" MasterPageFile="~/BloodBankMasterPage.master" AutoEventWireup="true" CodeFile="FAQ.aspx.cs" Inherits="_Default" %>

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
    <div class="content">
        <asp:Label ID="lblUserId" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <h3 class="content-search-h3 content-faq-h3">Click below button to Raise a Query for any problem</h3>
        <asp:Button ID="btnRaiseQuery" runat="server" Text="Raise a Query" CssClass="button" OnClick="btnRaiseQuery_Click" />
        <br />
        <br />
        <asp:Panel ID="panelRaiseQuery" runat="server">
            <table class="content-form-table">
                <tr>
                    <td class="header-td header-td-field"><strong><em>Query</em></strong></td>
                    <td class="header-td">
                        <asp:TextBox ID="txtQuery" CssClass="textbox" runat="server"></asp:TextBox>
                    </td>
                    <td class="header-td header-td-validator">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtQuery" ErrorMessage="* Query Required" ForeColor="Red" ValidationGroup="RaiseQueryValidations"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="header-td header-td-field"><strong><em>Description</em></strong></td>
                    <td class="header-td">
                        <asp:TextBox ID="txtDescription" CssClass="textbox" runat="server"></asp:TextBox>
                    </td>
                    <td class="header-td header-td-validator">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDescription" ErrorMessage="* Description Required" ForeColor="Red" ValidationGroup="RaiseQueryValidations"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="header-td">&nbsp;</td>
                    <td class="header-td">
                        <asp:Button ID="btnSubmitQuery" runat="server" CssClass="textbox-button" OnClick="btnSubmitQuery_Click" Text="Submit Query" ValidationGroup="RaiseQueryValidations" />
                        &nbsp;<asp:Button ID="btnReset" runat="server" CssClass="textbox-button" OnClick="btnReset_Click" Text="Reset" />
                    </td>
                    <td class="header-td">&nbsp;</td>
                </tr>
            </table>

        </asp:Panel>
    </div>
    <div class="footer">
        <h3 class="footer-copyright">Copyright &copy; 2019</h3>
    </div>
</asp:Content>


