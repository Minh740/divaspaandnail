<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Booking.aspx.cs" Inherits="cp_page_appointment_Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<%--     <div class="page-header">
        <div class="page-header-content">
            <div class="page-title">
                <h4><i class="icon-arrow-left52 position-left"></i><span class="text-semibold">Appointment</span> Management</h4>
            </div>
        </div>

        <div class="breadcrumb-line">
            <ul class="breadcrumb">
                <li><a href="#"><i class="icon-home2 position-left"></i>Home </a> <span> </span> / <span> </span></li>
                <li><a href="#"><i class="icon-blog position-left"> </i>Color Management</a></li>
            </ul>
        </div>
    </div>--%>
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Appointment</li>
    </ol>
    <div class="panel panel-flat">
        <div class="panel-heading">
            <h7 class="panel-title">Appointment (<%=list.Count %>)</h7>
            <div class="heading-elements">
            </div>
        </div>

        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Date</th>
                        <th>Stylist</th>
                        <th>Service 1</th>
                        <th>Service 2</th>
                        <th>Service 3</th>
                        <th>Color</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%foreach (var item in list)
                        {%>
                    <tr>
                        <td><%=item.ID %></td>
                        <td><%=item.Name %></td>
                        <td><%=item.Phone %></td>
                        <td><%=item.Email %></td>
                        <td><%= DateTime.Parse(item.BookDate.ToString()).ToShortDateString() %></td>
                        <td><%=item.Stylist %></td>
                        <td><%=item.Service1 %></td>
                        <td><%=item.Service2 %></td>
                        <td><%=item.Service3%></td>
                        <td><%=CM.GetByID(Convert.ToInt32(item.ColorID))==null?"":CM.GetByID((int)item.ColorID).Name %></td>
                        <td>
                            <button class="btn btn-danger" onclick="Delete(<%=item.ID %>,this)">Delete</button>
                        </td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        function Delete(id, input) {
            $(input).prop("disabled", true);
            $(input).text("Deleting");
            ShowLoading();
            alertify.confirm("Are you sure Delete", function () {
                $.ajax({
                    url: "/cp/do/booking/delete.aspx",
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
                            swal("Delete Success!");
                            location.reload();
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

