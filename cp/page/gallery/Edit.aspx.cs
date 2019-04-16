using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_gallery_Edit : System.Web.UI.Page
{
    protected GalleryTBx gallery;
    protected void Page_Load(object sender, EventArgs e)
    {
        GalleryManager GM = new GalleryManager();
        int galleryID = Convert.ToInt32(Page.RouteData.Values["galleryID"]);
        gallery = GM.GetByID(galleryID);
    }
}