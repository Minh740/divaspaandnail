using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for NewManager
/// </summary>
public class NewManager
{
    public NewManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    DataClassesDataContext DB = new DataClassesDataContext();
    public void Save()
    {
        DB.SubmitChanges();
    }
    public void AddNew(NewsTBx item)
    {
        DB.NewsTBxes.InsertOnSubmit(item);
        Save();
    }

    public NewsTBx GetByID(int ID)
    {
        return DB.NewsTBxes.Where(u => u.NewsStatus != -1 && u.NewsID == ID).FirstOrDefault();
    }


    public List<NewsTBx> GetList()
    {
        return DB.NewsTBxes.Where(u => u.NewsStatus != -1).OrderByDescending(x => x.NewsID).ToList();
    }
}