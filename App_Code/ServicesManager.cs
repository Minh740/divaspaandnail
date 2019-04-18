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
        return db.ServicesTBxes.Where(u => u.Status != -1).OrderBy(u => u.ID).ToList();
    }
    // get serviced by name
    public ServicesTBx GetServiceByServiceName(string name)
    {
        return db.ServicesTBxes.Where(u => u.Name == name && u.Status == 1).FirstOrDefault();
    }
    //
    public List<ServicesTBx> GetListServiceBySerciceId(int id)
    {
        return db.ServicesTBxes.Where(v => v.ID == id && v.Status == 1).ToList();
    }
}