using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_user_delete : System.Web.UI.Page
{
    
        public string ok = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int id = Convert.ToInt32(Request["id"]);
            UserManager pm = new UserManager();
            RewardManager rm = new RewardManager();
            List<RewardDBx> reward = rm.GetRewardByUserID(id);
            if (reward.Count > 0)
            {
                for (int i = 0; i < reward.Count; i++)
                {
                    reward[i].Stastus = -1;
                }
            }
            rm.Save();
            UsersTbx page = pm.GetUserByID(id);
            page.Status = Convert.ToInt32(Request["status"]);
            pm.Save();
            ok = Request["status"];
            return;
        }
        catch (Exception ex)
        {
            ok = ex.ToString();
            return;
        }
    }
}
