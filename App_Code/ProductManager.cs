using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ProductManager
/// </summary>
public class ProductManager
{
    DataClassesDataContext DB = new DataClassesDataContext();
    public void Save()
    {
        DB.SubmitChanges();
    }
    public void AddNew(ProductTBx ele)
    {
        DB.ProductTBxes.InsertOnSubmit(ele);
        Save();
    }
    public ProductTBx GetByID(int id)
    {
        return DB.ProductTBxes.FirstOrDefault(e => e.ID == id && e.Status != -1);
    }

    public List<ProductTBx> GetList()
    {
        return DB.ProductTBxes.Where(u => u.Status != -1).ToList();
    }
}