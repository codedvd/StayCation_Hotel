using Microsoft.Extensions.Configuration;
using StayCation.Models;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace StayCation.Repository
{
    public class Repository : IRepository
    {
       private readonly IConfiguration _configuration;
        public Repository(IConfiguration configuration)
        {
           _configuration = configuration;
        }
        public List<Customer> ReadCustomersFromFile(string filePath)
        {
            List<Customer> customers = new List<Customer>();

            using (StreamReader reader = new StreamReader(filePath))
            {
                string line;
                while ((line = reader.ReadLine()) != null)
                {
                    if (!string.IsNullOrWhiteSpace(line))
                    {
                        string[] fields = line.Split('|');

                        if (fields.Length >= 7)
                        {
                            Guid id = Guid.Parse(fields[1].Trim());
                            string Name = fields[2].Trim();
                            string userName = fields[3].Trim();
                            string email = fields[4].Trim();
                            string password = fields[5].Trim();
                            string phone = fields[6].Trim();
                            DateTime date =   DateTime.Parse(fields[7].Trim());


                            Customer customer = new Customer(id, Name, userName, email, password, phone,date);
                            customers.Add(customer);
                        }
                    }
                }
            }
            return customers;
        }

        public string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                return Convert.ToBase64String(hashedBytes);
            }
        }

        //public List<PictureData> ReadPropertiesFromFile(string filePath)
        //{
        //    List<PictureData> properties = new List<PictureData>();

        //    using (StreamReader reader = new StreamReader(filePath))
        //    {
        //        string line;
        //        while ((line = reader.ReadLine()) != null)
        //        {
        //            if (!string.IsNullOrWhiteSpace(line))
        //            {
        //                string[] fields = line.Split('|');

        //                if (fields.Length >= 7)
        //                {
        //                    string name = fields[1].Trim();
        //                    string city = fields[2].Trim();
        //                    string location = fields[3].Trim();
        //                    string price = fields[4].Trim();
        //                    string description = fields[5].Trim();
        //                    string type = fields[6].Trim();
        //                    string popularity = fields[7].Trim();
        //                    bool ispopular = bool.Parse(fields[8].Trim());

        //                    PictureData property = new PictureData(name, city, location, price, description, type, popularity, ispopular);
        //                    properties.Add(property);
        //                }
        //            }
        //        }
        //    }

        //    return properties;
        //}

        public List<PictureData> GetHotels()
        {
            string connectString = _configuration.GetConnectionString("Default");
            using (SqlConnection connection = new(connectString))
            {
                string query = "SELECT * FROM PictureDb";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        List<PictureData> hotels = new List<PictureData>();

                        while (reader.Read())
                        {
                             
                            string hotelImageUrl = reader.GetString(reader.GetOrdinal("hotelImageUrl"));
                            string hotelName = reader.GetString(reader.GetOrdinal("hotelName"));
                            string hotelLocation = reader.GetString(reader.GetOrdinal("hotelLocation"));
                            string hotelPrice = reader.GetString(reader.GetOrdinal("hotelPrice"));
                            string  hotelGroup = reader.GetString(reader.GetOrdinal("hotelGroup"));
                            string hotelDescription = reader.GetString(reader.GetOrdinal("hotelDescription"));
                            string hotelPopularity = reader.GetString(reader.GetOrdinal("hotelPopularity"));
                            string isPopular = reader.GetString(reader.GetOrdinal("isPopular"));

                            var hotel = new PictureData(hotelImageUrl, hotelName, hotelLocation, hotelPrice, hotelDescription, hotelGroup, hotelPopularity, isPopular);

                            hotels.Add(hotel);
                        }

                        return hotels;
                    }
                }
            }
        }
    }
}
