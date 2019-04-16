<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Brand.aspx.cs" Inherits="cp_page_brand_Brand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Brand</li>
    </ol>
    <a class="btn btn-success" onclick="OpenModal(0,this)" >Add New Brand</a>
    <div class="panel panel-flat">
        <div class="panel-heading">
            <h5 class="panel-title">Slider (<%=list.Count %>)</h5>
            <div class="heading-elements">
            </div>
        </div>

        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%foreach (var item in list)
                        {%>
                    <tr>
                        <td><%=item.ID %></td>
                        <td><%=item.Name %></td>
                        <td>
                            <button class="btn btn-success" onclick="OpenModal(<%=item.ID %>,this)">Edit</button>
                            <button class="btn btn-danger" onclick="Delete(<%=item.ID %>,this)">Delete</button>
                        </td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
        </div>
    </div>


    <div id="mdInput" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Brand</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Name:</label>
                        <input type="text" class="form-control" id="txtName" />
                    </div>

                </div>
                <div class="modal-footer">
                    <button class="btn btn-success" id="btn-save">Save</button>
                    <button class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>



    <script>
        function OpenModal(type, input) {
            $("#mdInput").modal();
            if (type == 0)
                $("#btn-save").attr("onclick", "Add()");
            else {
                $("#btn-save").attr("onclick", "Edit(" + type + ")");
                $("#txtName").val($(input).parent().parent().find("td").eq(1).text());
            }
        }

        function Add() {
            $("#btn-save").attr("disabled", "disabled");
            if ($("#txtName").val().length > 0) {
                $.post("/cp/do/brand/add.ashx", {
                    name: $("#txtName").val()
                }, data => {
                    data = JSON.parse(data);
                    if (data.success == -1) {
                        swal("Error occur. Please try again");
                        console.log(data.error);
                    } else {
                        swal("Insert success");
                        location.reload();
                    }
                });
            } else {
                swal("Please enter brand name");
            }
        }

        function Edit(id) {
            $("#btn-save").attr("disabled", "disabled");
            if ($("#txtName").val().length > 0) {
                $.post("/cp/do/brand/edit.ashx", {
                    id: id,
                    name: $("#txtName").val()
                }, data => {
                    data = JSON.parse(data);

                    if (data.success == -1) {
                        swal("Error occur. Please try again");
                        console.log(data.error);
                    } else {
                        swal("Edit success");
                        location.reload();
                    }
                })
            } else {
                swal("Please enter brand name");
            }

        }
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
                    $.post("/cp/do/brand/delete.ashx", {
                        id: id
                    }, data => {
                        data = JSON.parse(data);
                        if (data.success == -1) {
                            swal("Error occur. Please try again");
                            console.log(data.error);
                            $(input).removeAttr("disabled");
                            $(input).text("Delete");
                        } else {
                            swal("Delete success");
                            location.reload();
                        }
                    })
                }
            })
        }
    </script>
</asp:Content>

