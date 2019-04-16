using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BookingManager
/// </summary>
public class BookingManager
{
    DataClassesDataContext DB = new DataClassesDataContext();
    public void Add(BookingTBx booking)
    {
        DB.BookingTBxes.InsertOnSubmit(booking);
        DB.SubmitChanges();
    }
    public void Save()
    {
        DB.SubmitChanges();
    }
    public List<BookingTBx> GetList()
    {
        return DB.BookingTBxes.Where(e => e.Status == 1).OrderByDescending(e => e.ID).ToList();
    }
    public BookingTBx GetByID(int ID)
    {
        return DB.BookingTBxes.Where(e => e.Status == 1 && e.ID == ID).FirstOrDefault();
    }
}