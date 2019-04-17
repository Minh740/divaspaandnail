using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_giftcard_add_new_giftcard : System.Web.UI.Page
{
    public string ok = string.Empty;
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
    public static string RandomPassword(int Length)
    {

        string _allowedChars = "0123456789";

        Random randNum = new Random();

        char[] chars = new char[Length];

        int allowedCharCount = _allowedChars.Length;

        for (int i = 0; i < Length; i++)

        {

            chars[i] = _allowedChars[(int)((_allowedChars.Length) * randNum.NextDouble())];

        }

        return new string(chars);

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int modalid = Convert.ToInt32(Request["modalid"]);

            int GiftCardID = Convert.ToInt32(Request["GiftCardID"]);

            int userID = Convert.ToInt32(Request["userID"]);

            decimal GiftCardCost = Convert.ToDecimal(Request["giftcardcost"]);

            string GiftCardName = Request["giftcardname"];
            string GiveItToEmail = Request["giveittoemail"];
            string GiftCardDescription = Request["giftcarddesc"];
            string GiftCardNotes = Request["giftcardnotes"];
            int vouchernum = 9;
            string Password = RandomPassword(6);

            string GiftCardCode = CreateRandomVoucher(vouchernum);

            //kiem tra email da ton tai hay chuwa
            UserManager UM = new UserManager();
            UsersTbx usersend = UM.GetUserByID(userID);
            string usernamesend = usersend.FirstName + " " + usersend.LastName;
            string useremailsend = usersend.Email;


            UsersTbx user = UM.GetUserByUserEmail(GiveItToEmail);
            string desc = "";
            if (user != null)
            {
                if (user.Email != null)
                {
                    desc = "You have recived gift card of NoaNailsSpa from: " + "<br/>" + "User: " + usernamesend + "<br/>" + "Email: " + useremailsend + "<br/>" + "Note: " + GiftCardNotes;
                    desc += "<br/><br/>";
                    desc += "Please download our app for free to use" + "<a href='#'>" + " here " + "</a>" + "and login to use gift card.";
                    desc += "<br/><br/>";
                }

            }
            else
            {
                UsersTbx u = new UsersTbx();
                u.FirstName = GiveItToEmail;
                u.Password = UTIL.Encrypt(Password, true);
                u.Email = GiveItToEmail;
                u.Status = 1;
                u.UserLevel = 0;
                u.TotalReward = 0;
                UM.AddUser(u);
                UM.Save();
                desc = "You have recived gift card of NoaNailsSpa from: " + "<br/>" + "User: " + usernamesend + "<br/>" + "Email: " + useremailsend + "<br/>" + "Note: " + GiftCardNotes;
                desc += "<br/><br/>";
                desc += "Please download our app for free to use" + "<a href='#'>" + " here " + "</a>" + "and login with the acount below to use gift card.";
                desc += "<br/><br/>";
                desc += "Email: " + GiveItToEmail + "<br/>" + "Password: " + Password;

            }
            UTIL.SendMailFast("info@noanailsspaconcord.com", GiveItToEmail, "Gift Card NailsSpa Salon", desc, "NoaNailsSpa", "info@capsole.net", "Kid3101@", "relay-hosting.secureserver.net");





            GiftCardManager r = new GiftCardManager();

            GiftCardTBx reward = new GiftCardTBx();



            if (GiftCardID != 0)//------- EDIT -----------------------------------------||
            {
                reward = r.GetGiftCardByGiftCardID(GiftCardID);

            }
            reward.GiftCardName = GiftCardName;
            reward.GiftCardCost = GiftCardCost;
            reward.GiveItToEmail = GiveItToEmail;


            if (GiftCardID == 0) //-------- ADD -----------------------------------||
            {
                DateTime current = DateTime.SpecifyKind(DateTime.Now, DateTimeKind.Unspecified);
                TimeZoneInfo src = TimeZoneInfo.FindSystemTimeZoneById(TimeZoneInfo.Local.Id);
                TimeZoneInfo des = TimeZoneInfo.FindSystemTimeZoneById("SA Western Standard Time");
                reward.GiftCardAddedDate = TimeZoneInfo.ConvertTime(current, src, des);
                reward.GiftCardStatus = 1;
                reward.GiftCardCode = GiftCardCode;
                reward.CreateByUserId = userID;
                reward.GiftCardName = GiftCardName;
                reward.GiftCardCost = GiftCardCost;
                reward.GiveItToEmail = GiveItToEmail;
                reward.GiftCardDescription = GiftCardDescription;
                reward.GiftCardNote = GiftCardNotes;

                r.AddGiftCard(reward);
            }
            r.Save();

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