using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_giftcard_delete_giftcard : System.Web.UI.Page
{

    public string ok = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int id = Convert.ToInt32(Request["id"]);
            GiftCardManager pm = new GiftCardManager();
            GiftCardTBx page = pm.GetGiftCardByGiftCardID(id);
            page.GiftCardStatus = Convert.ToInt32(Request["status"]);
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