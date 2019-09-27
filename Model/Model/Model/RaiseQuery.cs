namespace Model
{
    public class RaiseQuery
    {
        private int id;
        private string query;
        private string description;
        private string status;
        private string result;

        public RaiseQuery()
        {

        }

        public RaiseQuery(int id, string query, string description, string status, string result)
        {
            this.Id = id;
            this.Query = query;
            this.Description = description;
            this.Status = status;
            this.Result = result;
        }

        public int Id
        {
            get
            {
                return id;
            }

            set
            {
                id = value;
            }
        }

        public string Query
        {
            get
            {
                return query;
            }

            set
            {
                query = value;
            }
        }

        public string Description
        {
            get
            {
                return description;
            }

            set
            {
                description = value;
            }
        }

        public string Status
        {
            get
            {
                return status;
            }

            set
            {
                status = value;
            }
        }

        public string Result
        {
            get
            {
                return result;
            }

            set
            {
                result = value;
            }
        }
    }
}
