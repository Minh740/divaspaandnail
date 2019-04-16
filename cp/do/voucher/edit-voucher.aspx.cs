using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_voucher_edit_voucher : System.Web.UI.Page
{
    VoucherManager VM = new VoucherManager();
    protected void Page_Load(object sender, EventArgs e)
    {
        int voucherid = Convert.ToInt32(Request["voucherid"]);
        string vouchername = Request["voucherlevel"];

        decimal vouchermincost = Convert.ToDecimal(Request["vouchermincost"]);
        decimal voucherdefaultcost = Convert.ToDecimal(Request["voucherdefaultcost"]);
        string voucherdesc = Request["voucherdesc"];

        try
        {
            VouchersTBx voucher = new VouchersTBx();
            voucher = VM.GetByID(voucherid);

            voucher.VoucherName = vouchername;
            voucher.VoucherDescription = voucherdesc;
            voucher.VoucherMinCost = vouchermincost;
            voucher.VoucherDefaultCost = voucherdefaultcost;
            VM.Save();
            Response.Write(1);
        }
        catch (Exception ex)
        {

            Response.Write(0);
        }


    }
}