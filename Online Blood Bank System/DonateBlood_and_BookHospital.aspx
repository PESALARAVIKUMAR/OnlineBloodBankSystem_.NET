<%@ Page Title="" Language="C#" MasterPageFile="~/BloodBankMasterPage.master" AutoEventWireup="true" CodeFile="DonateBlood_and_BookHospital.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">

    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="header">
        <table class="pre-header-table">
            <tr>
                <td class="header-td">
                    <asp:ImageButton ID="imgBtnHome" ImageUrl="~/images/HomeButton.png" runat="server" OnClick="linkBtnHome_Click" Text="Home" Height="22px" Width="28px" /><br />
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

        <table class="content-form-table">
            <tr>
                <td class="header-td">
                    <h3 class="content-search-h3">Donate Blood</h3>
                </td>
                <td class="header-td">
                    <asp:RadioButton ID="radioMyLocation" runat="server" AutoPostBack="True" ForeColor="Red" OnCheckedChanged="radioMyLocation_CheckedChanged" Text="Same Location" />
                </td>
                <td class="header-td">
                    <asp:RadioButton ID="radioOtherLocation" runat="server" AutoPostBack="True" ForeColor="Red" OnCheckedChanged="radioOtherLocation_CheckedChanged" Text="Other Location" />
                </td>
            </tr>
        </table>

        <asp:Panel ID="panelOtherLocation" runat="server">
            <table class="content-form-table">
                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <asp:Button ID="btnBackMyLocation" runat="server" CssClass="textbox-button" OnClick="btnBackMyLocation_Click" Text="Back" />
                    </td>
                </tr>
                <tr>
                    <td class="header-td header-td-field"><strong><em>State</em></strong></td>


                    <td class="header-td">
                        <asp:DropDownList ID="ddlStateOtherLocation" runat="server" CssClass="dropdownList" AutoPostBack="True" OnSelectedIndexChanged="ddlStateOtherLocation_SelectedIndexChanged" BackColor="#FFFF99">
                        </asp:DropDownList>
                    </td>
                    <td class="header-td header-td-validator">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlStateOtherLocation"
                            ErrorMessage="* State Required" ForeColor="Red" InitialValue="Select State" ValidationGroup="OtherLocationValidations"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="header-td header-td-field"><strong><em>Area</em></strong></td>


                    <td class="header-td">
                        <asp:DropDownList ID="ddlAreaOtherLocation" CssClass="dropdownList" runat="server" AutoPostBack="True" BackColor="#FFFF99" OnSelectedIndexChanged="ddlAreaOtherLocation_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td class="header-td header-td-validator">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlAreaOtherLocation"
                            ErrorMessage="* Area Required" ForeColor="Red" InitialValue="Select Area" ValidationGroup="OtherLocationValidations"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="header-td header-td-field"><strong><em>Pincode</em></strong></td>


                    <td class="header-td">
                        <asp:TextBox ID="txtPincodeOtherLocation" CssClass="textbox" runat="server" BorderColor="#009933"></asp:TextBox>
                    </td>
                    <td class="header-td header-td-validator">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPincodeOtherLocation"
                            ErrorMessage="* Pincode Required" ForeColor="Red" ValidationGroup="OtherLocationValidations"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPincodeOtherLocation"
                            ErrorMessage="* Pincode must be 6 digit number" ForeColor="Red" ValidationExpression="[0-9]{6}" ValidationGroup="OtherLocationValidations"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="header-td header-td-field"><strong><em>Blood Group</em></strong></td>


                    <td class="header-td">
                        <asp:TextBox ID="txtBloodGroupOtherLocation" runat="server" CssClass="textbox" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td class="header-td header-td-validator"></td>
                </tr>
                <tr>
                    <td class="header-td header-td-field"><strong><em>Hospital Name</em></strong></td>
                    <td class="header-td">
                        <asp:DropDownList ID="ddlHospitalOtherLocation" runat="server" AutoPostBack="True" CssClass="dropdownList" BackColor="#FFFF99">
                        </asp:DropDownList>
                    </td>
                    <td class="header-td header-td-validator">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlHospitalOtherLocation" ErrorMessage="* Hospital Name Required" ForeColor="Red" ValidationGroup="OtherLocationValidations" InitialValue="Select Hospital"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="header-td header-td-field"><strong><em>Date</em></strong></td>

                    <td class="header-td">
                        <asp:TextBox ID="txtDateOtherLocation" CssClass="textbox" runat="server" ToolTip="MM/dd/yyyy" TextMode="Date" BorderColor="#009933" OnTextChanged="txtDateOtherLocation_TextChanged"></asp:TextBox>
                        <br />
                    </td>
                    <td class="header-td header-td-validator">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="* Date Required" ForeColor="Red" ControlToValidate="txtDateOtherLocation" ValidationGroup="OtherLocationValidations"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="lblDateOtherLocation" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="header-td header-td-field"><em><strong>Time</strong></em></td>

                    <td class="header-td">
                        <asp:TextBox ID="txtTimeOtherLocation" runat="server" CssClass="textbox" TextMode="Time" BorderColor="#009933"></asp:TextBox>
                    </td>
                    <td class="header-td header-td-validator">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="* Time Required" ForeColor="Red" ControlToValidate="txtTimeOtherLocation" ValidationGroup="OtherLocationValidations"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtTimeOtherLocation" ErrorMessage="* Time must be HH:MM format" ForeColor="Red" ValidationExpression="(0[0-9]|1[0-9]|2[0-3]|[0-9]):[0-5][0-9]" ValidationGroup="OtherLocationValidations"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="header-td header-td-field"><strong><em>Contact Number</em></strong></td>

                    <td class="header-td">
                        <asp:TextBox ID="txtContactNumber" CssClass="textbox" runat="server" BorderColor="#009933"></asp:TextBox>
                    </td>

                    <td class="header-td header-td-validator">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtContactNumber"
                            ErrorMessage="* Contact Number Required" ForeColor="Red" ValidationGroup="OtherLocationValidations"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtContactNumber"
                            ErrorMessage="*Contact Number should be 10 digits and start from 6 to 9" ForeColor="Red" ValidationExpression="[6-9]{1}[0-9]{9}" ValidationGroup="OtherLocationValidations"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="header-td"></td>


                    <td class="header-td">
                        <asp:Button ID="btnSubmitOtherLocation" runat="server" Text="Submit" CssClass="textbox-button" OnClick="btnOtherLocationSubmit_Click" ValidationGroup="OtherLocationValidations" />
                        &nbsp;
                    <asp:Button ID="btnCancelOtherLocation" runat="server" CssClass="textbox-button" OnClick="btnCancelOtherLocation_Click" Text="Reset" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="panelMyLocation" runat="server">
            <table class="content-form-table">
                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <asp:Button ID="btnBackOtherLocation" runat="server" CssClass="textbox-button" OnClick="btnBackOtherLocation_Click" Text="Back" />
                    </td>
                </tr>
                <tr>
                    <td class="header-td header-td-field"><strong><em>State</em></strong></td>
                    <td class="header-td">
                        <asp:TextBox ID="txtStateMyLocation" runat="server" CssClass="textbox" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td class="header-td header-td-validator"></td>
                </tr>
                <tr>
                    <td class="header-td header-td-field"><strong><em>Area</em></strong></td>


                    <td class="header-td">
                        <asp:TextBox ID="txtAreaMyLocation" runat="server" CssClass="textbox" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td class="header-td header-td-validator">&nbsp;</td>
                </tr>
                <tr>
                    <td class="header-td header-td-field"><strong><em>Pincode</em></strong></td>


                    <td class="header-td">
                        <asp:TextBox ID="txtPincodeMyLocation" CssClass="textbox" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td class="header-td header-td-validator">
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="header-td header-td-field"><strong><em>Blood Group</em></strong></td>


                    <td class="header-td">
                        <asp:TextBox ID="txtBloodGroupMyLocation" runat="server" CssClass="textbox" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td class="header-td header-td-validator">&nbsp;</td>
                </tr>
                <tr>
                    <td class="header-td header-td-field"><strong><em>Hospital Name</em></strong></td>
                    <td class="header-td">
                        <asp:DropDownList ID="ddlHospitalMyLocation" runat="server" AutoPostBack="True" CssClass="dropdownList" BackColor="#FFFF99">
                        </asp:DropDownList>
                    </td>
                    <td class="header-td header-td-validator">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlHospitalMyLocation" ErrorMessage="* Hospital Name Required" ForeColor="Red" ValidationGroup="MyLocationValidations" InitialValue="Select Hospital"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="header-td header-td-field"><strong><em>Date</em></strong></td>

                    <td class="header-td">
                        <asp:TextBox ID="txtDateMyLocation" CssClass="textbox" runat="server" ToolTip="MM/dd/yyyy" TextMode="Date" BorderColor="#009933" OnTextChanged="txtDateMyLocation_TextChanged"></asp:TextBox>
                        <br />
                    </td>
                    <td class="header-td header-td-validator">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="* Date Required" ForeColor="Red" ControlToValidate="txtDateMyLocation" ValidationGroup="MyLocationValidations"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="lblDateMyLocation" runat="server"></asp:Label>
                        <br />
                    </td>
                </tr>               
                
                <tr>
                    <td class="header-td header-td-field"><em><strong>Time</strong></em></td>

                    <td class="header-td">
                        <asp:TextBox ID="txtTimeMyLocation" runat="server" CssClass="textbox" TextMode="Time" BorderColor="#009933"></asp:TextBox>
                    </td>
                    <td class="header-td header-td-validator">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="* Time Required" ForeColor="Red" ControlToValidate="txtTimeMyLocation" ValidationGroup="MyLocationValidations"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtTimeMyLocation" ErrorMessage="* Time must be HH:MM format" ForeColor="Red" ValidationExpression="(0[0-9]|1[0-9]|2[0-3]|[0-9]):[0-5][0-9]" ValidationGroup="MyLocationValidations"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="header-td header-td-field"><strong><em>Contact Number</em></strong></td>

                    <td class="header-td">
                        <asp:TextBox ID="txtContactNumberMyLocation" CssClass="textbox" runat="server" BorderColor="#009933"></asp:TextBox>
                    </td>

                    <td class="header-td header-td-validator">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtContactNumberMyLocation"
                            ErrorMessage="* Contact Number Required" ForeColor="Red" ValidationGroup="MyLocationValidations"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtContactNumberMyLocation"
                            ErrorMessage="*Contact Number should be 10 digits and start from 6 to 9" ForeColor="Red" ValidationExpression="[6-9]{1}[0-9]{9}" ValidationGroup="MyLocationValidations"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="header-td"></td>


                    <td class="header-td">
                        <asp:Button ID="btnSubmitMyLocation" runat="server" Text="Submit" CssClass="textbox-button" OnClick="btnMyLocationSubmit_Click" ValidationGroup="MyLocationValidations" />
                        &nbsp;
                    <asp:Button ID="btnCancelMyLocation" runat="server" CssClass="textbox-button" OnClick="btnCancelMyLocation_Click" Text="Reset" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    <div class="footer">
        <h3 class="footer-copyright">Copyright &copy; 2019
    </div>
</asp:Content>

