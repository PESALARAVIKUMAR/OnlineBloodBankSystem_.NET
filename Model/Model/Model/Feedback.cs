namespace Model
{
    public class Feedback
    {
        private string hospitalName;
        private string state;
        private string area;
        private string feedbackComments;

        public Feedback()
        {
                         
        }

        public Feedback(string hospitalName, string area, string state, string feedbackComments)
        {
            this.hospitalName = hospitalName;
            this.area = area;
            this.feedbackComments = feedbackComments;
            this.state = state;
        }

        public string HospitalName
        {
            get
            {
                return hospitalName;
            }

            set
            {
                hospitalName = value;
            }
        }

        public string Area
        {
            get
            {
                return area;
            }

            set
            {
                area = value;
            }
        }

        public string FeedbackComments
        {
            get
            {
                return feedbackComments;
            }

            set
            {
                feedbackComments = value;
            }
        }

        public string State
        {
            get
            {
                return state;
            }

            set
            {
                state = value;
            }
        }

        public override string ToString()
        {
            return string.Format("{0}{1}{2}{3}", this.hospitalName, this.state, this.area, this.feedbackComments);
        }

    }
}
