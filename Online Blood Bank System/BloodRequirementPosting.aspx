<%@ Page Title="" Language="C#" MasterPageFile="~/BloodBankMasterPage.master" AutoEventWireup="true" CodeFile="BloodRequirementPosting.aspx.cs" Inherits="_Default" %>

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
        <asp:label id="lblUserId" runat="server" text=""></asp:label>
        <h2 class="content-search-h3">Blood Requirement Posting</h2>
        <div class="content">
            <table class="content-form-table">
                <tr>
                    <td></td>
                    <td></td>
                    <td><asp:Button ID="Button1" runat="server" CssClass="textbox-button" OnClick="btnBack_Click" Text="Back" /></td>
                </tr>
                <tr>
                    <td class="header-td header-td-field"><strong>State:</strong></td>
                    <td class="header-td">
                        <asp:dropdownlist id="ddlState" runat="server" autopostback="True" cssclass="dropdownList" onselectedindexchanged="ddlState_SelectedIndexChanged">
                        </asp:dropdownlist>
                    </td>
                    <td class="header-td header-td-validator">
                        <strong>
                            <asp:requiredfieldvalidator id="RequiredFieldValidator8" runat="server" controltovalidate="ddlState"
                                cssclass="auto-style3" errormessage="*State Required" initialvalue="Select State" ValidationGroup="BloodRequirementPostingValidations"></asp:requiredfieldvalidator>
                        </strong>
                        
                    </td>
                </tr>

                <tr>
                    <td class="header-td header-td-field"><strong>Area:</strong></td>
                    <td class="header-td">
                        <asp:dropdownlist id="ddlArea" cssclass="dropdownList" runat="server">
                        </asp:dropdownlist>
                    </td>
                    <td class="header-td header-td-validator">
                        <strong>
                            <asp:requiredfieldvalidator id="RequiredFieldValidator9" runat="server" controltovalidate="ddlArea"
                                errormessage="*Area Required" initialvalue="Select Area" ValidationGroup="BloodRequirementPostingValidations"></asp:requiredfieldvalidator>
                        </strong>
                    </td>
                </tr>

                <tr>
                    <td class="header-td header-td-field"><strong>Pincode:</strong></td>
                    <td class="header-td">
                        <asp:textbox id="txtPincode" runat="server" cssclass="textbox"></asp:textbox>
                    </td>
                    <td class="header-td header-td-validator">
                        <strong>
                            <asp:requiredfieldvalidator id="RequiredFieldValidator12" runat="server" errormessage="*Pincode Required" controltovalidate="txtPincode" ValidationGroup="BloodRequirementPostingValidations"></asp:requiredfieldvalidator>
                            <br />
                            <asp:regularexpressionvalidator id="RegularExpressionValidator9" runat="server" cssclass="auto-style3" errormessage="*Pincode Must be Numeric and 6 digits" validationexpression="[0-9]{6}" controltovalidate="txtPincode" ValidationGroup="BloodRequirementPostingValidations"></asp:regularexpressionvalidator>
                        </strong>
                    </td>
                </tr>

                <tr>
                    <td class="header-td header-td-field"><strong>Blood Group:</strong></td>
                    <td class="header-td">
                        <asp:dropdownlist id="ddlBloodGroup" cssclass="dropdownList" runat="server">
                        </asp:dropdownlist>
                    </td>
                    <td class="header-td header-td-validator">
                        <strong>
                            <asp:requiredfieldvalidator id="RequiredFieldValidator11" runat="server" errormessage="*Blood group required" controltovalidate="ddlBloodGroup" initialvalue="Select Blood Group" ValidationGroup="BloodRequirementPostingValidations"></asp:requiredfieldvalidator>
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td class="header-td header-td-field"><strong>Contact Number:</strong></td>
                    <td class="header-td">
                        <asp:textbox id="txtPhnNumber" cssclass="textbox" runat="server"></asp:textbox>
                    </td>
                    <td class="header-td header-td-validator">
                        <strong>
                            <asp:requiredfieldvalidator id="RequiredFieldValidator4" runat="server" controltovalidate="txtPhnNumber"
                                errormessage="*Contact Number  Required" cssclass="auto-style3" ValidationGroup="BloodRequirementPostingValidations"></asp:requiredfieldvalidator>
                            <br />
                            <asp:regularexpressionvalidator id="RegularExpressionValidator4" runat="server"
                                errormessage="*Contact Number should be 10 digits and start from 6 to 9" controltovalidate="txtPhnNumber" validationexpression="[6-9]{1}[0-9]{9}" ValidationGroup="BloodRequirementPostingValidations"></asp:regularexpressionvalidator>
                        </strong>
                    </td>
                </tr>

                <tr>
                    <td class="header-td">
                        
                    </td>
                    <td class="header-td">
                        <asp:button id="btnSubmit" runat="server" cssclass="textbox-button" text="Submit" onclick="btnSubmit_Click" ValidationGroup="BloodRequirementPostingValidations" />
                    &nbsp;<asp:Button ID="btnClear" runat="server" CssClass="textbox-button" OnClick="btnClear_Click" Text="Clear" />
                    </td>
                    <td class="header-td"></td>
                </tr>

            </table>
        </div>
        <div class="footer">
            <h3 class="footer-copyright">Copyright &copy; 2019</h3>
        </div>
</asp:Content>


