using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ContactManager
/// </summary>
public class ContactManager
{
    public ContactManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    DataClassesDataContext db = new DataClassesDataContext();
    public void Save()
    {
        db.SubmitChanges();
    }
    public void AddNew(ContactTBx prd)
    {
        db.ContactTBxes.InsertOnSubmit(prd);
        Save();
    }
    public ContactTBx GetByID(int id)
    {
        try
        {
            return db.ContactTBxes.Where(e => e.Id == id && e.Status != -1).First();
        }
        catch (Exception)
        {
            return new ContactTBx();
        }
    }

    public List<ContactTBx> GetList()
    {
        try
        {
            return db.ContactTBxes.Where(u => u.Status == 1).ToList();
        }
        catch (Exception)
        {
            return null;
        }
    }


}