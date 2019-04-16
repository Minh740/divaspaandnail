using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_giftcard_Giftcard : System.Web.UI.Page
{
    public List<GiftCardTBx> list;
    public string title;
    protected void Page_Load(object sender, EventArgs e)
    {
        GiftCardManager news = new GiftCardManager();
        list = news.GetList();
        Page.Title = "GiftCard";


    }
}