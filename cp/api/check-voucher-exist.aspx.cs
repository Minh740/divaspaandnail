using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_check_voucher_exist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.AppendHeader("Access-Control-Allow-Origin", "*");
        string vouchercode = Request["vouchercode"];

        string userid = Request["userid"]; // kiem tra voucher code phai di kem voi userid do, vi moi voucher thuoc ve 1 user duy nhat.


        VoucherManager vm = new VoucherManager();
        VouchersTBx v = vm.CheckVoucherCode(vouchercode, userid);
        if(v != null)
        {
            Response.Write(v.VoucherDefaultCost); // voucher chua xai! 
        }
        else
        {
            Response.Write("1"); // voucher vi pham error
        }
    }
}