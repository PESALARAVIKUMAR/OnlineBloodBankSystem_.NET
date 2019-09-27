using System.Configuration;

namespace DAO
{
    public class ConnectionHandler
    {
        static string connectionVariable = ConfigurationManager.ConnectionStrings[Constants.connectionString].ToString();
        public static string GetConnection()
        {
            return connectionVariable;
        }
    }
}
