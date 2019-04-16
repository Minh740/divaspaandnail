using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CheckInManager
/// </summary>
public class CheckInManager
{
    public CheckInManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    DataClassesDataContext db = new DataClassesDataContext();

    public List<UserCheckInTBx> GetList()
    {
        return db.UserCheckInTBxes.OrderByDescending(t => t.CheckInDay).ToList();
    }
}