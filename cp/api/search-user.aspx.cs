using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class api_search_user : System.Web.UI.Page
{
    public string ok = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        string searchStr = Request["searchStr"];
        UserManager um = new UserManager();
        List<VouchersTBx> voucherlist;
        List<GiftCardTBx> giftcardlist;

        UsersTbx user = um.SearchUserByNameOrPhone(searchStr);
        if(user != null)
        {
            Item item = new Item();
            item.UserId = user.UserId;
            item.FirstName = user.FirstName;
            item.LastName = user.LastName;
            item.UserLevel = Convert.ToInt32(user.UserLevel);
            voucherlist=user.VouchersTBxes.Where(u=>u.VoucherStatus!=-1).ToList();
            giftcardlist=user.GiftCardTBxes.Where(u=>u.GiftCardStatus!=-1).ToList();
            
            for(int i=0;i<voucherlist.Count;i++){
              item.VoucherList+="<button onclick=\"CheckVoucher('"+voucherlist[i].VoucherCode+"')\">"+voucherlist[i].VoucherCode +"</button>";
           }
           for(int j=0;j<giftcardlist.Count;j++){
               item.GiftCardList+="<button class='btn btn-default' id=\"btn_"+j+"\" onclick=\"checkgiftcard("+giftcardlist[j].GiftCardCost+",'btn_"+j+"','"+giftcardlist[j].GiftCardCode.Trim()+"')\">"+giftcardlist[j].GiftCardName+"</button>";
           }
            ok = JsonConvert.SerializeObject(item, Formatting.Indented,
               new JsonSerializerSettings
               {
                   PreserveReferencesHandling = PreserveReferencesHandling.Objects
               });
        }
        else
        {
            ok = "0";
        }
        Response.Write(ok);

    }
    public class Item
    {
        public int UserId { get; set;}
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public int UserLevel { get; set;}
        public string VoucherList{ get; set;}
        public string GiftCardList{ get; set;}
    }
}