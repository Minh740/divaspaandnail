using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_giftcard_get_json_giftcard : System.Web.UI.Page
{
    public string ok = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        GiftCardManager um = new GiftCardManager();
        GiftCardTBx user = um.GetGiftCardByGiftCardID(Convert.ToInt32(Request["id"]));
        ok = JsonConvert.SerializeObject(user, Formatting.Indented,
            new JsonSerializerSettings
            {
                PreserveReferencesHandling = PreserveReferencesHandling.Objects
            });
        return;

    }
}