<%@ Page Title="" Language="C#" MasterPageFile="~/BloodBankMasterPage.master" AutoEventWireup="true" CodeFile="TipsOnDonatingBlood.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 
    <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script>
$(document).ready(function(){
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
        &nbsp;<asp:Label ID="lblUserId" runat="server" Text=""></asp:Label>
        <div class="div1-tipsondonation">
            <div>
                <h2 class="main-headings"><em>HOW YOU PREPARE FOR BLOOD DONATION???</em></h2>
                <p>&nbsp;</p>
                <button type="button" class="mainheading-tipsondonation" data-toggle="collapse" data-target="#eligibilitypanel">
                    <div class="text-left">
                        ELIGIBILITY CRITERIA
                    </div>
                </button>
                <div id="eligibilitypanel" class="collapse">
                    <div class="panel-body">
                        <p>To be eligible to donate whole blood, plasma or platelets, you must be:</p>
                        <ul>
                            <li>In good health.</li>
                            <li>At least 16 or 17 years old, depending on the law in your state. 
                        Some states allow legal minors to donate with parent permission. 
                        While there's no legal upper age limit, policies may vary between individual donor centers.</li>
                            <li>At least 110 pounds.</li>
                            <li>Able to pass the physical and health-history assessments.</li>
                        </ul>
                        <p>
                            Eligibility requirements differ slightly between different types of blood donation, and from center to center. 
                    Check with your local donor center for specifics.
                        </p>
                    </div>
                </div>
                <br />
                <br />
                <button type="button" class="mainheading-tipsondonation" data-toggle="collapse" data-target="#foodpanel">
                    <div class="headings">
                        FOOD & MEDICATIONS
                    </div>
                </button>
                <div id="foodpanel" class="collapse">
                    <div class="panel-body">
                        <p>Before your blood donation:</p>
                        <br />
                        <div class="hover-img-container">
                            <asp:Image ID="Image1" ImageUrl="~/images/sleeping.jfif" runat="server" class="hover-img" />
                            <div class="overlay">
                                <div class="text">Get plenty of sleep the night before you plan to donate.</div>
                            </div>
                        </div>
                        <br />
                        <br />

                        <div class="hover-img-container">
                            <asp:Image ID="Image2" ImageUrl="~/images/healthyMeals2.jfif" runat="server" class="hover-img" />
                            <div class="overlay">
                                <div class="text">Eat a healthy meal before your donation.</div>
                            </div>
                        </div>
                        <br />
                        <br />

                        <div class="hover-img-container">
                            <asp:Image ID="Image3" ImageUrl="~/images/avoidingFattyFoods.jfif" runat="server" class="hover-img" />
                            <div class="overlay">
                                <div class="text-long">
                                    Avoid fatty foods, such as hamburgers, french fries or ice cream before donating. 
                        Tests for infections done on all donated blood can be affected by fats that appear in your blood 
                        for several hours after eating fatty foods.
                                </div>
                            </div>
                        </div>
                        <br />
                        <br />

                        <div class="hover-img-container">
                            <asp:Image ID="Image4" ImageUrl="~/images/drinkingWater.jfif" runat="server" class="hover-img" />
                            <div class="overlay">
                                <div class="text">Drink an extra 16 ounces (473 milliliters) of water and other fluids before the donation.</div>
                            </div>
                        </div>
                        <br />
                        <br />
                        <p>
                            If you are a platelet donor, remember that you must not take aspirin for two days prior to donating. 
                        Otherwise, you can take your normal medications as prescribed.
                        </p>

                    </div>
                </div>
                <br />
                <h2 class="main-sub-headings"><em>WHAT CAN YOU EXPECT ?!</em></h2>
                <br />
                <button type="button" class="mainheading-tipsondonation" data-toggle="collapse" data-target="#beforepanel">
                    <div class="text-left">
                        BEFORE THE PROCEDURE
                    </div>
                </button>
                <div id="beforepanel" class="collapse">
                    <div class="panel-body">
                        <p>
                            Before you can donate blood, you will be asked to fill out a confidential medical history 
                    that includes direct questions about behaviors known to carry a higher risk of bloodborne infections — 
                    infections that are transmitted through the blood. 
                    All of the information from this evaluation is kept strictly confidential.
                        </p>
                        <p>
                            Because of the risk of bloodborne infections, not everyone can donate blood. 
                    The following high-risk groups are not eligible to donate blood:
                        </p>
                        <ul>
                            <li>Anyone who has ever used injection drugs not prescribed by a doctor, 
                        such as illegal injection drugs or steroids not prescribed by a doctor</li>
                            <li>Men who have had sexual contact with other men in the past 12 months</li>
                            <li>Anyone who has a congenital coagulation factor deficiency</li>
                            <li>Anyone with a positive test for HIV</li>
                            <li>Men and women who have engaged in sex for money or drugs</li>
                            <li>Anyone who, in the past 12 months, 
                        has had close contact with — lived with or had sexual contact with — a person who has viral hepatitis</li>
                            <li>Anyone who has had babesiosis, a rare and severe tick-borne disease, or the parasitic infection Chagas' disease</li>
                            <li>Anyone who has taken etretinate (Tegison) for psoriasis</li>
                            <li>Anyone who has risk factors for the 
                        degenerative brain disorder Creutzfeldt-Jakob disease (CJD) or who has a blood relative with CJD</li>
                            <li>Anyone who received a blood transfusion in the United Kingdom or France from 1980 to the present</li>
                        </ul>
                        <p>
                            You will also have a brief physical exam, which includes checking your blood pressure, pulse and temperature. 
                    A small sample of blood is taken from a finger prick and is used to check the oxygen-carrying component 
                    of your blood (hemoglobin level). If your hemoglobin concentration is normal and 
                    you've met all the other screening requirements, you can donate blood.
                        </p>
                    </div>
                </div>
                <br />
                <br />
                <button type="button" class="mainheading-tipsondonation" data-toggle="collapse" data-target="#duringpanel">
                    <div class="headings">
                        DURING THE PROCEDURE
                    </div>
                </button>
                <div id="duringpanel" class="collapse">
                    <div class="panel-body">
                        <ul>
                            <li>You lie or sit in a reclining chair with your arm extended on an armrest. This makes the veins easier to see and easier to insert the needle into, and also helps fill the blood bag more quickly.</li>
                            <li>A blood pressure cuff or tourniquet is placed around your upper arm to fill your veins with more blood. </li>
                            <li>Then the skin on the inside of your elbow is cleaned.</li>
                            <li>A new, sterile needle is inserted into a vein in your arm.</li>
                            <li>This needle is attached to a thin, plastic tube and a blood bag. Once the needle is in place, 
                  you tighten your fist several times to help the blood flow from the vein. </li>
                            <li>Blood initially is collected into tubes for testing. When these have been collected, 
                    blood is allowed to fill the bag, about a pint.</li>
                            <li>The needle is usually in place about 10 minutes. 
                    When complete, the needle is removed, 
                    a small bandage is placed on the needle site and a dressing is wrapped around your arm.</li>
                        </ul>
                        <p>Another method of donating blood becoming increasingly common is apheresis. </p>
                        <ul>
                            <li>During apheresis, blood is drawn from one arm and pumped through a machine that separates out a specific component, 
                    such as platelets.</li>
                            <li>The rest of the blood is then returned through a vein in your other arm. This process allows more of a single component to be collected.</li>
                            <li>It takes longer than standard blood donation — typically up to two hours.</li>

                        </ul>
                    </div>
                </div>
                <br />
                <br />
                <button type="button" class="mainheading-tipsondonation" data-toggle="collapse" data-target="#afterpanel">
                    <div class="headings">
                        AFTER THE PROCEDURE
                    </div>
                </button>
                <div id="afterpanel" class="collapse">
                    <div class="panel-body">
                        <p>
                            After donating you sit in an observation area, where you rest and eat a light snack. 
                    After 15 minutes, you can leave. After your blood donation:
                        </p>
                        <ul>
                            <li>Drink extra fluids for the next day or two.</li>
                            <li>Avoid strenuous physical activity or heavy lifting for the next five hours.</li>
                            <li>If you feel lightheaded, lie down with your feet up until the feeling passes.</li>
                            <li>Keep the bandage on your arm and dry for five hours.</li>
                            <li>If you have bleeding after removing the bandage, put pressure on the site and raise your arm until the bleeding stops.</li>
                            <li>If bleeding or bruising occurs under the skin, apply a cold pack to the area periodically during the first 24 hours.</li>
                            <li>If your arm is sore, take a pain reliever such as acetaminophen (Tylenol, others). 
                        Avoid taking aspirin or ibuprofen (Advil, Motrin IB, others) for the first 24 to 48 hours after donation</li>
                        </ul>
                        <p>
                            Contact the blood donor center or your doctor if you forgot to report any important health information before you donated or 
                    if you had any problems or needed medical care after giving blood.
                        </p>
                        <p>You should also call the center if you:</p>
                        <ul>
                            <li>Continue to feel nauseated, lightheaded or dizzy after resting, eating and drinking.</li>
                            <li>Notice a raised bump, continued bleeding or pain at the needle-stick site when you remove the bandage.</li>
                            <li>Feel pain or tingling down your arm, into your fingers.</li>
                            <li>Become ill with signs and symptoms of a cold or flu, such as fever, headache or sore throat, within four days after your blood donation. Bacterial infections can be transmitted by your blood to another person via transfusion, so it&#39;s important to let the blood donor center know if you become ill so that your blood won&#39;t be</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <br />

        <asp:Button ID="Button1" runat="server" Text="Donate Blood" CssClass="button-tipsondonation" OnClick="Button1_Click" Height="44px" Width="199px" />
        <br />
        <br />
    </div>
    <div class="footer">
                <h3 class="footer-copyright">Copyright &copy; 2019</h3>
            </div>
        </asp:Content>


