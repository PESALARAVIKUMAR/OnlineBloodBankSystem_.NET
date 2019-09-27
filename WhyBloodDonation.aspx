<%@ Page Title="" Language="C#" MasterPageFile="~/BloodBankMasterPage.master" AutoEventWireup="true" CodeFile="WhyBloodDonation.aspx.cs" Inherits="_Default" %>

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
    <div class="content">
        <asp:Label ID="lblUserId" runat="server" Text=""></asp:Label>
        <h2 class="content-content">WHY SHOULD I DONATE BLOOD???</h2>
        <p>Q: Why should I donate blood?</p>
        <p>A: Safe blood saves lives and improves health. Blood transfusion is needed for:</p>
        <ul>
            <li>women with complications of pregnancy, such as ectopic pregnancies and haemorrhage before, during or after childbirth;</li>
            <li>children with severe anaemia often resulting from malaria or malnutrition;</li>
            <li>people with severe trauma following man-made and natural disasters; and</li>
            <li>many complex medical and surgical procedures and cancer patients.</li>
        </ul>
        <p>
            It is also needed for regular transfusions for people with conditions such as 
                    thalassaemia and sickle cell disease and is used to make products such as clotting factors for people with haemophilia.
        </p>
        <p>
            There is a constant need for regular blood supply because blood can be stored for only a limited time before use. 
                    Regular blood donations by a sufficient number of healthy people are needed to ensure that 
                    safe blood will be available whenever and wherever it is needed.
        </p>
        <p>
            Blood is the most precious gift that anyone can give to another person — the gift of life. 
                    A decision to donate your blood can save a life, or even several if your blood is separated into its 
                    components — red cells, platelets and plasma — which can be used individually for patients with specific conditions.
        </p>
    </div>
    <div class="footer">
        <h3 class="footer-copyright">Copyright &copy; 2019</h3>
    </div>
</asp:Content>


