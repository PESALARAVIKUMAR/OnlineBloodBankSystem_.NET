<%@ Page Title="" Language="C#" EnableEventValidation="true" MasterPageFile="~/BloodBankMasterPage.master" AutoEventWireup="true" CodeFile="UserRegistration.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
    </style>
    <script>
    </script>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="header">
        <table class="pre-header-table">
            <tr>
                <td class="header-td">
                    <asp:HyperLink ID="HyperLink" runat="server" NavigateUrl="~/HomePageBeforeLogin.aspx" Font-Underline="false" CssClass="header-a">Home</asp:HyperLink>
                </td>
                <td class="header-td"></td>
                <td class="header-td"></td>
                <td class="header-td"></td>
                <td class="header-td"></td>
                <td class="header-td"></td>
                <td class="header-td"></td>
            </tr>
        </table>
    </div>
    <div class="content">
        
        <table class="content-form-table">
            <tr>
                <td colspan="3"><h2 class="content-search-h3">SIGN UP</h2></td>
            </tr>
            <tr>
                <td class="header-td header-td-field"><strong>First Name</strong></td>
                <td class="header-td">
                    <asp:TextBox ID="txtFirstName" CssClass="textbox" runat="server"></asp:TextBox>
                </td>
                <td class="header-td header-td-validator"><strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName"
                        ErrorMessage="* First Name Required " ValidationGroup="UserRegistrationValidations"></asp:RequiredFieldValidator>
                </strong>
                    <br />
                    <strong>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFirstName"
                            ErrorMessage="* First Name must be alphabetical and max length : 50" ValidationExpression="[a-z A-Z]{1,50}" ValidationGroup="UserRegistrationValidations"></asp:RegularExpressionValidator>
                    </strong></td>
            </tr>
            <tr>
                <td class="header-td header-td-field"><strong>Last Name</strong></td>
                <td class="header-td">
                    <asp:TextBox ID="txtLastName" CssClass="textbox" runat="server"></asp:TextBox>
                </td>
                <td class="header-td header-td-validator">
                    <strong>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Last Name Required"
                            ControlToValidate="txtLastName" ValidationGroup="UserRegistrationValidations"></asp:RequiredFieldValidator>
                    </strong>
                    <br />
                    <strong>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtLastName"
                            ErrorMessage="* Last Name must be alphabet and max length : 50" ValidationExpression="[a-zA-Z]{1,50}" ValidationGroup="UserRegistrationValidations"></asp:RegularExpressionValidator>
                    </strong>
                    <br />
                </td>
            </tr>

            <tr>
                <td class="header-td header-td-field"><strong>Age</strong></td>
                <td class="header-td">
                    <asp:DropDownList ID="ddlAge" runat="server" AutoPostBack="False" CssClass="dropdownList">
                    </asp:DropDownList>
                </td>
                <td class="header-td header-td-validator"><strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddlAge"
                        ErrorMessage="*Age Required" InitialValue="Select Age" ValidationGroup="UserRegistrationValidations"></asp:RequiredFieldValidator>
                </strong></td>
            </tr>
            <tr>
                <td class="header-td header-td-field"><strong>Gender</strong></td>
                <td class="header-td">
                    <asp:RadioButton ID="radioMale" runat="server" CssClass="radioButton" AutoPostBack="True" Text="Male" OnCheckedChanged="radioMale_CheckedChanged" />
                    <asp:RadioButton ID="radioFemale" runat="server" CssClass="radioButton" AutoPostBack="True" Text="Female" OnCheckedChanged="radioFemale_CheckedChanged" />
                </td>
                <td class="header-td">&nbsp;</td>
            </tr>
            <tr>
                <td class="header-td header-td-field"><strong>Contact Number</strong></td>
                <td class="header-td">
                    <asp:TextBox ID="txtPhnNumber" CssClass="textbox" runat="server" ToolTip="10 digit number" AutoPostBack="True" OnTextChanged="txtPhnNumber_TextChanged" ></asp:TextBox>
                </td>
                <td class="header-td header-td-validator">
                    <strong>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPhnNumber"
                            ErrorMessage="*Contact Number  Required" ValidationGroup="UserRegistrationValidations"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                            ErrorMessage="*Contact Number should be 10 digits and start from 6 to 9" ControlToValidate="txtPhnNumber" ValidationExpression="[6-9]{1}[0-9]{9}" ValidationGroup="UserRegistrationValidations"></asp:RegularExpressionValidator>
                    </strong></td>
            </tr>
            <tr>
                <td class="header-td"></td>
                <td class="header-td header-td-validator">
                    <asp:Label ID="lblContactNumberMessage" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="header-td header-td-field"><strong>Email</strong></td>
                <td class="header-td">
                    <asp:TextBox ID="txtEmail" CssClass="textbox" runat="server" AutoPostBack="True" OnTextChanged="txtEmail_TextChanged"></asp:TextBox>
                </td>
                <td class="header-td header-td-validator">
                    <strong>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                            ControlToValidate="txtEmail" ErrorMessage="*Email  Required" ValidationGroup="UserRegistrationValidations"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"
                            ErrorMessage="*Email Invalid" ControlToValidate="txtEmail"
                            ValidationExpression="[0-9a-zA-Z.]{1,15}[@]{1}[a-zA-Z]{1,5}[.]{1}[a-zA-Z]{2,3}" ValidationGroup="UserRegistrationValidations"></asp:RegularExpressionValidator>
                        
                    </strong></td>
            </tr>
            <tr>
                <td class="header-td"></td>
                <td class="header-td header-td-validator">
                    <asp:Label ID="lblEmailMessage" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="header-td header-td-field"><strong>Weight</strong></td>
                <td class="header-td">
                    <asp:TextBox ID="txtWeight" CssClass="textbox" runat="server"></asp:TextBox>
                </td>
                <td class="header-td header-td-validator"><strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtWeight"
                        ErrorMessage="*Weight Required" ValidationGroup="UserRegistrationValidations"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtWeight"
                        ErrorMessage="*Weight  Invalid" ValidationExpression="[1-9]{1}[0-9]{0,2}" ValidationGroup="UserRegistrationValidations"></asp:RegularExpressionValidator>
                </strong></td>
            </tr>
          
            <tr>
                <td class="header-td header-td-field"><strong>State</strong></td>
                <td class="header-td">
                    
                    <asp:DropDownList ID="ddlState" CssClass="dropdownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td class="header-td header-td-validator"><strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlState"
                        ErrorMessage="*State Required" InitialValue="Select State" ValidationGroup="UserRegistrationValidations"></asp:RequiredFieldValidator>
                </strong></td>
            </tr>
            <tr>
                <td class="header-td header-td-field"><strong>Area</strong></td>
                <td class="header-td">
                    <asp:DropDownList ID="ddlArea" CssClass="dropdownList" runat="server" AutoPostBack="True" >
                    </asp:DropDownList>
                </td>
                <td class="header-td header-td-validator"><strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlArea"
                        ErrorMessage="*Area Required" InitialValue="Select Area" ValidationGroup="UserRegistrationValidations"></asp:RequiredFieldValidator>
                </strong></td>
            </tr>
              
            <tr>
                <td class="header-td header-td-field"><strong>Pincode</strong></td>
                <td class="header-td">
                    <asp:TextBox ID="txtPincode" CssClass="textbox" runat="server" ToolTip="6 digit number"></asp:TextBox>
                </td>
                <td class="header-td header-td-validator"><strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                        ErrorMessage="*Pincode Required" ControlToValidate="txtPincode" ValidationGroup="UserRegistrationValidations"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server"
                        ErrorMessage="*Pincode Must be Numeric and 6 digits" ValidationExpression="[0-9]{6}" ControlToValidate="txtPincode" ValidationGroup="UserRegistrationValidations"></asp:RegularExpressionValidator>
                </strong></td>
            </tr>
            <tr>
                <td class="header-td header-td-field"><strong>Blood Group</strong></td>
                <td class="header-td">
                    <asp:DropDownList ID="ddlBloodGroup" CssClass="dropdownList" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="header-td header-td-validator"><strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                        ErrorMessage="*Blood group required" ControlToValidate="ddlBloodGroup" InitialValue="Select Blood Group" ValidationGroup="UserRegistrationValidations"></asp:RequiredFieldValidator>
                </strong></td>
            </tr>
        
            <tr>
                <td class="header-td header-td-field"><strong>Password</strong></td>
                <td class="header-td">
                    <asp:TextBox ID="txtPassword" CssClass="textbox" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="header-td header-td-validator"><strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                        ControlToValidate="txtPassword" ErrorMessage="*Password Required" ValidationGroup="UserRegistrationValidations"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server"
                        ErrorMessage="*Password Should contain min 1 upper case,1 lower case,1 digit,1 symbol &amp; min length 6 and max length 10" ControlToValidate="txtPassword"
                        ValidationExpression="(?=^.{6,10}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&amp;amp;*()_+}{&amp;quot;:;'?/&amp;gt;.&amp;lt;,])(?!.*\s).*$" ValidationGroup="UserRegistrationValidations"></asp:RegularExpressionValidator>
                </strong></td>
            </tr>
                    
            <tr>
                <td class="header-td">&nbsp;</td>
                <td class="header-td">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="textbox-button" ValidationGroup="UserRegistrationValidations" />
                &nbsp;<asp:Button ID="btnClear" runat="server" CssClass="textbox-button" OnClick="btnClear_Click" Text="Clear" />
                </td>
                <td class="header-td">
                    <asp:Button ID="btnSignIn" runat="server" Text="Sign In" CssClass="button" OnClick="btnSignIn_Click"/>
                </td>
            </tr>
        </table>
        

    </div>
    <div class="footer">
        <h3 class="footer-copyright">Copyright &copy; 2019</h3>
    </div>
</asp:Content>


