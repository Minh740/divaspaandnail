<%@ Application Language="C#" %>

<script RunAt="server">

    void URL(System.Web.Routing.RouteCollection rout)
    {

        rout.MapPageRoute("", "promotions", "~/Promotion.aspx");
        rout.MapPageRoute("", "services", "~/Services.aspx");
        rout.MapPageRoute("", "egift", "~/Egift.aspx");
        rout.MapPageRoute("", "gallery", "~/Gallery.aspx");
        rout.MapPageRoute("", "products", "~/Product.aspx");
        rout.MapPageRoute("", "reviews", "~/Review.aspx");
        rout.MapPageRoute("", "contact", "~/Contact.aspx");
        rout.MapPageRoute("", "policy", "~/Policy.aspx");
        rout.MapPageRoute("", "sign-up", "~/Signup.aspx");
        //================================== BACK END ==========================================//
        //login
        rout.MapPageRoute("", "cp-home", "~/cp/page/category/Category.aspx");
        rout.MapPageRoute("", "cp-login","~/cp/Login.aspx");

        //category
        rout.MapPageRoute("", "cp-category", "~/cp/page/category/Category.aspx");
        rout.MapPageRoute("", "cp-edit-category-{categoryID}", "~/cp/page/category/Edit.aspx");
        rout.MapPageRoute("", "cp-add-category", "~/cp/page/category/Add.aspx");

        //service
        rout.MapPageRoute("", "cp-service", "~/cp/page/service/Service.aspx");
        rout.MapPageRoute("", "cp-edit-service-{serviceID}", "~/cp/page/service/Edit.aspx");
        rout.MapPageRoute("", "cp-add-service", "~/cp/page/service/Add.aspx");

        //image category
        rout.MapPageRoute("", "cp-image-category", "~/cp/page/image-category/ImageCategory.aspx");
        rout.MapPageRoute("", "cp-add-image-category", "~/cp/page/image-category/Add.aspx");

        //gallery
        rout.MapPageRoute("", "cp-gallery", "~/cp/page/gallery/Gallery.aspx");
        rout.MapPageRoute("", "cp-edit-gallery-{galleryID}", "~/cp/page/gallery/Edit.aspx");
        rout.MapPageRoute("", "cp-add-gallery", "~/cp/page/gallery/Add.aspx");

        //slider
        rout.MapPageRoute("", "cp-slider", "~/cp/page/slider/Slider.aspx");
        rout.MapPageRoute("", "cp-edit-slider-{sliderID}", "~/cp/page/slider/Edit.aspx");
        rout.MapPageRoute("", "cp-add-slider", "~/cp/page/slider/Add.aspx");

        //page
        rout.MapPageRoute("", "cp-page", "~/cp/page/page/Page.aspx");
        rout.MapPageRoute("", "cp-edit-page-{pageID}", "~/cp/page/page/Edit.aspx");
        rout.MapPageRoute("", "cp-add-page", "~/cp/page/page/Add.aspx");

        //image category
        rout.MapPageRoute("", "cp-image-category", "~/cp/page/image-category/ImageCategory.aspx");
        rout.MapPageRoute("", "cp-edit-image-category-{ImageID}", "~/cp/page/image-category/Edit.aspx");
        rout.MapPageRoute("", "cp-add-image-category", "~/cp/page/image-category/Add.aspx");

        //gallery
        rout.MapPageRoute("", "cp-gallery", "~/cp/page/gallery/Page.aspx");
        rout.MapPageRoute("", "cp-edit-gallery-{galleryID}", "~/cp/page/gallery/Edit.aspx");
        rout.MapPageRoute("", "cp-add-gallery", "~/cp/page/gallery/Add.aspx");

        //product
        rout.MapPageRoute("", "cp-product", "~/cp/page/product/Product.aspx");
        rout.MapPageRoute("", "cp-edit-product-{productID}", "~/cp/page/product/Edit.aspx");
        rout.MapPageRoute("", "cp-add-product", "~/cp/page/product/Add.aspx");
        //new
        rout.MapPageRoute("", "cp-edit-new-{id}", "~/cp/page/new/Edit.aspx");

        //image
        rout.MapPageRoute("", "cp-image", "~/cp/page/image/Image.aspx");

        //user
        rout.MapPageRoute("", "cp-user", "~/cp/page/user/User.aspx");

        // reward
        rout.MapPageRoute("", "cp-reward", "~/cp/page/reward/Reward.aspx");

        // brand
        rout.MapPageRoute("", "cp-brand", "~/cp/page/brand/Brand.aspx");

        // voucher
        rout.MapPageRoute("", "cp-voucher", "~/cp/page/voucher/Voucher.aspx");
    }

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        URL(System.Web.Routing.RouteTable.Routes);
    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

</script>
