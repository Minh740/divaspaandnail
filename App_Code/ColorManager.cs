using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ColorManager
/// </summary>
public class ColorManager
{
    DataClassesDataContext DB = new DataClassesDataContext();
    public void Add(ColorTBx color)
    {
        DB.ColorTBxes.InsertOnSubmit(color);
        DB.SubmitChanges();
    }
    public void Save()
    {
        DB.SubmitChanges();
    }
    public ColorTBx GetByID(int ID)
    {
        return DB.ColorTBxes.Where(e => e.ID == ID).FirstOrDefault();

    }
    public List<ColorTBx> GetList()
    {
        return DB.ColorTBxes.Where(e => e.Status == 1).OrderByDescending(e => e.ID).ToList();
    }
    public void Delete(int ID)
    {
        DB.ColorTBxes.Where(e => e.ID == ID).First().Status = -1;
        DB.SubmitChanges();
    }

    public List<ColorTBx> GetByBrandID(int brandID)
    {
        return DB.ColorTBxes.Where(e => e.BrandID == brandID && e.Status == 1).ToList();
    }
}