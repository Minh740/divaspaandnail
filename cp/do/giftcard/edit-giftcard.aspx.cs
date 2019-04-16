using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_giftcard_edit_giftcard : System.Web.UI.Page
{
    public string ok = string.Empty;

    GiftCardManager GM = new GiftCardManager();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {


            int GiftCardID = Convert.ToInt32(Request["GiftCardID"]);

            int UserId = Convert.ToInt32(Request["UserId"]);

            decimal GiftCardCost = Convert.ToDecimal(Request["GiftCardCost"]);

            string GiftCardName = Request["GiftCardName"];
            string GiveItToEmail = Request["GiveItToEmail"];
            string GiftCardDescription = Request["GiftCardDescription"];
            string GiftCardNotes = Request["GiftCardNotes"];
            GiftCardTBx gift = new GiftCardTBx();
            gift = GM.GetGiftCardByGiftCardID(GiftCardID);
            gift.GiftCardCost = GiftCardCost;
            gift.GiftCardName = GiftCardName;
            gift.GiveItToEmail = GiveItToEmail;
            gift.GiftCardDescription = GiftCardDescription;
            gift.GiftCardNote = GiftCardNotes;
            GM.Save();
            ok = "1";
            return;
        }
        catch (Exception ex)
        {
            ok = ex.ToString();
            return;
        }
    }
}