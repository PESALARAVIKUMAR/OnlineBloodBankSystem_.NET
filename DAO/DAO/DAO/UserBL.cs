using System;
using System.Text;
using Model;
using System.Data.SqlClient;
using System.Data;
using System.Security.Cryptography;

namespace DAO
{
    public class UserBL : UserInterface
    {
        public User GetUser(int userId)
        {
            User user = new User();
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand()
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.userDetailsById
                };

                command.Parameters.Add(Constants.paramUserId, SqlDbType.VarChar).Value = userId;
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    user.Id = Convert.ToInt32(reader.GetValue(reader.GetOrdinal(Constants.id)));
                    user.FirstName = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.firstName)));
                    user.LastName = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.lastName)));
                    user.Age = Convert.ToInt32(reader[Constants.age]);
                    user.Gender = Convert.ToString(reader[Constants.gender]);
                    user.ContactNumber = Convert.ToInt64(reader[Constants.contactNumber]);
                    user.Email = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.email)));
                    user.Weight = Convert.ToInt32(reader.GetValue(reader.GetOrdinal(Constants.weight)));
                    user.State = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.state)));
                    user.Area = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.area)));
                    user.Pincode = Convert.ToInt32(reader.GetValue(reader.GetOrdinal(Constants.pincode)));
                    user.BloodGroup = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.bloodGroup)));
                    user.Password = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.password)));
                }
                reader.Close();
            }
            return user;
        }

        public User GetUser(string email)
        {
            User user = new User();
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand()
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.userDetailsByEmail
                };

                command.Parameters.Add(Constants.paramEmail, SqlDbType.VarChar).Value = email;
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    user.Id = Convert.ToInt32(reader.GetValue(reader.GetOrdinal(Constants.id)));
                    user.FirstName = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.firstName)));
                    user.LastName = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.lastName)));
                    user.Age = Convert.ToInt32(reader.GetValue(reader.GetOrdinal(Constants.age)));
                    user.Gender = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.gender)));
                    user.ContactNumber = Convert.ToInt64(reader.GetValue(reader.GetOrdinal(Constants.contactNumber)));
                    user.Email = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.email)));
                    user.Weight = Convert.ToInt32(reader.GetValue(reader.GetOrdinal(Constants.weight)));
                    user.State = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.state)));
                    user.Area = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.area)));
                    user.Pincode = Convert.ToInt32(reader.GetValue(reader.GetOrdinal(Constants.pincode)));
                    user.BloodGroup = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.bloodGroup)));
                    user.Password = Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.password)));
                }
                reader.Close();
            }
            return user;
        }

        public int UserExist(string userEmail)
        {
            int result = 0;
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand()
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.userDetails
                };

                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    if ((Convert.ToString(reader.GetValue(reader.GetOrdinal(Constants.email))).Equals(userEmail)))
                    {
                        result = 1;
                        break;
                    }
                }
                reader.Close();
            }
            return result;
        }

        public int SaveUser(User u)
        {
            int result = 0;
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.registerUser
                };
                command.Parameters.Add(Constants.paramFirstName, SqlDbType.Char).Value = u.FirstName;
                command.Parameters.Add(Constants.paramLastName, SqlDbType.Char).Value = u.LastName;
                command.Parameters.Add(Constants.paramAge, SqlDbType.Int).Value = u.Age;
                command.Parameters.Add(Constants.paramGender, SqlDbType.VarChar).Value = u.Gender;
                command.Parameters.Add(Constants.paramContactNumber, SqlDbType.BigInt).Value = u.ContactNumber;
                command.Parameters.Add(Constants.paramEmail, SqlDbType.NVarChar).Value = u.Email;
                command.Parameters.Add(Constants.paramPassword, SqlDbType.VarChar).Value = u.Password;
                command.Parameters.Add(Constants.paramWeight, SqlDbType.Int).Value = u.Weight;
                command.Parameters.Add(Constants.paramState, SqlDbType.VarChar).Value = u.State;
                command.Parameters.Add(Constants.paramArea, SqlDbType.VarChar).Value = u.Area;
                command.Parameters.Add(Constants.paramPincode, SqlDbType.Int).Value = u.Pincode;
                command.Parameters.Add(Constants.paramBloodGroup, SqlDbType.VarChar).Value = u.BloodGroup;
                result = command.ExecuteNonQuery();
            }
            return result;
        }

        public string EncryptPassword(string password)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            //compute hash from the bytes of text
            md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(password));
            //get hash result after compute it
            byte[] result = md5.Hash;
            StringBuilder strBuilder = new StringBuilder();
            for (int i = 0; i < result.Length; i++)
            {
                //change it into 2 hexadecimal digits for each byte
                strBuilder.Append(result[i].ToString("x2"));
            }
            return strBuilder.ToString();
        }

        public int UserExist(long contactNumber)
        {
            int result = 0;
            using (SqlConnection con = new SqlConnection(Queries.connection))
            {
                con.Open();
                SqlCommand command = new SqlCommand()
                {
                    Connection = con,
                    CommandType = CommandType.Text,
                    CommandText = Queries.userDetails
                };

                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    if ((Convert.ToInt64(reader.GetValue(reader.GetOrdinal(Constants.contactNumber))).Equals(contactNumber)))
                    {
                        result = 1;
                        break;
                    }
                }
                reader.Close();
            }
            return result;
        }

        /*
public string SendEmailToResetPassword(string toEmail)
{
   string result = "";
   try
   {
       MailMessage mailMessage = new MailMessage("pesala1pesala@gmail.com", toEmail);

       StringBuilder emailBody = new StringBuilder();
       emailBody.Append("Dear User, <br/><br/>");
       emailBody.Append("Please click on the following link to reset your password <br/><br/>");
       emailBody.Append("http://localhost:62802/ResetPassword.aspx <br/><br/>");
       emailBody.Append("Online Blood Bank Support");

       mailMessage.IsBodyHtml = true;
       mailMessage.Body = emailBody.ToString();

       SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
       smtpClient.Credentials = new System.Net.NetworkCredential()
       {
           UserName = "pesala1pesala@gmail.com",
           Password = "9952901215"
       };
       smtpClient.EnableSsl = true;
       smtpClient.Send(mailMessage);
       result = "Success";
   }
   catch(Exception ee)
   {
       result = ee.ToString();
   }
   return result;
}
*/

    }
}
