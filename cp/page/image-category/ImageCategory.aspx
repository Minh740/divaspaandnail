<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="ImageCategory.aspx.cs" Inherits="cp_page_image_category_ImageCatgory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        .fileUpload {
            position: relative;
            width: fit-content;
        }

            .fileUpload .upload {
                position: absolute;
                top: 0;
                left: 0;
                margin: 0;
                padding: 0;
                width: 100%;
                height: 100%;
                cursor: pointer;
                opacity: 0;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Images</li>
    </ol>
    <a class="btn btn-success" href="/cp-add-image-category">Add New Image</a>
    <p></p>
    <table class="table table-bordered">
        <tbody>
            <tr>
                <th class="text-center">ID</th>
                <th class="text-center" width="250px">Image Large</th>
                <th class="text-center" width="150px">Image Small</th>
                <th class="text-center">Category</th>
                <th colspan="2" class="text-center">Action</th>
            </tr>
            <%foreach (var category in listImage)
                {
            %>
            <tr>
                <td><%=category.ID%></td>
                <td>
                    <img width="100%" src="<%=category.Link %>" />
                </td>
                <td>
                    <img width="100%" src="<%=category.Link2 %>" />
                </td>
                <td><%=category.CategoryTBx.ID%>-<%=category.CategoryTBx.Name %></td>

                <td class="text-center">
                    <a class="btn btn-info" href="/cp-edit-image-category-<%=category.ID %>">
                        <i class="fa fa-edit" style="font-size: 15px; right: 10px"></i>
                    </a>
                    <button class="btn" onclick="Delete(<%=category.ID%>)">
                        <i class="fa fa-trash" style="font-size: 15px"></i>
                    </button>
                </td>
            </tr>

            <%} %>
        </tbody>
    </table>
<script>
        function Delete(id) {
            ShowLoading();
            alertify.confirm("Are you Delete", function () {
                $.post("/cp/do/imagecategory/delete.aspx", {
                    id: id,
                }, function (data) {
                    if (data == 1) {
                        location.reload();
                    }
                    else {
                        alertify.alert("Error", data);
                    }
                    HideLoading();
                })
            });
        }

    </script>
</asp:Content>

