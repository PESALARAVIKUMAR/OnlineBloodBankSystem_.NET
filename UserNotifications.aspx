<%@ Page Title="" Language="C#" MasterPageFile="~/BloodBankMasterPage.master" AutoEventWireup="true" CodeFile="UserNotifications.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">

    </script>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="header">
        <table class="pre-header-table">
            <tr>
                <td class="header-td">
                    <asp:ImageButton ID="imgBtnHome" ImageUrl="~/images/HomeButton.png" OnClick="linkBtnHome_Click" CssClass="header-img" runat="server" Text="Home" /><br />
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
    <center>
    <div class="content">
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblUserId" runat="server" Text=""></asp:Label>
        <asp:Button ID="btnFeedback" runat="server" Text="Feedback" CssClass="button" OnClick="btnFeedback_Click"></asp:Button>
        <br />
        <br />
        <div class="plan-content">
            <h3 class="content-search-h3">Your Queries : </h3>
            <asp:Label ID="lblQueries" runat="server" Text=""></asp:Label>
            <asp:GridView ID="GridViewQueries" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderStyle-CssClass="gridview-hidden-column" HeaderText="Id" ItemStyle-CssClass="gridview-hidden-column">
                        <HeaderStyle CssClass="gridview-hidden-column" />
                        <ItemStyle CssClass="gridview-hidden-column" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Query" ItemStyle-CssClass="gridViewColumns" HeaderStyle-CssClass="gridViewColumns" HeaderText="Query" >
<HeaderStyle CssClass="gridViewColumns"></HeaderStyle>

<ItemStyle CssClass="gridViewColumns"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Description" ItemStyle-CssClass="gridViewColumns" HeaderStyle-CssClass="gridViewColumns" HeaderText="Description" >
<HeaderStyle CssClass="gridViewColumns"></HeaderStyle>

<ItemStyle CssClass="gridViewColumns"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Status" ItemStyle-CssClass="gridViewColumns" HeaderStyle-CssClass="gridViewColumns" HeaderText="Status" >
<HeaderStyle CssClass="gridViewColumns"></HeaderStyle>

<ItemStyle CssClass="gridViewColumns"></ItemStyle>
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
        
        <div class="plan-content">
            <h3 class="content-search-h3">Your Blood Donations before 3 Months : </h3>
            <asp:Label ID="lblPreviousDonations" runat="server" Text=""></asp:Label>
            <asp:GridView ID="GridViewBloodDonations" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderStyle-CssClass="gridview-hidden-column" HeaderText="Id" ItemStyle-CssClass="gridview-hidden-column">
                        <HeaderStyle CssClass="gridview-hidden-column" />
                        <ItemStyle CssClass="gridview-hidden-column" />
                    </asp:BoundField>
                    <asp:BoundField DataField="HospitalName" ItemStyle-CssClass="gridViewColumns" HeaderStyle-CssClass="gridViewColumns" HeaderText="Hospital Name">
                        <HeaderStyle CssClass="gridViewColumns"></HeaderStyle>

                        <ItemStyle CssClass="gridViewColumns"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Area" ItemStyle-CssClass="gridViewColumns" HeaderStyle-CssClass="gridViewColumns" HeaderText="Area">
                        <HeaderStyle CssClass="gridViewColumns"></HeaderStyle>

                        <ItemStyle CssClass="gridViewColumns"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Date" ItemStyle-CssClass="gridViewColumns" HeaderStyle-CssClass="gridViewColumns" HeaderText="Date" DataFormatString="{0:d}">
                        <HeaderStyle CssClass="gridViewColumns"></HeaderStyle>

                        <ItemStyle CssClass="gridViewColumns"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Time" ItemStyle-CssClass="gridViewColumns" HeaderStyle-CssClass="gridViewColumns" HeaderText="Time">
                        <HeaderStyle CssClass="gridViewColumns"></HeaderStyle>

                        <ItemStyle CssClass="gridViewColumns"></ItemStyle>
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

        <asp:Panel ID="panelBloodNeeded" runat="server">
            <div class="plan-content">
                <h4 class="content-search-h3">Blood Requirements according to your Blood match</h4>
                <asp:Label ID="lblBloodRequirements" runat="server" Text=""></asp:Label>
                <asp:GridView ID="GridViewBloodNeeded" runat="server" AutoGenerateColumns="False"
                    OnRowCommand="GridViewBloodDonation_RowCommand" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                        <asp:BoundField HeaderText="Id" ItemStyle-CssClass="gridViewColumns gridview-hidden-column"
                            HeaderStyle-CssClass="gridViewColumns gridview-hidden-column" DataField="Id" >
                        <HeaderStyle CssClass="gridViewColumns gridview-hidden-column" />
                        <ItemStyle CssClass="gridViewColumns gridview-hidden-column" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Blood Group" ItemStyle-CssClass="gridViewColumns" HeaderStyle-CssClass="gridViewColumns" DataField="BloodGroup" >
                        <HeaderStyle CssClass="gridViewColumns" />
                        <ItemStyle CssClass="gridViewColumns" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="State" ItemStyle-CssClass="gridViewColumns" HeaderStyle-CssClass="gridViewColumns" DataField="State" >
                        <HeaderStyle CssClass="gridViewColumns" />
                        <ItemStyle CssClass="gridViewColumns" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Area" ItemStyle-CssClass="gridViewColumns" HeaderStyle-CssClass="gridViewColumns" DataField="Area" >
                        <HeaderStyle CssClass="gridViewColumns" />
                        <ItemStyle CssClass="gridViewColumns" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Pin Code" ItemStyle-CssClass="gridViewColumns" HeaderStyle-CssClass="gridViewColumns" DataField="Pincode" >
                        <HeaderStyle CssClass="gridViewColumns" />
                        <ItemStyle CssClass="gridViewColumns" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Contact Number" ItemStyle-CssClass="gridViewColumns" HeaderStyle-CssClass="gridViewColumns" DataField="ContactNumber" >
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
    </div>
    </center>
    <div class="footer">
        <h3 class="footer-copyright">Copyright &copy; 2019</h3>
    </div>
</asp:Content>


