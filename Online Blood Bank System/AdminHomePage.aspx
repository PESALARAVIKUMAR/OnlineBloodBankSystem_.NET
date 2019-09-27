<%@ Page Title="" Language="C#" MasterPageFile="~/BloodBankMasterPage.master" AutoEventWireup="true" CodeFile="AdminHomePage.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">

    </script>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
            <div class="header">
                <table class="pre-header-table">
                    <tr>                        
                        <td class="header-td">
                            <asp:Button ID="btnResolveQueries" runat="server" Text="Resolve Query" CssClass="header-a" ForeColor="Red" OnClick="btnResolveQueries_Click"/>
                        </td>                        
                        <td class="header-td">
                            <asp:Button ID="btnViewBloodAvailabilities" runat="server" Text="Blood Availabilities" CssClass="header-a" ForeColor="Red" OnClick="btnViewBloodAvailabilities_Click"/>
                        </td>
                        <td class="header-td">
                            <asp:HyperLink ID="linkLogout" runat="server" Font-Underline="false" CssClass="header-a" 
                        NavigateUrl="~/HomePageBeforeLogin.aspx">Logout</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </div>
    <center>
            <div class="content">
                <asp:Panel ID="panelResolveQueries" runat="server">
                <div class="plan-content">
                                
                    <asp:GridView ID="GridViewResolveQueries" runat="server" AutoGenerateColumns="False" OnRowCommand="ResolvedButtonActive" 
                        CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" >
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderStyle-CssClass="gridview-hidden-column" HeaderText="Id" ItemStyle-CssClass="gridview-hidden-column">
                            <HeaderStyle CssClass="gridview-hidden-column" />
                            <ItemStyle CssClass="gridview-hidden-column" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Query" HeaderText="Query" />
                            <asp:BoundField DataField="Description" HeaderText="Description" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                            <asp:ButtonField ButtonType="Button" CommandName="Resolved" HeaderText="" Text="Resolved" />
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
                
                
                <asp:Panel ID="panelBloodAvailabilities" runat="server">
                    <div class="plan-content">
                    <asp:GridView ID="GridViewBloodAvailabilities" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderStyle-CssClass="gridview-hidden-column" HeaderText="Id" ItemStyle-CssClass="gridview-hidden-column">
                            <HeaderStyle CssClass="gridview-hidden-column" />
                            <ItemStyle CssClass="gridview-hidden-column" />
                            </asp:BoundField>
                            <asp:BoundField DataField="BloodGroup" HeaderText="Blood Group" />
                            <asp:BoundField DataField="State" HeaderText="State" />
                            <asp:BoundField DataField="Area" HeaderText="Area" />
                            <asp:BoundField DataField="Pincode" HeaderText="Pin Code" />
                            <asp:BoundField DataField="ContactNumber" HeaderText="Contact Number" />
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


