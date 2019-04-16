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
            <h5 class="panel-title">Appointment (<%=list.Count %>)</h5>
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
            swal({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then(result => {
                if (result.value) {
                    $(input).attr("disabled", "disabled");
                    $(input).text("Deleting");
                    $.post("/cp/do/booking/delete.ashx", {
                        id: id
                    }, data => {
                        data = JSON.parse(data);
                        if (data.success == -1) {
                            alertify.error("Error occur. Please try again");
                            console.log(data.error);
                            $(input).removeAttr("disabled");
                            $(input).text("Delete");
                        } else {
                            alertify.success("Delete success");
                            location.reload();
                        }
                    })
                }
            })
        }

    </script>
</asp:Content>

