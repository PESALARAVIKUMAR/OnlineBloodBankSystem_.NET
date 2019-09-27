namespace DAO
{
    public static class Queries
    {
        public static string connection = ConnectionHandler.GetConnection();

        public static string registerUser = "insert into [users] values(@fisrtName, @lastName, @age, " +
            "@gender, @contactNumber, @email, @password, @weight, @state ,@area ,@pincode ,@bloodGroup)";
        public static string postBlood = "insert into [blood posting]([Blood Group],State,Area,[Pin Code],[Contact Number],us_id) " +
            "values(@bloodGroup, @state, @area, @pincode,  @contactNumber, @userId)";
        public static string removeBloodPosting = "delete from [blood posting] where id=@id";
        public static string userDetailsById = "select * from [users](nolock) where [id]=@userId";
        public static string userDetailsByEmail = "select * from [users](nolock) where [Email]=@email";
        public static string userDetails = "select * from [users](nolock)";
        public static string bloodAvailabilityCheck = "select * from [blood availability](nolock) " +
            "where [State]=@state and [Area]=@area and [Blood Group]=@bloodGroup";
        public static string getAllBloodAvailabilities = "select * from [blood availability](nolock)";
        public static string raiseQuery = "insert into [queires](query,description,status,result,us_id) " +
            "values(@query,@description,@status,@result,@userId)";
        public static string getQueryStatus = "select * from [queires](nolock) where us_id=@userId";
        public static string getAllQueries = "select * from [queires](nolock)";
        public static string updateQuery = "update [queires] set status=@status,result=@result where id=@id";
        public static string alertUserToDonateBlood = "select * from [hospital](nolock) h " +
            "where DATEDIFF(DAY,h.Date,GETDATE())>=90 and us_id=@userId";
        public static string getAllBloodPostings = "select * from [blood posting](nolock)";
        public static string getAllFeedbackComments = "select * from [feedback](nolock)";
        public static string saveDonorBloodDetails = "insert into [blood availability]([Blood Group],State,Area,[Pin Code],[Contact Number],us_id) " +
            "values(@bloodGroup,@state,@area,@pincode,@contactNumber,@userId)";
        public static string saveHospital = "insert into [hospital]([Hospital Name],Area,Date,Time,us_id,state) " +
            "values(@hospitalName,@area,@date,@time,@userId,@state)";
        public static string saveFeedback = "insert into [feedback]([Hospital Name],Area,[Feedback Comments],us_id,[state]) " +
            "values(@hospitalName,@area,@feedbackComments,@userId,@state)";
        public static string getBloodPostingById = "select * from [blood posting](nolock) where id=@id";
        public static string getBloodPostingByUserBloodMatch = "select * from [blood posting](nolock) " +
            "where [Blood Group] in (select [Blood Group] from [users](nolock) where id=@userId)";
        public static string getAllStates = "select [state] from [states](nolock)";
        public static string getAllAreasByState = "select [area] from [areas](nolock) where [state_id] in " +
            "(select id from states where state=@state)";
        public static string getAllHospitalByStateArea = "select [Hospital Name] from [HospitalList] h join [areas] a " +
            "on h.area_id=a.id join [states] s on a.state_id=s.id where a.area=@area and s.state=@state";
        public static string getStatesFromHospital = "select distinct(state) from [hospital] where us_id=@userId";
        public static string getAreasFromHospitalByState = "select distinct(Area) from [hospital] where us_id=@userId and state=@state";
        public static string getHospitalNameFromHospital = "select distinct([Hospital Name]) from [hospital] " +
            "where us_id=@userId and state=@state and area=@area";
    }
}
