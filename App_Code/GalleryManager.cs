using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for GalleryManager
/// </summary>
public class GalleryManager
{
    DataClassesDataContext db = new DataClassesDataContext();
    public void Save()
    {
        db.SubmitChanges();
    }
    public void AddNew(GalleryTBx ele)
    {
        db.GalleryTBxes.InsertOnSubmit(ele);
        Save();
    }
    public GalleryTBx GetByID(int id)
    {
        return db.GalleryTBxes.FirstOrDefault(e => e.ID == id && e.Status != -1);
    }

    public List<GalleryTBx> GetByType(int type)
    {
        return db.GalleryTBxes.Where(u => u.Type == type && u.Status == 1).ToList();
    }

    public List<GalleryTBx> GetList()
    {
        return db.GalleryTBxes.Where(u => u.Status == 1).OrderBy(el => el.Type).ToList();
    }

}
