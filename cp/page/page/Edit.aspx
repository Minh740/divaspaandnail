<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="cp_page_page_Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Dashboard
        </a></li>
        <li class="breadcrumb-item"><a href="/cp-page">Page</a></li>
        <li class="breadcrumb-item active">Edit New Page</li>
    </ol>

    <div class="form-group">
        <div class="form-row">
            <div class="col-md-6">
                <div class="form-label-group">
                    <input type="text" id="txtName" class="form-control" placeholder="Name" value="<%=page.Name %>" readonly />
                    <label for="txtName">Name</label>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-label-group">
                    <input type="text" id="txtTitle" class="form-control" placeholder="Title" value="<%=page.Title %>" />
                    <label for="txtTitle">Title</label>
                </div>
            </div>
        </div>
    </div>

    <div class="form-group">
        <label for="txtPageContent">Content</label>
        <textarea class="form-control page" id="txtPageContent"><%=page.PageContent %></textarea>
    </div>
    <div class="form-group">
        <a class="btn btn-danger" href="/cp-page">Cancel</a>
        <button class="btn btn-info" onclick="Submit(this,<%=page.ID %>)">Submit</button>
    </div>

    <script>

        $(function () {
            tinymce.init({
                selector: "textarea.page",
                theme: "modern",
                height: 300,
                forced_root_block: "",
                plugins: [
                    "advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker", "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking", "save table contextmenu directionality emoticons template paste textcolor"
                ],
                toolbar: "code insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons",
                content_css: ["/cp/css-tiny/style.css"]
            });

        })
        function Submit(input, id) {
            $(input).prop("disable", true);
            $(input).text("Submitting");
            ShowLoading();
            var name = $("#txtName").val();
            var title = $("#txtName").val();
            var pagecontent = tinymce.get("txtPageContent").getContent();
            $.ajax({
                url: "/cp/do/page/edit.aspx",
                method: "post",
                data: {
                    name: name,
                    title: title,
                    pagecontent: pagecontent,
                    id: id
                },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.success == -1) {
                        alertify.error("Error. Please try again");
                        console.log(data.error);
                    }
                    else {
                        alertify.alert("Succsess");
                        location.href = "/cp-page";
                    }
                    $(input).prop("disable", false);
                    $(input).text("Submit");
                    HideLoading();
                },
                error: function (error) {
                    console.log(error);
                    $(input).prop("disable", false);
                    $(input).text("Submit");
                    alertify.error("Error. Please try again");
                    HideLoading();
                }
            })
        }
    </script>
</asp:Content>

