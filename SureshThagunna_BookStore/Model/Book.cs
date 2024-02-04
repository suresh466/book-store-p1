using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SureshThagunna_BookStore.Model
{
    // Book business class
    public class Book
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public int GenreId { get; set; }
        public decimal Price { get; set; }
        public string PublicationDate { get; set; }
        public string CoverImage { get; set; }
    }

}