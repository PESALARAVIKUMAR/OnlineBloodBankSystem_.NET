<%@ Page Title="" Language="C#" MasterPageFile="~/BloodBankMasterPage.master" AutoEventWireup="true" CodeFile="UserLogin.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
        <div class="auto-style4">
            <br />
            
            <br />
            <asp:Label ID="lblUserId" runat="server" Text=""></asp:Label>
        </div>
        <table class="content-form-table">
            <tr>
                <td class="header-td header-td-field" colspan="3"><h2 class="content-search-h3"><strong><em>SIGN IN</em></strong></h2></td>
            </tr>
            <tr>
                <td class="header-td header-td-field"><strong><em>User Email</em></strong></td>
                <td class="header-td">
                    <asp:TextBox ID="userIdText" runat="server" CssClass="textbox"></asp:TextBox>
                </td>
                <td class="header-td header-td-validator">
                    <strong>
                        <asp:RequiredFieldValidator ID="RequiredFieldUserName" runat="server" ControlToValidate="userIdText" ErrorMessage="*User Email cannot be Empty" ForeColor="Red" ValidationGroup="UserLoginValidations"></asp:RequiredFieldValidator>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="header-td header-td-field"><strong><em>Password</em></strong></td>
                <td class="header-td">
                    <asp:TextBox ID="passwordText" runat="server" TextMode="Password" CssClass="textbox"></asp:TextBox>
                </td>
                <td class="header-td header-td-validator">
                    <strong>
                        <asp:RequiredFieldValidator ID="RequiredFieldPassword" runat="server" ControlToValidate="passwordText" EnableTheming="True" ErrorMessage="*Password Required" ForeColor="Red" ValidationGroup="UserLoginValidations"></asp:RequiredFieldValidator>
                    </strong>
                </td>
            </tr>

            <tr>
                <td class="header-td header-td-field"><strong>
                    <asp:Label ID="loginLabel" runat="server" CssClass="header-td-field" ForeColor="Red"></asp:Label>
                &nbsp;</strong></td>
                <td class="header-td">
                    <asp:Button ID="loginButton" runat="server" CssClass="textbox-button" Text="Login" OnClick="loginButton_Click" ValidationGroup="UserLoginValidations" />
                &nbsp;<asp:Button ID="btnClear" runat="server" CssClass="textbox-button" OnClick="btnClear_Click" Text="Clear" />
                </td>
                <td class="header-td">
                    <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" CssClass="button" OnClick="btnSignUp_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style19">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
            </tr>
        </table>
    </div>
    <div class="footer">
        <h3 class="footer-copyright">Copyright &copy; 2019</h3>
    </div>
</asp:Content>


