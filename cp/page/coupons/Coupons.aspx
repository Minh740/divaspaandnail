<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Coupons.aspx.cs" Inherits="cp_page_coupons_Coupons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Coupons</li>
    </ol>
    <a class="btn btn-success" href="/cp/page/coupons/Add.aspx">Add New Coupons</a>
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
            <%foreach (var coupons in listCoupons)
                {
            %>
            <tr>
                <td><%=coupons.Id%></td>
                <%if (coupons.Type == 1)
                    { %>
                <td>Video</td>
                <td><%=coupons.Link%></td>
                <td></td>
                <%}
                    else
                    {%>
                <td>Image</td>
                <td>
                    <img src="<%=coupons.Link%>" style="max-width: 100%" />
                </td>
                <td>
                    <img src="<%=coupons.Link2%>" width="100%" />
                </td>
                <%} %>
                <td class="text-center">
                    <a class="btn btn-info" href="#" onclick="edit1(<%=coupons.Id%>)" >
                        <i class="fa fa-edit" style="font-size: 15px; right: 10px"></i>
                    </a>
                    <button class="btn" onclick="Delete(this,<%=coupons.Id%>)">
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
                    url: "/cp/do/coupons/delete.aspx",
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
                            location.href = "/cp/page/coupons/Coupons.aspx";
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


        function edit1(id) {
            location.href = "/cp/page/coupons/Edit.aspx?id=" + id;
        }

    </script>
</asp:Content>

