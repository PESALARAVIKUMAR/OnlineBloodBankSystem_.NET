using System;
using System.Collections.Generic;
using Model;
using System.Data.SqlClient;
using System.Data;

namespace DAO
{
    public class BloodBL : BloodInterface
    {
        public int DonateBlood(BloodAvailability ba, int userId)
        {
            int result = 0;
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.saveDonorBloodDetails
                };
                command.Parameters.Add(Constants.paramBloodGroup, SqlDbType.VarChar).Value = ba.BloodGroup;
                command.Parameters.Add(Constants.paramState, SqlDbType.VarChar).Value = ba.State;
                command.Parameters.Add(Constants.paramArea, SqlDbType.VarChar).Value = ba.Area;
                command.Parameters.Add(Constants.paramPincode, SqlDbType.BigInt).Value = ba.Pincode;
                command.Parameters.Add(Constants.paramContactNumber, SqlDbType.BigInt).Value = ba.ContactNumber;
                command.Parameters.Add(Constants.paramUserId, SqlDbType.Int).Value = userId;

                result = command.ExecuteNonQuery();
            }
            return result;
        }

        public List<BloodAvailability> GetAllBloodAvailabilities(string state, string area, string bloodGroup)
        {
            List<BloodAvailability> bloodAvailabilityList = new List<BloodAvailability>();
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand()
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.bloodAvailabilityCheck
                };
                command.Parameters.Add(Constants.paramState, SqlDbType.VarChar).Value = state;
                command.Parameters.Add(Constants.paramArea, SqlDbType.VarChar).Value = area;
                command.Parameters.Add(Constants.paramBloodGroup, SqlDbType.VarChar).Value = bloodGroup;

                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    BloodAvailability availability = new BloodAvailability();

                    availability.BloodGroup = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.bloodGroup)));
                    availability.Area = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.area)));
                    availability.State = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.state)));
                    availability.Pincode = Convert.ToInt32(reader.GetValue(reader.GetOrdinal(Constants.pincode)));
                    availability.ContactNumber = Convert.ToInt64(reader.GetValue(reader.GetOrdinal(Constants.contactNumber)));
                    bloodAvailabilityList.Add(availability);
                }
                reader.Close();
            }
            return bloodAvailabilityList;
        }

        public List<BloodAvailability> GetAllBloodAvailabilities()
        {
            List<BloodAvailability> bloodAvailabilityList = new List<BloodAvailability>();
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand()
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.getAllBloodAvailabilities
                };
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    BloodAvailability availability = new BloodAvailability();

                    availability.BloodGroup = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.bloodGroup)));
                    availability.Area = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.area)));
                    availability.State = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.state)));
                    availability.Pincode = Convert.ToInt32(reader.GetValue(reader.GetOrdinal(Constants.pincode)));
                    availability.ContactNumber = Convert.ToInt64(reader.GetValue(reader.GetOrdinal(Constants.contactNumber)));
                    bloodAvailabilityList.Add(availability);
                }
                reader.Close();
            }
            return bloodAvailabilityList;
        }

        public BloodPosting GetBloodPosting(int id)
        {
            BloodPosting bp = new BloodPosting();
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.getBloodPostingById
                };
                command.Parameters.Add(Constants.id, SqlDbType.Int).Value = id;
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    bp.Id = Convert.ToInt32(reader.GetValue(reader.GetOrdinal(Constants.id)));
                    bp.BloodGroup = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.bloodGroup)));
                    bp.State = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.state)));
                    bp.Area = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.area)));
                    bp.Pincode = Convert.ToInt32(reader.GetValue(reader.GetOrdinal(Constants.pincode)));
                    bp.ContactNumber = Convert.ToInt64(reader.GetValue(reader.GetOrdinal(Constants.contactNumber)));
                }
                reader.Close();
            }
            return bp;
        }

        public List<BloodPosting> GetAllBloodPostings()
        {
            List<BloodPosting> bpList = new List<BloodPosting>();
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.getAllBloodPostings
                };
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    BloodPosting bp = new BloodPosting();
                    bp.Id = Convert.ToInt32(reader.GetValue(reader.GetOrdinal(Constants.id)));
                    bp.BloodGroup = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.bloodGroup)));
                    bp.State = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.state)));
                    bp.Area = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.area)));
                    bp.Pincode = Convert.ToInt32(reader.GetValue(reader.GetOrdinal(Constants.pincode)));
                    bp.ContactNumber = Convert.ToInt64(reader.GetValue(reader.GetOrdinal(Constants.contactNumber)));
                    bpList.Add(bp);
                }
                reader.Close();
            }
            return bpList;
        }

        public List<Feedback> GetAllFeedbackComments()
        {
            List<Feedback> feedbackList = new List<Feedback>();
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.getAllFeedbackComments
                };
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    Feedback f = new Feedback();
                    f.HospitalName = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.hospitalName)));
                    f.State = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.state)));
                    f.Area = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.area)));
                    f.FeedbackComments = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.feedbackComments)));
                    feedbackList.Add(f);
                }
                reader.Close();
            }
            return feedbackList;
        }

        public int PostBlood(BloodPosting bp, int userId)
        {
            int result = 0;
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.postBlood
                };
                command.Parameters.Add(Constants.paramContactNumber, SqlDbType.BigInt).Value = bp.ContactNumber;
                command.Parameters.Add(Constants.paramState, SqlDbType.VarChar).Value = bp.State;
                command.Parameters.Add(Constants.paramArea, SqlDbType.VarChar).Value = bp.Area;
                command.Parameters.Add(Constants.paramPincode, SqlDbType.Int).Value = bp.Pincode;
                command.Parameters.Add(Constants.paramBloodGroup, SqlDbType.VarChar).Value = bp.BloodGroup;
                command.Parameters.Add(Constants.userId, SqlDbType.Int).Value = userId;
                result = command.ExecuteNonQuery();
            }
            return result;
        }

        public int SaveFeedbackComments(Feedback f, int userId)
        {
            int result = 0;
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.saveFeedback
                };
                command.Parameters.Add(Constants.paramHospitalName, SqlDbType.VarChar).Value = f.HospitalName;
                command.Parameters.Add(Constants.paramArea, SqlDbType.VarChar).Value = f.Area;
                command.Parameters.Add(Constants.paramFeedbackComments, SqlDbType.VarChar).Value = f.FeedbackComments;
                command.Parameters.Add(Constants.paramUserId, SqlDbType.Int).Value = userId;
                command.Parameters.Add(Constants.paramState, SqlDbType.VarChar).Value = f.State;

                result = command.ExecuteNonQuery();
            }
            return result;
        }

        public int SaveHospital(Hospital h, int userId)
        {
            int result = 0;
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.saveHospital
                };
                command.Parameters.Add(Constants.paramHospitalName, SqlDbType.VarChar).Value = h.HospitalName;
                command.Parameters.Add(Constants.paramArea, SqlDbType.VarChar).Value = h.Area;
                command.Parameters.Add(Constants.paramDate, SqlDbType.Date).Value = h.Date;
                command.Parameters.Add(Constants.paramTime, SqlDbType.Time).Value = h.Time;
                command.Parameters.Add(Constants.paramUserId, SqlDbType.Int).Value = userId;
                command.Parameters.Add(Constants.paramState, SqlDbType.VarChar).Value = h.State;

                result = command.ExecuteNonQuery();
            }
            return result;
        }

        public int RaiseQuery(RaiseQuery rq, int userId)
        {
            int result = 0;
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand()
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.raiseQuery
                };
                command.Parameters.Add(Constants.paramQuery, SqlDbType.VarChar).Value = rq.Query;
                command.Parameters.Add(Constants.paramDescription, SqlDbType.VarChar).Value = rq.Description;
                command.Parameters.Add(Constants.paramStatus, SqlDbType.VarChar).Value = rq.Status;
                command.Parameters.Add(Constants.paramUserId, SqlDbType.Int).Value = userId;
                command.Parameters.Add(Constants.paramResult, SqlDbType.VarChar).Value = rq.Result;

                result = command.ExecuteNonQuery();
            }
            return result;
        }

        public List<RaiseQuery> GetQueryStatus(int userId)
        {
            List<RaiseQuery> rqList = new List<RaiseQuery>();
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand()
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.getQueryStatus
                };
                command.Parameters.Add(Constants.paramUserId, SqlDbType.Int).Value = userId;
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    RaiseQuery rq = new RaiseQuery();
                    rq.Id = Convert.ToInt32(reader.GetValue(reader.GetOrdinal(Constants.id)));
                    rq.Query = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.query)));
                    rq.Description = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.description)));
                    rq.Status = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.status)));
                    rq.Result = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.result)));
                    rqList.Add(rq);
                }
                reader.Close();
            }
            return rqList;
        }

        public List<RaiseQuery> GetAllQueries()
        {
            List<RaiseQuery> rqList = new List<RaiseQuery>();
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand()
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.getAllQueries
                };
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    RaiseQuery rq = new RaiseQuery();
                    rq.Id = Convert.ToInt32(reader.GetValue(reader.GetOrdinal(Constants.id)));
                    rq.Query = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.query)));
                    rq.Description = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.description)));
                    rq.Status = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.status)));
                    rq.Result = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.result)));
                    rqList.Add(rq);
                }
                reader.Close();
            }
            return rqList;
        }

        public int UpdateQuery(string status, string result, int id)
        {
            int r = 0;
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand()
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.updateQuery
                };
                command.Parameters.Add(Constants.paramStatus, SqlDbType.VarChar).Value = status;
                command.Parameters.Add(Constants.paramResult, SqlDbType.VarChar).Value = result;
                command.Parameters.Add(Constants.paramId, SqlDbType.Int).Value = id;
                r = command.ExecuteNonQuery();
            }
            return r;
        }

        public List<Hospital> AlertUserToDonateBlood(int userId)
        {
            List<Hospital> hList = new List<Hospital>();
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand()
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.alertUserToDonateBlood
                };
                command.Parameters.Add(Constants.paramUserId, SqlDbType.Int).Value = userId;
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    Hospital h = new Hospital();
                    h.Id = Convert.ToInt32(reader.GetValue(reader.GetOrdinal(Constants.id)));
                    h.HospitalName = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.hospitalName)));
                    h.Area = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.city)));
                    h.Date = Convert.ToDateTime(reader.GetValue(reader.GetOrdinal(Constants.date)));
                    h.Time = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.time)));
                    hList.Add(h);
                }
                reader.Close();
            }
            return hList;
        }

        public List<BloodPosting> AlertUserSpecificMatchBlood(int userId)
        {
            List<BloodPosting> bpList = new List<BloodPosting>();
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.getBloodPostingByUserBloodMatch
                };
                command.Parameters.Add(Constants.paramUserId, SqlDbType.Int).Value = userId;
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    BloodPosting bp = new BloodPosting();
                    bp.Id = Convert.ToInt32(reader.GetValue(reader.GetOrdinal(Constants.id)));
                    bp.BloodGroup = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.bloodGroup)));
                    bp.State = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.state)));
                    bp.Area = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.area)));
                    bp.Pincode = Convert.ToInt32(reader.GetValue(reader.GetOrdinal(Constants.pincode)));
                    bp.ContactNumber = Convert.ToInt64(reader.GetValue(reader.GetOrdinal(Constants.contactNumber)));
                    bpList.Add(bp);
                }
                reader.Close();
            }
            return bpList;
        }

        public List<string> GetAllStates()
        {
            List<string> states = new List<string>();
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.getAllStates
                };
                SqlDataReader reader = command.ExecuteReader();
                while(reader.Read())
                {
                    states.Add(Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.state))));
                }
                reader.Close();
            }
            return states;
        }

        public List<string> GetAreasByState(string state)
        {
            List<string> areas = new List<string>();
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.getAllAreasByState
                };
                command.Parameters.Add(Constants.paramState, SqlDbType.VarChar).Value = state;
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    string area = Convert.ToString(reader.GetValue(reader.GetOrdinal("area")));
                    areas.Add(area);
                }
                reader.Close();
            }
            return areas;
        }

        public List<string> GetHospitalsByStateArea(string state, string area)
        {
            List<string> hospitals = new List<string>();
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.getAllHospitalByStateArea
                };
                command.Parameters.Add(Constants.paramArea, SqlDbType.VarChar).Value = area;
                command.Parameters.Add(Constants.paramState, SqlDbType.VarChar).Value = state;
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    string hospital = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.hospitalName)));
                    hospitals.Add(hospital);
                }
                reader.Close();
            }
            return hospitals;
        }

        public int RemoveBloodPosting(int id)
        {
            int result = 0;
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.removeBloodPosting
                };
                command.Parameters.Add(Constants.paramId, SqlDbType.Int).Value = id;
                result = command.ExecuteNonQuery();
            }
            return result;
        }

        public List<string> GetStateFromHospitalById(int userId)
        {
            List<string> states = new List<string>();
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.getStatesFromHospital
                };
                command.Parameters.Add(Constants.paramUserId, SqlDbType.Int).Value = userId;
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    states.Add(Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.state))));
                }
                reader.Close();
            }
            return states;
        }

        public List<string> GetAreaFromHospitalByState(int userId, string state)
        {
            List<string> areas = new List<string>();
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.getAreasFromHospitalByState
                };
                command.Parameters.Add(Constants.paramUserId, SqlDbType.Int).Value = userId;
                command.Parameters.Add(Constants.paramState, SqlDbType.VarChar).Value = state;
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    string area = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.area)));
                    areas.Add(area);
                }
                reader.Close();
            }
            return areas;
        }

        public List<string> GetHospitalNameFromHospital(int userId, string state, string area)
        {
            List<string> hospitals = new List<string>();
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.getHospitalNameFromHospital
                };
                command.Parameters.Add(Constants.paramUserId, SqlDbType.Int).Value = userId;
                command.Parameters.Add(Constants.paramArea, SqlDbType.VarChar).Value = area;
                command.Parameters.Add(Constants.paramState, SqlDbType.VarChar).Value = state;
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    string hospital = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.hospitalName)));
                    hospitals.Add(hospital);
                }
                reader.Close();
            }
            return hospitals;
        }
    }
}
