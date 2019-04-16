using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class api_usegiftcard : System.Web.UI.Page
{
	GiftCardManager GCM=new GiftCardManager();
	GiftCardTBx gift=new GiftCardTBx();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.AppendHeader("Access-Control-Allow-Origin", "*");
        string giftcode=Request["giftcardcode"];
        decimal giftcost=Convert.ToDecimal(Request["giftcardcost"]);
        gift=GCM.GetGiftCardByGiftCardCode(giftcode);
        decimal cost=Convert.ToDecimal(gift.GiftCardCost);
       decimal finalcost=cost-giftcost;
        gift.GiftCardCost=finalcost;
        gift.GiftCardName="Gift Card $"+finalcost;
        if(gift.GiftCardCost==0)
        {
                gift.GiftCardStatus=-1;
        }
        GCM.Save();
    }
}