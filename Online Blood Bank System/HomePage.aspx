<%@ Page Title="" Language="C#" MasterPageFile="~/BloodBankMasterPage.master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
    
    </script>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="header">
        <table class="pre-header-table">
            <tr>
                <td class="header-td">
                    <asp:ImageButton ID="imgBtnHome" ImageUrl="~/images/HomeButton.png" CssClass="header-img" OnClick="linkBtnHome_Click" runat="server" Text="Home" /><br />
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
        <div class="plan-content-search">
            <h3 class="content-search-h3">Search Blood Requirements</h3>
            <asp:Button ID="btnSearchBlood" runat="server" Text="SEARCH BLOOD" CssClass="button" OnClick="btnSearchBlood_Click" />

        </div>

        <table>
            <tr>
                <td class="content-td">
                    <asp:Panel ID="panelQuotations" runat="server">
                        <div class="plan-content" style="height:600px;width:1200px;">
                            <table class="table">
                                <tr>
                                    <td class="content-td-td">
                                        <h3 class="content-td-td-h3">Anybody can give blood</h3>
                                        <asp:Image ID="Image1" ImageUrl="~/images/AnybodyCanDonateBlood.jfif" CssClass="content-td-td-img"  runat="server" />
                                    </td>
                                    <td class="content-td-td">
                                        <h3 class="content-td-td-h3">Bring a life back to power. Make blood donation your responsibility</h3>
                                        <asp:Image ID="Image2" ImageUrl="~/images/DonateBloodSaveLife.jfif" CssClass="content-td-td-img"  runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="content-td-td">
                                        <h3 class="content-td-td-h3">Spare only 15 minutes and save 3 lives</h3>
                                        <asp:Image ID="Image3" ImageUrl="~/images/Save15Minutes.jfif" CssClass="content-td-td-img"  runat="server" />
                                    </td>
                                    <td class="content-td-td">
                                        <h3 class="content-td-td-h3">Donate your blood for a reason, let the reason to be life</h3>
                                        <asp:Image ID="Image4" ImageUrl="~/images/DonateForReason.jfif" CssClass="content-td-td-img"  runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                </td>
                <td class="content-td2">
                    <asp:Panel ID="panelBloodNeeded" runat="server">
                        <div class="plan-content">
                            <h4 class="content-search-h3">Save a Life by Clicking Donate button</h4>
                            <asp:GridView ID="GridViewBloodNeeded" runat="server" AutoGenerateColumns="False"
                                OnRowCommand="GridViewBloodDonation_RowCommand" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                                <Columns>
                                    <asp:BoundField HeaderText="Id" ItemStyle-CssClass="gridViewColumns gridview-hidden-column"
                                        HeaderStyle-CssClass="gridViewColumns gridview-hidden-column" DataField="Id">
                                        <HeaderStyle CssClass="gridViewColumns gridview-hidden-column" />
                                        <ItemStyle CssClass="gridViewColumns gridview-hidden-column" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Blood Group" ItemStyle-CssClass="gridViewColumns" HeaderStyle-CssClass="gridViewColumns" DataField="BloodGroup">
                                        <HeaderStyle CssClass="gridViewColumns" />
                                        <ItemStyle CssClass="gridViewColumns" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="State" ItemStyle-CssClass="gridViewColumns" HeaderStyle-CssClass="gridViewColumns" DataField="State">
                                        <HeaderStyle CssClass="gridViewColumns" />
                                        <ItemStyle CssClass="gridViewColumns" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Area" ItemStyle-CssClass="gridViewColumns" HeaderStyle-CssClass="gridViewColumns" DataField="Area">
                                        <HeaderStyle CssClass="gridViewColumns" />
                                        <ItemStyle CssClass="gridViewColumns" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Pin Code" ItemStyle-CssClass="gridViewColumns" HeaderStyle-CssClass="gridViewColumns" DataField="Pincode">
                                        <HeaderStyle CssClass="gridViewColumns" />
                                        <ItemStyle CssClass="gridViewColumns" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Contact Number" ItemStyle-CssClass="gridViewColumns" HeaderStyle-CssClass="gridViewColumns" DataField="ContactNumber">
                                        <HeaderStyle CssClass="gridViewColumns" />
                                        <ItemStyle CssClass="gridViewColumns" />
                                    </asp:BoundField>
                                    <asp:ButtonField HeaderText="Donate" ButtonType="Button" CommandName="Donate" Text="Donate" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#242121" />
                            </asp:GridView>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="panelUserExperience" runat="server">
                        <div class="plan-content">
                            <h4 class="content-search-h3">User Experience on Blood Donation</h4>
                            <asp:GridView ID="GridViewFeedbackComments" runat="server" CellPadding="4" ForeColor="Black" GridLines="Horizontal"
                                AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                                <Columns>
                                    <asp:BoundField HeaderText="Hospital Name" ItemStyle-CssClass="gridViewColumns" HeaderStyle-CssClass="gridViewColumns" DataField="HospitalName">
                                        <HeaderStyle CssClass="gridViewColumns" />
                                        <ItemStyle CssClass="gridViewColumns" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Area" ItemStyle-CssClass="gridViewColumns" HeaderStyle-CssClass="gridViewColumns" DataField="Area">
                                        <HeaderStyle CssClass="gridViewColumns" />
                                        <ItemStyle CssClass="gridViewColumns" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Feedback Comments" ItemStyle-CssClass="gridViewColumns" HeaderStyle-CssClass="gridViewColumns" DataField="FeedbackComments">
                                        <HeaderStyle CssClass="gridViewColumns" />
                                        <ItemStyle CssClass="gridViewColumns" />
                                    </asp:BoundField>
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#242121" />
                            </asp:GridView>
                        </div>
                    </asp:Panel>
                </td>
            </tr>
        </table>

    </div>

    <div class="footer">
        <h3 class="footer-copyright">Copyright &copy; 2019</h3>
    </div>
</asp:Content>


