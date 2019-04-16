using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_appointment_Booking : System.Web.UI.Page
{
    protected List<BookingTBx> list;
    protected ColorManager CM;
    protected void Page_Load(object sender, EventArgs e)
    {
        BookingManager BM = new BookingManager();
        list = BM.GetList();
        CM = new ColorManager();
    }
}