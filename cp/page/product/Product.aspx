<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="cp_page_product_Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">product</li>
    </ol>
    <a class="btn btn-success" href="/cp-add-product">Add New Product</a>
    <p></p>
    <table class="table table-bordered">
        <tbody>
            <tr>
                <th class="text-center">ID</th>
                <th class="text-center">Name</th>
                <th class="text-center" width="200px">Avatar</th>
                <th colspan="2" class="text-center">Action</th>
            </tr>
            <%foreach (var product in listProduct)
                {
            %>
            <tr>
                <td><%=product.ID%></td>
                <td><%=product.Name%></td>
                <td>
                    <img src="/upload/product/product_<%=product.ID%>.jpg" width="100%" />
                </td>
                <td class="text-center">
                    <a class="btn btn-info" href="cp-edit-product-<%=product.ID %>">
                        <i class="fa fa-edit" style="font-size: 15px"></i>
                    </a>
                    <button class="btn" onclick="Delete(this,<%=product.ID%>)">
                        <i class="fa fa-trash" style="font-size: 15px"></i>
                    </button>
                </td>
            </tr>
            <%} %>
        </tbody>
    </table>
    <script>


        function Delete(input, id) {
            alertify.confirm('Are you sure Delete', function () {
                $(input).prop("disabled", true);
                ShowLoading();
                $.ajax({
                    url: "/cp/do/product/delete.aspx",
                    method: "post",
                    data: {
                        id: id
                    },
                    success: function (data) {
                        data = JSON.parse(data);
                        if (data.success == -1) {
                            console.log(data.error);
                            alertify.error("Error. Please try again");
                        } else {
                            location.href = "/cp-product";
                        }
                        $(input).prop("disabled", true);
                        HideLoading();
                    },
                    error: function (error) {
                        console.log(error);
                        alertify.error("Error. Please try again");
                        $(input).prop("disabled", true);
                        HideLoading();
                    }
                })
            })
        }
    </script>
</asp:Content>

