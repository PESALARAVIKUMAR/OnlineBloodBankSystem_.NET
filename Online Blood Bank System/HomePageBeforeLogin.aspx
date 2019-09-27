<%@ Page Title="" Language="C#" MasterPageFile="~/BloodBankMasterPage.master" AutoEventWireup="true" CodeFile="HomePageBeforeLogin.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#eligibilitypanel").on("hide.bs.collapse", function () {
                $(".btn").html('<span class="glyphicon glyphicon-collapse-down"></span> Open');
            });
            $("#eligibilitypanel").on("show.bs.collapse", function () {
                $(".btn").html('<span class="glyphicon glyphicon-collapse-up"></span> Close');
            });
        });
    </script>
    <style type="text/css">
        .button-collapse {
            border-style: none;
            border-color: black;
            border-width: 2px;
            background-color: lightgray;
            width: 75%;
            text-align: left;
            text-decoration-color: darkred;
            color: #9F190C;
            height: 50px;
            text-decoration: none;
            display: inline-block;
            cursor: pointer;
            font-size: x-large;
            font-family: Arial;
            background-color: #f5f5f5;
            border-color: #ddd;
        }

        .div1-tipsondonation {
            align-content: center;
            margin-left: 106px;
            margin-top: 29px;
        }

        .mainheading-tipsondonation {
            background-color: lightgray;
            border: 2px #ddd;
            width: 60%;
            text-align: left;
            text-decoration-color: darkred;
            color: #9F190C;
            height: 50px;
            text-decoration: none;
            display: inline-block;
            cursor: pointer;
            font-size: x-large;
            font-family: Arial;
            background-color: #f5f5f5;
        }

        .headings {
            text-align: left;
            width: 697px;
        }

        .main-headings {
            width: 714px;
        }

        .main-sub-headings {
            width: 699px;
            font-size: x-large;
            color: #666666;
            background-color: #FFFFFF;
        }

        .panel-body {
            width: 65%;
        }

        .button-tipsondonation {
            color: yellow;
            background-color: black;
            text-align: center;
        }

        .hover-img-container {
            position: relative;
            width: 50%;
        }

        .hover-img {
            display: block;
            width: 100%;
            height: auto;
        }

        .overlay {
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            height: 100%;
            width: 100%;
            opacity: 0;
            transition: .5s ease;
            background-color: #949494;
        }

        .hover-img-container:hover .overlay {
            opacity: 1;
        }

        .text {
            color: white;
            font-size: 20px;
            position: absolute;
            top: 50%;
            left: 50%;
            -webkit-transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
            text-align: center;
        }

        .text-long {
            color: white;
            font-size: 15px;
            position: absolute;
            top: 50%;
            left: 50%;
            -webkit-transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="header">
        <table class="pre-header-table">
            <tr>
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
                    <asp:LinkButton ID="linkBtnLoginOrRegistration" runat="server" Font-Underline="false" CssClass="header-a" OnClick="linkBtnLoginOrRegistration_Click">Sign In/Sign Up</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>

    <div class="content">
        <asp:Label ID="lblUserId" runat="server" Text=""></asp:Label>
        <div class="plan-content-search">
            <h3 class="content-search-h3">Search Blood Requirements</h3>
            <asp:Button ID="btnSearchBlood" runat="server" Text="SEARCH BLOOD" CssClass="button" OnClick="btnSearchBlood_Click" />
            <br />
        </div>
        <br />
        <br />
        <table>
            <tr>
                <td class="content-td">
                    <asp:Panel ID="panelQuotations" runat="server">
                        <div class="plan-content-quotations" style="height:700px;width:1300px;">
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
                                    <asp:ButtonField HeaderText="Donate" ItemStyle-CssClass="gridViewColumns" HeaderStyle-CssClass="gridViewColumns" ButtonType="Button" CommandName="Donate" Text="Donate">
                                        <HeaderStyle CssClass="gridViewColumns" />
                                        <ItemStyle CssClass="gridViewColumns" />
                                    </asp:ButtonField>
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


