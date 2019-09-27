using Model;


namespace DAO
{
    interface UserInterface
    {
        // Saves User after registration
        int SaveUser(User u);

        //Get User by password for Login Validation & Check Existence
        User GetUser(int userId);
        User GetUser(string email);
        int UserExist(string email);
        int UserExist(long contactNumber);
        //string SendEmailToResetPassword(string toEmail);

        string EncryptPassword(string password);

    }
}
