using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ServicesManager
/// </summary>
public class ServicesManager
{
    DataClassesDataContext db = new DataClassesDataContext();
    public void Save()
    {
        db.SubmitChanges();
    }
    public void AddNew(ServicesTBx ele)
    {
        db.ServicesTBxes.InsertOnSubmit(ele);
        Save();
    }
    public ServicesTBx GetByID(int id)
    {
        return db.ServicesTBxes.Where(u => u.ID == id && u.Status != -1).FirstOrDefault();
    }


    public List<ServicesTBx> GetList()
    {
        return db.ServicesTBxes.Where(u => u.Status != -1).OrderBy(t=>t.CategoryTBx.Name).ToList();
    }


}