using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_voucher_Voucher : System.Web.UI.Page
{
    public List<VouchersTBx> list;
    protected UserManager UM;

    protected void Page_Load(object sender, EventArgs e)
    {
        VoucherManager VM = new VoucherManager();
        UM = new UserManager();
        list = VM.GetList();
        list.Reverse();
        list = list.ToList();
        Page.Title = "Voucher";
    }
}