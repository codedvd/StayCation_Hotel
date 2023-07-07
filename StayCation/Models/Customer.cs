using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace StayCation.Models
{
    public class Customer
    {
        public Customer ()
        {
            Id = Guid.NewGuid();
            RegisteredOn = DateTime.Now;
        }

        //data annotation
        [Key]
        public Guid Id { get; set; }
        [Required]
        [DisplayName("First Name")]
        public string? FirstName { get; set; }

        [Required]
        [DisplayName("Last Name")]
        public string? LastName { get; set; }

        [Required]
        [DisplayName("Email Adress")]
        public string? Email { get; set; }

        [Required]
        //[DisplayName("Password"), Range(8, 20, ErrorMessage = "Must be between 8 - 20 char")]
        public string? Password { get; set; }

        public DateTime? RegisteredOn { get; set; }  

        [DisplayName("User Name")]
        public string? UserName { get; set; }

       
        //[MaxLength(11), Range(7, 11, ErrorMessage = "Phone number can't be more than 11 or less then 7")]
        [DisplayName("Phone Number")]
        public string? Phone { get; set; }

       
        public Customer(Guid Id, string f_name, string userName, string email, string pwd,  string phone, DateTime date)
        {
            
        }

    }
}
