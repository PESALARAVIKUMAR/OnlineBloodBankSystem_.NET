namespace Model
{
    public class User
    {
        private int id;
        private string firstName;
        private string lastName;
        private int age;
        private string gender;
        private long contactNumber;
        private string email;
        private string password;
        private int weight;
        private string state;
        private string area;
        private int pincode;
        private string bloodGroup;

        public User()
        {

        }

        public User(int id, string firstName, string lastName, int age,
            string gender, long contactNumber, string email,
            string password, int weight, string state,
            string area, int pincode, string bloodGroup)
        {
            this.Id = id;
            this.FirstName = firstName;
            this.LastName = lastName;
            this.Age = age;
            this.Gender = gender;
            this.ContactNumber = contactNumber;
            this.Email = email;
            this.Password = password;
            this.Weight = weight;
            this.State = state;
            this.Area = area;
            this.Pincode = pincode;
            this.BloodGroup = bloodGroup;
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

        public string FirstName
        {
            get
            {
                return firstName;
            }

            set
            {
                firstName = value;
            }
        }

        public string LastName
        {
            get
            {
                return lastName;
            }

            set
            {
                lastName = value;
            }
        }

        public int Age
        {
            get
            {
                return age;
            }

            set
            {
                age = value;
            }
        }

        public string Gender
        {
            get
            {
                return gender;
            }

            set
            {
                gender = value;
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

        public string Email
        {
            get
            {
                return email;
            }

            set
            {
                email = value;
            }
        }

        public string Password
        {
            get
            {
                return password;
            }

            set
            {
                password = value;
            }
        }

        public int Weight
        {
            get
            {
                return weight;
            }

            set
            {
                weight = value;
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

    }
}
