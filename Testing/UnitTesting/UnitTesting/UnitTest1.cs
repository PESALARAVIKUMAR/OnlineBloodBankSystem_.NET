using System;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Model;
using DAO;

namespace UnitTesting
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestGetAllBloodPostings()
        {
            BloodBL bl = new BloodBL();
            List<BloodPosting> bpList = bl.GetAllBloodPostings();
            Assert.AreEqual(3, bpList.Count);
        }

        [TestMethod]
        public void TestGetAllFeedbackComments()
        {
            BloodBL bl = new BloodBL();
            List<Feedback> fList = bl.GetAllFeedbackComments();
            Assert.AreEqual(3, fList.Count);
        }

        [TestMethod]
        public void TestDonateBlood()
        {
            BloodBL bl = new BloodBL();
            BloodAvailability ba = new BloodAvailability(1, "A+", "AP", "area1", 123456, 9987654321);
            Assert.AreEqual(1, bl.DonateBlood(ba, 1));
        }

        [TestMethod]
        public void TestSaveHospital()
        {
            BloodBL bl = new BloodBL();
            Hospital h = new Hospital(1, "Appolo"," ", "Mumbai", DateTime.Parse("10/12/1990"), "09:00");
            Assert.AreEqual(1, bl.SaveHospital(h, 1));
        }

        [TestMethod]
        public void TestSaveFeedbackComments()
        {
            BloodBL bl = new BloodBL();
            Feedback f = new Feedback("Appolo","Telangana", "Hyderabad", "Not Bad");
            Assert.AreEqual(1, bl.SaveFeedbackComments(f, 1));
        }

        [TestMethod]
        public void TestSaveUser()
        {
            UserBL bl = new UserBL();
            int result = bl.SaveUser(new User(1, "ravi", "kumar", 21, "Male", 9704073336,
                "ravi2@gmail.com", "password", 54, "Andhra pradesh", "guntur", 603103, "B+"));
            Assert.AreEqual(1, result);
        }

        [TestMethod]
        public void TestBloodPosting()
        {
            BloodBL bl = new BloodBL();
            int result = bl.PostBlood(new BloodPosting(1, "B+", "AndhraPradesh", "Guntur", 522001, 9790703771), 7);
            Assert.AreEqual(1, result);
        }

        [TestMethod]
        public void TestUserExistence()
        {
            UserBL bl = new UserBL();
            int result = bl.UserExist("ravi@gmail.com");
            Assert.AreEqual(1, result);
        }

        [TestMethod]
        public void TestUserLogin()
        {
            UserBL bl = new UserBL();
            User userDetails = bl.GetUser(7);
            Assert.AreEqual(21, userDetails.Age);
        }

        [TestMethod]
        public void TestGetBloodAvailability()
        {
            BloodBL bl = new BloodBL();
            List<BloodAvailability> availabilityList = bl.GetAllBloodAvailabilities("Ap", "a", "A+");
            Assert.AreEqual(2, availabilityList.Count);
        }

        [TestMethod]
        public void TestRaiseQuery()
        {
            BloodBL bl = new BloodBL();
            RaiseQuery rq = new RaiseQuery();
            rq.Query = "Donate Blood";
            rq.Description = "Unable to Donate Blood";
            rq.Status = "In Progress";
            Assert.AreEqual(1, bl.RaiseQuery(rq, 8));
        }

        [TestMethod]
        public void TestGetQueries()
        {
            BloodBL bl = new BloodBL();
            List<RaiseQuery> rqList = bl.GetQueryStatus(7);
            Assert.AreEqual(1, rqList.Count);
        }

        [TestMethod]
        public void TestGetBloodPosting()
        {
            BloodBL bl = new BloodBL();
            Assert.AreEqual(5, bl.GetBloodPosting(5).Id);
        }

        [TestMethod]
        public void TestGetAllBloodAvailabilities()
        {
            BloodBL bl = new BloodBL();
            Assert.AreEqual(12, bl.GetAllBloodAvailabilities().Count);
        }

        [TestMethod]
        public void TestGetQueryStatus()
        {
            BloodBL bl = new BloodBL();
            Assert.AreEqual(4, bl.GetQueryStatus(7).Count);
        }

        [TestMethod]
        public void TestUpdateQuery()
        {
            BloodBL bl = new BloodBL();
            Assert.AreEqual(1, bl.UpdateQuery("In Progress","Yeah it solved try again", 3));
        }

        [TestMethod]
        public void TestAlertUserToDonateBlood()
        {
            BloodBL bl = new BloodBL();
            Assert.AreEqual(3, bl.AlertUserToDonateBlood(1).Count);
        }

        [TestMethod]
        public void TestAlertUserSpecificMatchBlood()
        {
            BloodBL bl = new BloodBL();
            Assert.AreEqual(3, bl.AlertUserSpecificMatchBlood(1).Count);
        }

        [TestMethod]
        public void TestGetHospitalByStateArea()
        {
            BloodBL bl = new BloodBL();

            Assert.AreEqual(2, bl.GetHospitalsByStateArea("Andhra Pradesh", "Anantapur").Count);
        }

        /*
        [TestMethod]
        public void TestSendEmailToResetPassword()
        {
            UserBL userBL = new UserBL();
            int result = 0;
            if (userBL.SendEmailToResetPassword("pesala12pesala@gmail.com").Equals("Success"))
                result = 1;
            Assert.AreEqual(1, result);            
        }
        */

        [TestMethod]
        public void TestRemoveBloodPosting()
        {
            BloodBL bl = new BloodBL();
            Assert.AreEqual(1, bl.RemoveBloodPosting(5));
        }

    }
}
