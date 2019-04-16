using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_gallery_Gallery : System.Web.UI.Page
{
    protected List<GalleryTBx> listGallery;
    protected void Page_Load(object sender, EventArgs e)
    {
        GalleryManager GM = new GalleryManager();
        listGallery = GM.GetList();
    }
}