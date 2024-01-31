using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SureshThagunna_BookStore.Model
{
    // Books table schema:
    // Id: int, primary key
    // Title: string
    // Author: string
    // GenreId: int, foreign key referencing Genre table
    // Price: decimal
    // PublicationDate: DateTime
    // CoverImage: string

    // Genre table schema:
    // Id: int, primary key
    // Name: string

    public class Book
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public int GenreId { get; set; }
        public decimal Price { get; set; }
        public DateTime PublicationDate { get; set; }
        public string CoverImage { get; set; }
    }

}