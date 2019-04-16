using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_image_Image : System.Web.UI.Page
{
    protected List<string> listFile = new List<string>();
    protected void Page_Load(object sender, EventArgs e)
    {
        string[] files = Directory.GetFiles(Server.MapPath("~/upload/image"));
        foreach (var item in files)
        {
            listFile.Add(Path.GetFileName(item));
        }
    }
}