using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for VoucherManager
/// </summary>
public class VoucherManager
{
    DataClassesDataContext db = new DataClassesDataContext();

    public void AddVoucher(VouchersTBx voucher)
    {
        db.VouchersTBxes.InsertOnSubmit(voucher);
        Save();
    }
    public void Save()
    {
        db.SubmitChanges();
    }
    public List<VouchersTBx> GetListVoucherByUserId(int userid)
    {
        return db.VouchersTBxes.Where(v => v.UserId == userid && v.VoucherStatus == 1).ToList();
    }
    public VouchersTBx GetvoucherByVoucherId(int id)
    {
        return db.VouchersTBxes.Where(r => r.VoucherStatus == 1 && r.VoucherID == id).FirstOrDefault();
    }
    public VouchersTBx GetByID(int ID)
    {
        return db.VouchersTBxes.Where(u => u.VoucherStatus != -1 && u.VoucherID == ID).FirstOrDefault();
    }
    public List<VouchersTBx> GetListVoucher()
    {
        return db.VouchersTBxes.Where(r => r.VoucherStatus == 1).ToList();
    }
    public List<VouchersTBx> GetList()
    {
        return db.VouchersTBxes.Where(u => u.VoucherStatus != -1).OrderByDescending(x => x.VoucherID).ToList();
    }

    public VouchersTBx CheckVoucherCode(string code, string userid)
    {
        return db.VouchersTBxes.Where(u => u.VoucherStatus != -1 && u.VoucherCode == code && u.UserId == Convert.ToInt32(userid)).FirstOrDefault();
    }
}