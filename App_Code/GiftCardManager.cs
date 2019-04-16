using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for GiftCardManager
/// </summary>
public class GiftCardManager
{
    DataClassesDataContext db = new DataClassesDataContext();
    public GiftCardManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public List<GiftCardTBx> GetListGiftCardByUserId(int userid)
    {
        return db.GiftCardTBxes.Where(v => v.CreateByUserId == userid && v.GiftCardStatus == 1).ToList();
    }

    public void AddGiftCard(GiftCardTBx giftcard)
    {
        db.GiftCardTBxes.InsertOnSubmit(giftcard);
        Save();
    }
    public void Save()
    {
        db.SubmitChanges();
    }
    public GiftCardTBx GetGiftCardByGiftCardID(int id)
    {
        return db.GiftCardTBxes.Where(r => r.GiftCardStatus == 1 && r.GiftCardID == id).FirstOrDefault();
    }
    public GiftCardTBx GetGiftCardByGiftCardCode(string giftcardcode)
    {
        return db.GiftCardTBxes.Where(r => r.GiftCardStatus != -1 && r.GiftCardCode == giftcardcode).FirstOrDefault();
    }
    public List<GiftCardTBx> GetList()
    {
        return db.GiftCardTBxes.Where(u => u.GiftCardStatus != -1).OrderByDescending(x => x.GiftCardID).ToList();
    }

}