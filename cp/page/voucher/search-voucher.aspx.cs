using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_voucher_search_voucher : System.Web.UI.Page
{
    public List<VouchersTBx> result = new List<VouchersTBx>();
    public UsersTbx user = new UsersTbx();
    public int userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        UserManager UM = new UserManager();
        string phone = Request["phone"];
        VoucherManager r = new VoucherManager();
        user = UM.GetUserByUserPhone(phone);
        userid = user.UserId;
        result = r.GetListVoucherByUserId(userid);

    }
}