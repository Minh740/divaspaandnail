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
    
    <div>
        <div class="panel-heading">
        <input id="txtSearch" style="width: 500px; margin-left: 200px; float: left; overflow: hidden;" type="text" class="form-control" placeholder="Input name service and press Enter" />
        <button style="" class="btn btn-search btn-success" onclick="SearchReward()">Search</button>
    </div>
    <p></p>
        <div id="tblReward">
    <table class="table table-bordered">
        <tbody>
            <tr>
                <th class="text-center">ID</th>
                <th class="text-center">Name</th>
                <th class="text-center">Order</th>
                <th class="text-center">Price</th>
                <th class="text-center">Category</th>
                <th class="text-center">Status</th>
                <th colspan="2" class="text-center">Action</th>
            </tr>
            <%for (int i = listService.Count - 1 ; i > -1; i-- )
                   {%>
            <tr>

                <td><%=listService[i].ID%></td>
                <td><%=listService[i].Name%></td>
                <td><%=listService[i].Order%></td>
                <td><%=listService[i].Price%></td>
                <td><%=listService[i].CategoryTBx.Name%></td>
                <td><%=listService[i].Status%></td>
                <td class="text-center">
                    <a class="btn btn-info" href="/cp-edit-service-<%=listService[i].ID %>">
                        <i class="fa fa-edit" style="font-size: 15px; right: 10px" aria-disabled="true"></i>
                    </a>
                    <button class="btn" onclick="Delete(this,<%=listService[i].ID%>)" value="disable">
                        <i class="fa fa-trash" style="font-size: 15px"></i>
                    </button>
                </td>
            </tr>
            <%} %>
        </tbody>
    </table>
            </div>
        </div>
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


        function SearchReward() {
            var name = $("#txtSearch").val();
            $.post("/cp/page/service/search-service.aspx", {
                name: name,
            }, function (data) {

                $("#tblReward").html(data);
            });
        }
        //
        /* Search reward */
        document.getElementById('txtSearch').onkeydown = function (event) {
            if (event.keyCode == 13) {
                SearchReward();
            } else {
                $("#tblReward").load(" #tblReward");
            }
        }
    </script>


</asp:Content>

