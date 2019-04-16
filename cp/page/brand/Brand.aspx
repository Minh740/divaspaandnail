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
    <p></p>
    <div class="panel panel-flat">
        <div class="panel-heading">
            <%--<h5 class="panel-title">Slider (<%=list.Count %>)</h5>--%>
            <div class="heading-elements">
            </div>
        </div>

        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%for (int i = list.Count - 1 ; i > -1; i-- )
                   {%>
                    <tr>
                        <td><%=list[i].ID %></td>
                        <td><%=list[i].Name %></td>
                        <td>
                            <a class="btn btn-info" onclick="OpenModal(<%=list[i].ID %>,this)">
                                <i class="fa fa-edit" style="font-size: 15px; right: 10px"></i>

                            </a>
                            <a class="btn" onclick="Delete(this,<%=list[i].ID %>)">
                               <i class="fa fa-trash" style="font-size: 15px"></i>
                            </a>
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
                        alert("Error occur. Please try again");
                        console.log(data.error);
                    } else {
                        alert("Insert success");
                        location.reload();
                    }
                });
            } else {
                alert("Please enter brand name");
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
                        alert("Error occur. Please try again");
                        console.log(data.error);
                    } else {
                        alert("Edit success");
                        location.reload();
                    }
                })
            } else {
                alert("Please enter brand name");
            }

        }
        function Delete(input,id) {
            alertify.confirm("Are you sure Delete", function () {
                $(input).prop("disabled", true);
                ShowLoading();
                $.ajax({
                    url: "/cp/do/brand/delete.aspx",
                    method: "post",
                    data: {
                        id: id,
                    },
                    success: function (data) {
                        data = JSON.parse(data);
                        if (data.success == -1) {
                            alertify.error("Error. Please try again");
                            console.log(data);
                        }
                        else {
                            location.href = "/cp-brand";
                        }
                        $(input).prop("disabled", false);
                        HideLoading();
                    },
                    error: function (error) {
                        alertify.error("Error. Please try again.");
                        console.log(error);
                        $(input).prop("disabled", false);
                        HideLoading();
                    }
                })
            });
        }
    </script>
</asp:Content>

