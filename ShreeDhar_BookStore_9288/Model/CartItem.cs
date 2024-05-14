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

namespace ShreeDhar_BookStore_9288.Model
{
    public class CartItem
    {
        public CartItem() { }



        public CartItem(TheBook theBook, int quantity)

        {

            this.TheBook = theBook;

            this.Quantity = quantity;

        }



        public TheBook TheBook { get; set; }

        public int Quantity { get; set; }



        public void AddQuantity(int quantity)

        {

            this.Quantity += quantity;

        }



        public string Display()

        {

            string displayString = string.Format("{0} ({1} at {2})",

                TheBook.BookTitle,

                Quantity.ToString(),

                TheBook.Price.ToString("c")

            );

            return displayString;

        }

    }
}

