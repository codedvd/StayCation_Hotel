using StayCation.Models;

namespace StayCation.Repository
{
    public interface IRepository
    {
        List<Customer> ReadCustomersFromFile(string filePath);
        string HashPassword(string password);
        List<PictureData> GetHotels();
    }
}
