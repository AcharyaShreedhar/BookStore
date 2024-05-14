/*
Author: Shree Dhar Acharya
Student ID: 8899288
Date: 30th September 2023
Application: ShreeDhar_BookStore_9288
*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShreeDhar_BookStore_9288
{
    public class TheBook
    {
        
        public int BookID { get; set; }
        public string BookTitle { get; set; }
        public string Author { get; set; }
        public int GenreID { get; set; }
        public string GenreName { get; set; }
        public decimal Price { get; set; }
        public string ISBN { get; set; } 
        public string Publisher { get; set; }
        public DateTime PublishDate { get; set; }
        public string Description { get; set; }
        public int Pages { get; set; }
        public string Language { get; set; }
        public string Edition { get; set; }
        public string ImageUrl { get; set; }

        public TheBook(int bookID, string bookTitle, string author, int genreID,string genre, decimal price,
                      string isbn, string publisher, DateTime publishDate, string description,
                      int pages, string language, string edition, string imageUrl)
        {
            BookID = bookID;
            BookTitle = bookTitle;
            Author = author;
            GenreID = genreID;
            GenreName = genre;
            Price = price;
            ISBN = isbn;
            Publisher = publisher;
            PublishDate = publishDate;
            Description = description;
            Pages = pages;
            Language = language;
            Edition = edition;
            ImageUrl = imageUrl;
        }

        public TheBook()
        {
        }
    }
}