<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Service.aspx.cs" Inherits="cp_page_service_Service" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Service</li>
    </ol>
    <a class="btn btn-success" href="/cp-add-service">Add New Service</a>
    <p></p>
    <table class="table table-bordered">
        <tbody>
            <tr>
                <th class="text-center">ID</th>
                <th class="text-center">Name</th>
                <th class="text-center">Price</th>
                <th class="text-center">Category</th>
                <th colspan="2" class="text-center">Action</th>
            </tr>
            <%foreach (var service in listService)
                {
            %>
            <tr>

                <td><%=service.ID%></td>
                <td><%=service.Name%></td>
                <td><%=service.Price%></td>
                <td><%=service.CategoryTBx.Name%></td>
                <td class="text-center">
                    <a class="btn btn-info" href="/cp-edit-service-<%=service.ID %>">
                        <i class="fa fa-edit" style="font-size: 15px; right: 10px" aria-disabled="true"></i>
                    </a>
                    <button class="btn" onclick="Delete(this,<%=service.ID%>)" value="disable">
                        <i class="fa fa-trash" style="font-size: 15px"></i>
                    </button>
                </td>
            </tr>
            <%} %>
        </tbody>
    </table>
    <script>


        function Delete(input, id) {
            alertify.confirm("Are you sure you want to DELETE this?", function () {
                $(input).prop("disabled", true);
                  ShowLoading();
                $.ajax({
                    url: "/cp/do/service/delete.aspx",
                    method: "post",
                    data: {
                        id: id
                    },
                    success: function (data) {
                        data = JSON.parse(data);
                        if (data.success == -1) {
                            console.log(data.error);
                            alertify.error("Error. Please try again");
                        }
                        else {
                            location.href = "/cp/page/service/Service.aspx";
                        }
                        $(input).prop("disabled", false);
                          HideLoading();
                    },
                    error: function (error) {
                        console.log(error);
                        alertify.error("Error. Please try again");
                        $(input).prop("disabled", false);
                          HideLoading();
                    }
                })
            })
        }
    </script>


</asp:Content>

