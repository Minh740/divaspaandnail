<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Slider.aspx.cs" Inherits="cp_page_slider_Slider" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">slider</li>
    </ol>
    <a class="btn btn-success" href="/cp-add-slider">Add New Slider</a>
    <p></p>
    <table class="table table-bordered">
        <tbody>
            <tr>
                <th class="text-center">ID</th>
                <th class="text-center" width="200px">Image</th>
                <th class="text-center">Title</th>
                <th class="text-center">Short Description</th>
                <th colspan="2" class="text-center">Action</th>
            </tr>
            <%foreach (var slider in listSlider)
                {
            %>
            <tr>
                <td><%=slider.ID%></td>
                <td>
                    <img src="<%=slider.URL%>" width="100%" />
                </td>
                <td><%=slider.Title %></td>
                <td><%=slider.ShortDesc %></td>
                <td class="text-center">
                    <a class="btn btn-info" href="cp-edit-slider-<%=slider.ID %>">
                        <i class="fa fa-edit" style="font-size: 15px"></i>
                    </a>
                    <button class="btn" onclick="Delete(this,<%=slider.ID%>)">
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
                    url: "/cp/do/slider/delete.aspx",
                    method: "post",
                    data: {
                        ID: id
                    },
                    success: function (data) {
                        data = JSON.parse(data);
                        if (data.success == -1) {
                            console.log(data.error);
                            alertify.error("Error. Please try again");
                        } else {
                            location.href = "/cp-slider";
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

