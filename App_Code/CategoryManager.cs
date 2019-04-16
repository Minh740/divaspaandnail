using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CategoryManager
/// </summary>
public class CategoryManager
{
    DataClassesDataContext db = new DataClassesDataContext();
    public void Save()
    {
        db.SubmitChanges();
    }
    public void AddNew(CategoryTBx ele)
    {
        db.CategoryTBxes.InsertOnSubmit(ele);
        Save();
    }
    public CategoryTBx GetByID(int id)
    {
        return db.CategoryTBxes.FirstOrDefault(e => e.ID == id && e.Status != -1);
    }

    public List<CategoryTBx> GetByParentID(int parentID)
    {
        return db.CategoryTBxes.Where(u => u.ParentID == parentID && u.Status == 1).ToList();
    }

    public List<CategoryTBx> GetList()
    {
        return db.CategoryTBxes.Where(u => u.Status == 1).OrderBy(u=>u.Order).ToList();
    }
}