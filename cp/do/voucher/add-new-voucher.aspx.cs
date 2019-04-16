using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_voucher_add_new_voucher : System.Web.UI.Page
{
    public static string CreateRandomVoucher(int VoucherLength)
    {

        string _allowedChars = "ASDFGHJKLQWERTYUIOPZXCVBNMabcdefghijkmnopqrstuvwxyz0123456789!@#$%^&*()?{}+=][";

        Random randNum = new Random();

        char[] chars = new char[VoucherLength];

        int allowedCharCount = _allowedChars.Length;

        for (int i = 0; i < VoucherLength; i++)

        {

            chars[i] = _allowedChars[(int)((_allowedChars.Length) * randNum.NextDouble())];

        }

        return new string(chars);

    }
    public string ok = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.AppendHeader("Access-Control-Allow-Origin", "*");
        int UserId = Convert.ToInt32(Request["UserId"]);
        string VoucherLevel = Request["voucherlevel"];

        string des = "";
        int vouchernum = 9;
        string vouchercode = CreateRandomVoucher(vouchernum);
        string voucherName = "";
        decimal voucherMinCost = 0;
        decimal voucherDefaultCost = 0;
        bool flag = false;
        DateTime current = DateTime.SpecifyKind(DateTime.Now, DateTimeKind.Unspecified);
        TimeZoneInfo src = TimeZoneInfo.FindSystemTimeZoneById(TimeZoneInfo.Local.Id);
        TimeZoneInfo dess = TimeZoneInfo.FindSystemTimeZoneById("SA Western Standard Time");
        DateTime datenow = TimeZoneInfo.ConvertTime(current, src, dess);

        //----------- UPDATE USER TOTAL REWARD ------------//


        //----------- UPDATE USERCARD CURRENT CREDIT ------//
        //UserCardManager uc = new UserCardManager();
        //UserCardTBx usercard = uc.GetUserCardByUserID(UserId);
        //decimal credit = (Decimal)usercard.CurrentCredit;
        //----------- ADD VOUCHER -----------------//

        UserManager um = new UserManager();
        UsersTbx user = um.GetUserByID(UserId);
        int totalReward = Convert.ToInt32(user.TotalReward);
        VoucherManager vc = new VoucherManager();
        VouchersTBx voucher = new VouchersTBx();
        try
        {
            if (totalReward >= 100)
            {

                if (VoucherLevel == "VoucherLevel1")
                {
                    voucherName = "VoucherLevel1";
                    des = "1st level voucher, price for $5";
                    voucherMinCost = 5;
                    voucherDefaultCost = 5;
                    //credit -= 200;
                    totalReward -= 200;
                    flag = true;
                }
                if (VoucherLevel == "VoucherLevle2")
                {
                    voucherName = "VoucherLevel2";
                    des = "2st level voucher, price for $10";
                    voucherMinCost = 10;
                    voucherDefaultCost = 10;
                    if (totalReward >= 300)
                    {
                        //credit -= 300;
                        totalReward -= 300;
                        flag = true;
                    }
                    else
                    {
                        flag = false;
                    }
                }
                if (VoucherLevel == "VoucherLevel3")
                {
                    voucherName = "VoucherLevel3";
                    des = "3st level voucher, price for $15";
                    voucherMinCost = 15;
                    voucherDefaultCost = 15;
                    if (totalReward >= 400)
                    {
                        totalReward -= 400;
                        totalReward -= 400;
                        flag = true;
                    }
                    else
                    {
                        flag = false;
                    }
                }
                if (flag == true)
                {
                    voucher.VoucherName = voucherName;
                    voucher.VoucherDescription = des;
                    //voucher.VoucherAvatar = null;
                    voucher.VoucherMinCost = voucherMinCost;
                    voucher.VoucherDefaultCost = voucherDefaultCost;
                    voucher.VoucherAddedDate = datenow;
                    voucher.VoucherEndDate = datenow.AddHours(720); // Valid for 1 month
                    voucher.VoucherStatus = 1;

                    voucher.VoucherCode = vouchercode;//UTIL.Encrypt(vouchercode, true);
                    voucher.UserId = UserId;

                    // UserCard update
                    //usercard.CurrentCredit = credit;
                    // User update 
                    user.TotalReward = totalReward;
                    //----------------------------------------------//
                    vc.AddVoucher(voucher);
                    vc.Save();
                    //uc.Save();
                    um.Save();

                    ok = "1";
                    return;
                }
                else
                {
                    ok = "2";// not enought curren credit
                }
            }

            else
            {
                ok = "2";
            }
        }
        catch (Exception ex)
        {
            ok = ex.ToString();
        }

    }
}