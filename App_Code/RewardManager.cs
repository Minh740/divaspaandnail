using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for RewardManager
/// </summary>
public class RewardManager
{
    public RewardManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    DataClassesDataContext db = new DataClassesDataContext();
    public List<RewardDBx> GetRewardByUserId(int userid)
    {
        return db.RewardDBxes.Where(r => r.UserId == userid && r.Stastus == 1).OrderByDescending(aa => aa.RewardDate).ToList();
    }
    //get list by date
    public List<RewardDBx> GetListByDateFromandto(DateTime datefrom, DateTime dateto)
    {
        return db.RewardDBxes.Where(r => r.RewardDate >= datefrom && r.RewardDate <= dateto && r.Stastus != -1).ToList();
    }

    public List<RewardDBx> GetListReward()
    {
        return db.RewardDBxes.Where(r => r.Stastus == 1 && r.UsersTbx.Status == 1).OrderByDescending(t => t.RewardDate).Take(20).ToList();
    }
    public RewardDBx GetRewardByRewardID(int id)
    {
        return db.RewardDBxes.Where(r => r.Stastus == 1 && r.RewardID == id).FirstOrDefault();
    }
    public List<RewardDBx> GetRewardByUserID(int userid)
    {
        return db.RewardDBxes.Where(r => r.Stastus == 1 && r.UserId == userid).ToList();
    }
    public void AddReward(RewardDBx reward)
    {
        db.RewardDBxes.InsertOnSubmit(reward);
        Save();
    }
    public void Save()
    {
        db.SubmitChanges();
    }

    public List<RewardDBx> SearchByID(string id)
    {
        return db.RewardDBxes.Where(r => r.UserId.ToString().Contains(id) && r.Stastus != -1).ToList();
    }
    public int CheckGameLuckyGift(int userID)
    {
        DateTime now = DateTime.UtcNow.Date;
        int total = 0;
        List<RewardDBx> list = db.RewardDBxes.Where(r => r.UserId == userID && r.Notes == "luckygift").ToList();
        foreach (var item in list)
        {
            if (item.RewardDate > now && item.RewardDate < now.AddDays(1))
                total++;
        }
        return total;
    }
}