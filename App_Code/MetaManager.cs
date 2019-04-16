using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MetaManager
/// </summary>
public class MetaManager
{
    public MetaManager()
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
    public void AddNew(MetaTBx prd)
    {
        db.MetaTBxes.InsertOnSubmit(prd);
        Save();
    }
    public MetaTBx GetByID(int id)
    {
        try
        {
            return db.MetaTBxes.Where(e => e.Id == id && e.Status != -1).First();
        }
        catch (Exception)
        {
            return new MetaTBx();
        }
    }

    public List<MetaTBx> GetList()
    {
        try
        {
            return db.MetaTBxes.Where(u => u.Status == 1).ToList();
        }
        catch (Exception)
        {
            return null;
        }
    }


}
