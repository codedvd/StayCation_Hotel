CREATE TABLE [dbo].[PictureDb]
(
	[hotelImageUrl] VARCHAR(200) NOT NULL, 
    [hotelName] VARCHAR(200) NOT NULL, 
    [hotelLocation] VARCHAR(200) NOT NULL, 
    [hotelPrice] NVARCHAR(50) NULL, 
    [hotelDescription] VARCHAR(300) NULL, 
    [hotelGroup] VARCHAR(200) NULL, 
    [hotelPopularity] VARCHAR(200) NULL, 
    [IsPopular] VARCHAR(20) NULL
)

/*
  public string? Name { get; set; }
        public string? City { get; set; }
        public string? Location { get; set; }
        public string? Price { get; set; }
        public string? Description { get; set; }
        public string? Type { get; set; }
        public string? Popularity { get; set; }
        public bool Ispopular { get; set; }

*/
 