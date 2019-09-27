using System.Collections.Generic;
using Model;

namespace DAO
{
    interface BloodInterface
    {
        // Get Feedback List to Display on Home Page
        List<Feedback> GetAllFeedbackComments();

        // Get Blood Posting List to Display on Home Page
        List<BloodPosting> GetAllBloodPostings();
        BloodPosting GetBloodPosting(int id);

        // Get Blood Availability List for user need
        List<BloodAvailability> GetAllBloodAvailabilities(string state, 
            string area, string bloodGroup);
        List<BloodAvailability> GetAllBloodAvailabilities();

        // Post Blood requirement for user
        int PostBlood(BloodPosting bp, int userId);

        // Remove Blood Postings by Id post-success Blood Donation
        int RemoveBloodPosting(int id);

        // Save user Blood details & Hospital details who willing to donate blood
        int DonateBlood(BloodAvailability ba, int userId);
        int SaveHospital(Hospital h, int userId);

        // Post-success Blood Donation save user experience
        List<string> GetStateFromHospitalById(int userId);
        List<string> GetAreaFromHospitalByState(int userId, string state);
        List<string> GetHospitalNameFromHospital(int userId, string state, string area);
        int SaveFeedbackComments(Feedback f, int userId);

        // Raise Query & get Status
        int RaiseQuery(RaiseQuery rq, int userId);
        List<RaiseQuery> GetQueryStatus(int userId);
        //List<RaiseQuery> GetAllQueries();
        int UpdateQuery(string status, string result, int id);

        // Alert user last blood donated date is 3 months earlier
        List<Hospital> AlertUserToDonateBlood(int userId);

        // Notify User if their specific blood match in Blood Posting
        List<BloodPosting> AlertUserSpecificMatchBlood(int userId);

        // Get States & Areas accordingly
        List<string> GetAllStates();
        List<string> GetAreasByState(string state);
        List<string> GetHospitalsByStateArea(string state, string area);

    }
}
