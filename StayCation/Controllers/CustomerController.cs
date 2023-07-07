using Microsoft.AspNetCore.Mvc;
using StayCation.Models;
using StayCation.Repository;
using System.Data.SqlClient;

namespace StayCation.Controllers
{
    public class CustomerController : Controller
    {
        private readonly IRepository _repository;
        private readonly IConfiguration _configuration;
        public CustomerController(IRepository repository, IConfiguration configuration)
        {
            _repository = repository;
            _configuration = configuration;
        }

        [HttpGet]
        public IActionResult LogIn()
        {
            return View();
        }

        [HttpPost]
        public IActionResult LogIn(Customer obj)
        {
            var allRegUsers = _repository.ReadCustomersFromFile("StaycationCustomer.txt");
            string email = obj.Email;
            string pwd = obj.Password;

            // Check if the user exists in the file data
            var correctUser = allRegUsers.FirstOrDefault(user => user.Email == email && user.Password == _repository.HashPassword(pwd));

            if (correctUser != null)
            {
                TempData["success"] = "Login successfully";
                return RedirectToAction("SignUp");
            }
            else
            {
                string connectString = _configuration.GetConnectionString("Default");
                using (SqlConnection con = new SqlConnection(connectString))
                {
                    SqlCommand cmd = new();
                    cmd.CommandText = "SELECT COUNT(*) FROM RegisteredUser WHERE Email = @Email AND UPassword = @Password";
                    cmd.Connection = con;

                    // Add parameters to the command
                    cmd.Parameters.AddWithValue("@Email", email); // Provide the email value
                    cmd.Parameters.AddWithValue("@Password", _repository.HashPassword(pwd)); // Provide the password value

                    con.Open();

                    int count = (int)cmd.ExecuteScalar();

                    if (count > 0)
                    {
                        TempData["success"] = "Login successful";
                        return RedirectToAction("SignUp");
                    }
                    else
                    {
                        // Login failed
                        TempData["error"] = "Incorrect Credentials!";
                       
                    }
                }
            }
            return View();
        }

        [HttpGet]
        public IActionResult SignUp()
        {
            return View();
        }

        [HttpPost]
        public IActionResult SignUp(Customer obj)
        {

            if (ModelState.IsValid)
            {
                using (StreamWriter sw = new StreamWriter("StaycationCustomer.txt", true))
                {
                    sw.WriteLine($"| {obj.Id} | {obj.FirstName} {obj.LastName} | {obj.UserName} | {obj.Email} | {_repository.HashPassword(obj.Password)} | {obj.Phone}| {obj.RegisteredOn}");
                }

                string connectString = _configuration.GetConnectionString("Default");
                using (SqlConnection con = new SqlConnection(connectString))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "INSERT INTO RegisteredUser(Id, FirstName, LastName, Email, UPassword, UserName, Phone, DateTime) " +
                                      "VALUES (@Id, @FirstName, @LastName, @Email, @UPassword, @UserName, @Phone, @DateTime)";
                    cmd.Connection = con;

                    // Add parameters to the command
                    cmd.Parameters.AddWithValue("@Id", obj.Id);
                    cmd.Parameters.AddWithValue("@FirstName", obj.FirstName);
                    cmd.Parameters.AddWithValue("@LastName", obj.LastName);
                    cmd.Parameters.AddWithValue("@Email", obj.Email);
                    cmd.Parameters.AddWithValue("@UPassword", _repository.HashPassword(obj.Password));
                    cmd.Parameters.AddWithValue("@UserName", obj.UserName);
                    cmd.Parameters.AddWithValue("@Phone", obj.Phone);
                    cmd.Parameters.AddWithValue("@DateTime", obj.RegisteredOn);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }


                TempData["success"] = "Registeration successfully";
                return RedirectToAction("LogIn");
            }
            return View();
        }

    }
}
