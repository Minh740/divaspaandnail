using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SliderManager
/// </summary>
public class SliderManager
{
    DataClassesDataContext DB = new DataClassesDataContext();
    public void Save()
    {
        DB.SubmitChanges();
    }
    public void AddNew(SliderTBx ele)
    {
        DB.SliderTBxes.InsertOnSubmit(ele);
        Save();
    }
    public SliderTBx GetByID(int id)
    {
        return DB.SliderTBxes.FirstOrDefault(e => e.ID == id && e.Status != -1);
    }

    public List<SliderTBx> GetList()
    {
        return DB.SliderTBxes.Where(u => u.Status != -1).ToList();
    }
}