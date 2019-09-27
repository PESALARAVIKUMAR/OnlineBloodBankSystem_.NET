using System;

namespace Model
{
    public class Hospital
    {
        private int id;
        private string hospitalName;
        private string area;
        private string state;
        private DateTime date;
        private string time;

        public Hospital()
        {

        }

        public Hospital(int id, string hospitalName, string area,string state, DateTime date, string time)
        {
            this.Id = id;
            this.hospitalName = hospitalName;
            this.area = area;
            this.state = state;
            this.date = date;
            this.time = time;
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

        public DateTime Date
        {
            get
            {
                return date;
            }

            set
            {
                date = value;
            }
        }

        public string Time
        {
            get
            {
                return time;
            }

            set
            {
                time = value;
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
            return string.Format("{0}{1}{2}{3}{4}", this.hospitalName,this.state, this.area, this.date, this.time);
        }

    }
}
