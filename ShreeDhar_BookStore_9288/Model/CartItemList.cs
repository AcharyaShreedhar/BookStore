/*
Author: Shree Dhar Acharya
Student ID: 8899288
Date: 30th September 2023
Application: ShreeDhar_BookStore_9288
*/

using ShreeDhar_BookStore_9288;
using ShreeDhar_BookStore_9288.Model;
using System;
using System.Collections.Generic;
using System.Web;
public class CartItemList
{
    //internal list of items and the constructor that instantiates it
    private List<CartItem> cartItems;
    public CartItemList()
    {
        cartItems = new List<CartItem>();
    }
    //read-only property that returns the number of items in the internal list
    public int Count
    {
        get { return cartItems.Count; }
    }
    //indexers that locate items in the internal list by index or product id
    public CartItem this[int index]
    {

        get { return cartItems[index]; }
    }
    public CartItem this[string id] { 
        get {
            foreach (CartItem c in cartItems)
                if (c.TheBook.BookID.ToString() == id) return c;
                    return null;
        }
    }
//static method to get the cart object from session state
public static CartItemList GetCartOrCreateIt()
{
    CartItemList cart = (CartItemList)HttpContext.Current.Session["Cart"];
    if (cart == null)
        HttpContext.Current.Session["Cart"] = new CartItemList();
    return (CartItemList)HttpContext.Current.Session["Cart"];
}
//methods that add, remove, and clear items in the internal list
public void AddItem(TheBook theBook, int quantity)
{
    CartItem c = new CartItem(theBook, quantity);
    cartItems.Add(c);
}
public void RemoveAt(int index)
{
    cartItems.RemoveAt(index);
}
public void Clear()
{
    cartItems.Clear();
}
}

