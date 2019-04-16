using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BrandManager
/// </summary>
public class BrandManager
{
    DataClassesDataContext DB = new DataClassesDataContext();
    public void Add(BrandTBx brand)
    {
        DB.BrandTBxes.InsertOnSubmit(brand);
        DB.SubmitChanges();
    }
    public void Save()
    {
        DB.SubmitChanges();
    }

    public List<BrandTBx> GetList()
    {
        return DB.BrandTBxes.Where(e => e.Status == 1).ToList();
    }

    public void Delete(int id)
    {
        DB.BrandTBxes.Where(e => e.ID == id).First().Status = -1;
        DB.SubmitChanges();
    }

    public BrandTBx GetByID(int id)
    {
        return DB.BrandTBxes.Where(e => e.ID == id).FirstOrDefault();
    }
}