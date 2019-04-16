<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Gallery.aspx.cs" Inherits="cp_page_gallery_Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Gallery</li>
    </ol>
    <a class="btn btn-success" href="/cp-add-gallery">Add New Gallery</a>
    <p></p>
    <table class="table table-bordered">
        <tbody>
            <tr>
                <th class="text-center">ID</th>
                <th class="text-center">Type</th>
                <th class="text-center" width="400px">Link 1</th>
                <th class="text-center" width="400px">Link 2</th>
                <th colspan="2" class="text-center">Action</th>
            </tr>
            <%foreach (var gallery in listGallery)
                {
            %>
            <tr>
                <td><%=gallery.ID%></td>
                <%if (gallery.Type == 1)
                    { %>
                <td>Video</td>
                <td><%=gallery.Link%></td>
                <td></td>
                <%}
                    else
                    {%>
                <td>Image</td>
                <td>
                    <img src="<%=gallery.Link%>" style="max-width: 100%" />
                </td>
                <td>
                    <img src="<%=gallery.Link2%>" width="100%" />
                </td>
                <%} %>
                <td class="text-center">
                    <a class="btn btn-info" href="/cp-edit-gallery-<%=gallery.ID %>">
                        <i class="fa fa-edit" style="font-size: 15px; right: 10px"></i>
                    </a>
                    <button class="btn" onclick="Delete(this,<%=gallery.ID%>)">
                        <i class="fa fa-trash" style="font-size: 15px"></i>
                    </button>
                </td>
            </tr>
            <%} %>
        </tbody>
    </table>
    <script>
        function Delete(input, id) {
            $(input).prop("disabled", true);
            $(input).text("Deleting");
            ShowLoading();
            alertify.confirm("Are you sure Delete", function () {
                $.ajax({
                    url: "/cp/do/gallery/delete.aspx",
                    method: "post",
                    data: {
                        id: id,
                    },
                    success: function (data) {
                        data = JSON.parse(data);
                        if (data.success == -1) {
                            alertify.error("Error. Please try again");
                            console.log(data.error);

                        } else {
                            location.href = "/cp-gallery";
                        }
                        $(input).prop("disabled", false);
                        $(input).text("Delete");
                        HideLoading();
                    },
                    error: function (error) {
                        alertify.error("Error. Please try again");
                        console.log(error);
                        $(input).prop("disabled", false);
                        $(input).text("Delete");
                        HideLoading();
                    }
                })

            });
        }
    </script>
</asp:Content>

