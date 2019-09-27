<%@ Page Title="" Language="C#" MasterPageFile="~/BloodBankMasterPage.master" AutoEventWireup="true" CodeFile="BloodAvailability.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">

    </script>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
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
                            <div class="auto-style11">
                <strong><h2 class="content-search-h3">Check Blood Availability</h2>
            </em>
            </div>
         <br />
                <br />
            <table class="content-form-table">
                <tr>
                    <td></td>
                    <td></td>
                    <td><asp:Button ID="btnBack" runat="server" CssClass="textbox-button" OnClick="btnBack_Click" Text="Back" /></td>
                </tr>
                <tr>
                    <td class="header-td header-td-field">Blood Group</td>
                    <td class="header-td">
                        <asp:DropDownList ID="bloodGroupDropDownList" CssClass="dropdownList" AutoPostBack="true" Height="19px" Width="149px" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td class="header-td header-td-validator">
                        <asp:RequiredFieldValidator ID="bloodGroupRequiredFieldValidator" runat="server" 
                            ControlToValidate="bloodGroupDropDownList" ErrorMessage="* Blood Group Required" ForeColor="Red" 
                            InitialValue="Select" ValidationGroup="BloodAvailabilityValidations"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="header-td">&nbsp;</td>
                    <td class="header-td">&nbsp;</td>
                    <td class="header-td">&nbsp;</td>
                </tr>
   
                <tr>
                    <td class="header-td header-td-field">State</td>
   
                    <td class="header-td">
                        <asp:DropDownList ID="stateDropDownList" CssClass="dropdownList" runat="server"
                            OnSelectedIndexChanged="stateDropDownList_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
        </td>
                    <td class="header-td header-td-validator">
                        <asp:RequiredFieldValidator ID="StateRequiredFieldValidator" runat="server" ControlToValidate="stateDropDownList" 
                            ErrorMessage="* State Required" ForeColor="Red" InitialValue="Select State" ValidationGroup="BloodAvailabilityValidations"></asp:RequiredFieldValidator>
        </td>
                </tr>
  
                <tr>
                    <td class="header-td">&nbsp;</td>    
                    <td class="header-td">&nbsp;</td> 
                    <td class="header-td">&nbsp;</td>
                </tr>
   
    
                <tr>
                    <td class="header-td header-td-field">Area</td>
 
                    <td class="header-td">
                        <asp:DropDownList ID="AreaDropDownList" CssClass="dropdownList" runat="server" AutoPostBack="True">
                        </asp:DropDownList>
        </td>
  
  
                    <td class="header-td header-td-validator">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="AreaDropDownList" 
                            ErrorMessage="* Area Required" ForeColor="Red" ValidationGroup="BloodAvailabilityValidations"></asp:RequiredFieldValidator>
        </td>
                </tr>
                <tr>
                    <td class="header-td">&nbsp;</td>

                    <td class="header-td header-td-validator">
                        &nbsp;</td>
     <td class="header-td">&nbsp;</td>
                </tr>
 
                <tr>
                    <td class="header-td">
                        
                    </td>

                    <td class="header-td">
            <strong>
                        <asp:Button ID="searchButton" runat="server" CssClass="textbox-button" Text="Search" OnClick="searchButton_Click" ValidationGroup="BloodAvailabilityValidations" />
            &nbsp;
                        <asp:Button ID="btnClear" runat="server" CssClass="textbox-button" OnClick="btnClear_Click" Text="Clear" />
                        </strong></td>

                    <td class="header-td">&nbsp;</td>
                </tr>

            </table>

            <center>
            <div>
                <strong>
                <br />
                <asp:Label ID="searchResultsLabel" runat="server" ForeColor="Red" Text="Label"></asp:Label><br />
                <br />
                    </strong>
                <em>
                <asp:Button ID="bloodRequirementsButton" runat="server" Text="Post your Blood" CssClass="button" OnClick="bloodRequirementsButton_Click" />
                </em>
                <asp:GridView ID="BloodDonorAvailableGridView" runat="server" BackColor="LightGoldenrodYellow" 
                    BorderColor="Tan" BorderWidth="1px" CellPadding="2" CssClass="auto-style13" ForeColor="Black" 
                    GridLines="None" Width="849px" AutoGenerateColumns="False">
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    <FooterStyle BackColor="Tan" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <SortedAscendingCellStyle BackColor="#FAFAE7" />
                    <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                    <SortedDescendingCellStyle BackColor="#E1DB9C" />
                    <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                    <Columns>
                      
                        <asp:BoundField HeaderText="Blood Group" DataField="BloodGroup" />
                        <asp:BoundField HeaderText="State" DataField="State" />
                        <asp:BoundField HeaderText="Area" DataField="Area" />
                         <asp:BoundField HeaderText="Pincode" DataField="Pincode" />
                         <asp:BoundField HeaderText="Contact Number" DataField="ContactNumber" />
                    </Columns>
                </asp:GridView>

                <br />

            </strong>

            </div>
                </center>
            
            </div>
    
            <div class="footer">
                <h3 class="footer-copyright">Copyright &copy; 2019</h3>
            </div>
        </asp:Content>


