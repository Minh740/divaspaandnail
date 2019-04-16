using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CouponsManager
/// </summary>
public class CouponsManager
{
    public CouponsManager()
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
    public void AddNew(CouponsTBx ele)
    {
        db.CouponsTBxes.InsertOnSubmit(ele);
        Save();
    }
    public CouponsTBx GetByID(int id)
    {
        return db.CouponsTBxes.FirstOrDefault(e => e.Id == id && e.Status != -1);
    }

    public List<CouponsTBx> GetByType(int type)
    {
        return db.CouponsTBxes.Where(u => u.Type == type && u.Status == 1).ToList();
    }

    public List<CouponsTBx> GetList()
    {
        return db.CouponsTBxes.Where(u => u.Status == 1).OrderBy(el => el.Type).ToList();
    }

}