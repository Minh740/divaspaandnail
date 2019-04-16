using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ImageCategoryManager
/// </summary>
public class ImageCategoryManager
{
    DataClassesDataContext db = new DataClassesDataContext();
    public void Save()
    {
        db.SubmitChanges();
    }
    public void AddNew(ImageCategoryTBx ele)
    {
        db.ImageCategoryTBxes.InsertOnSubmit(ele);
        Save();
    }
    public ImageCategoryTBx GetByID(int id)
    {
        return db.ImageCategoryTBxes.FirstOrDefault(e => e.ID == id && e.Status != -1);
    }

    public List<ImageCategoryTBx> GetByCategoryID(int ID)
    {
        return db.ImageCategoryTBxes.Where(u => u.Status == 1 && u.CategoryID == ID).ToList();
    }

    public List<ImageCategoryTBx> GetList()
    {
        return db.ImageCategoryTBxes.Where(u => u.Status == 1).ToList();
    }
}