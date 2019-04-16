using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_reward_Reward : System.Web.UI.Page
{
    public List<RewardDBx> list;
    public List<VouchersTBx> voucherlist;

    protected void Page_Load(object sender, EventArgs e)
    {
        RewardManager um = new RewardManager();

        list = um.GetListReward();
        // list.Reverse();
        list = list.ToList();
        Page.Title = "Reward";
    }
}