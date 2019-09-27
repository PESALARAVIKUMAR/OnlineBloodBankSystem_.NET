namespace Model
{
    public class BloodAvailability
    {
        private int id;
        private string bloodGroup;
        private string state;
        private string area;
        private int pincode;
        private long contactNumber;

        public BloodAvailability()
        {

        }

        public BloodAvailability(int id, string bloodGroup, string state, 
            string area, int pincode, long contactNumber)
        {
            this.Id = id;
            this.bloodGroup = bloodGroup;
            this.state = state;
            this.area = area;
            this.pincode = pincode;
            this.contactNumber = contactNumber;
        }

        public string BloodGroup
        {
            get
            {
                return bloodGroup;
            }

            set
            {
                bloodGroup = value;
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

        public int Pincode
        {
            get
            {
                return pincode;
            }

            set
            {
                pincode = value;
            }
        }

        public long ContactNumber
        {
            get
            {
                return contactNumber;
            }

            set
            {
                contactNumber = value;
            }
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

        public override string ToString()
        {
            return string.Format("{0}{1}{2}{3}{4}", this.bloodGroup, 
                this.state, this.area, this.pincode, this.contactNumber);
        }

    }
}
