using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PageManager
/// </summary>
public class PageManager
{

    DataClassesDataContext db = new DataClassesDataContext();
    public void Save()
    {
        db.SubmitChanges();
    }
    public void AddNew(PageTBx prd)
    {
        db.PageTBxes.InsertOnSubmit(prd);
        Save();
    }
    public PageTBx GetByID(int id)
    {

        return db.PageTBxes.FirstOrDefault(e => e.ID == id && e.Status != -1);
    }

    public PageTBx GetByName(string name)
    {

        return db.PageTBxes.FirstOrDefault(e => e.Name == name && e.Status != -1);
    }

    public List<PageTBx> GetList()
    {
        return db.PageTBxes.Where(u => u.Status == 1).ToList();
    }

}