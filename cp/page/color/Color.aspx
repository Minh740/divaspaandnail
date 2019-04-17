<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Color.aspx.cs" Inherits="cp_page_color_Color" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <script src="/cp/lib/color-picker/jquery.minicolors.js"></script>
    <link href="/cp/lib/color-picker/jquery.minicolors.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<%--    <div class="page-header">
        <div class="page-header-content">
            <div class="page-title">
                <h4><i class="icon-arrow-left52 position-left"></i><span class="text-semibold">Slider</span> Management</h4>
            </div>

            <div class="heading-elements">
                <a id="btn-add" onclick="OpenModal(0,this)" class="btn btn-labeled btn-labeled-right bg-blue heading-btn">Add New <b><i class="icon-menu7"></i></b></a>
            </div>
        </div>

        <div class="breadcrumb-line">
            <ul class="breadcrumb">
                <li><a href="/"><i class="icon-home2 position-left"></i>Home</a></li>
                <li><a href="/cp/Color.aspx"><i class="icon-blog position-left"></i>Color Management</a></li>
            </ul>


        </div>
    </div>--%>
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Color</li>
    </ol>
        <a class="btn btn-success" id="btn-add" onclick="OpenModal(0,this)">Add New Color</a>
    <p></p>
    <div class="panel panel-flat">
        <div class="panel-heading">
            <h7 class="panel-title">Color (<%=list.Count %>)</h7>
            <div class="heading-elements">
            </div>
        </div>

        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Brand</th>
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
                        <td data-id="<%=item.BrandID %>"><%=BM.GetByID((int)item.BrandID).Name %></td>
                        <td><%=item.HexCode %></td>
                        <td>
                            <a class="btn btn-info" onclick="OpenModal(<%=item.ID %>,this)"><i class="fa fa-edit" style="font-size: 15px; right: 10px"></i></a>
                            <button class="btn" onclick="Delete(<%=item.ID %>,this)"><i class="fa fa-trash" style="font-size: 15px"></i></button>
                              
                       
                            
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
                    <%--<button type="button" class="close" data-dismiss="modal">&times;</button>--%>
                    <h4 class="modal-title">Brand</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Name:</label>
                        <input type="text" class="form-control" id="txtName" />
                    </div>
                    <div class="form-group">
                        <label>Brand:</label>
                        <select class="form-control" id="txtBrand">
                            <%foreach (var item in listBrand)
                                {%>
                            <option value="<%=item.ID %>"><%=item.Name %></option>
                            <%} %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Hex code:</label>
                        <input type="text" id="txtCode" class="form-control demo" data-control="hue" data-lettercase="uppercase" value="#ff6161" />
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
            if (type == 0) {
                $("#btn-save").attr("onclick", "Add()");
                $("#txtCode").minicolors("value", "#ffffff");
            }
            else {
                $("#btn-save").attr("onclick", "Edit(" + type + ")");
                $("#txtName").val($(input).parent().parent().find("td").eq(1).text());
                $("#txtBrand").val($(input).parent().parent().find("td").eq(2).data("id")).change();
                $("#txtCode").minicolors("value", $(input).parent().parent().find("td").eq(3).text());
            }

        }

        function Add() {
            console.log($("#txtCode").val());
            $("#btn-save").attr("disabled", "disabled");
            if ($("#txtName").val().length == 0) {
                alert("Please enter brand name");
            } else if ($("#txtCode").val().length == 0) {
                alert("Please enter color");
            } else {
                $.post("/cp/do/color/add.ashx", {
                    name: $("#txtName").val(),
                    brandID: $("#txtBrand").val(),
                    hex: $("#txtCode").val()
                }, data => {
                    data = JSON.parse(data);
                    if (data.success == -1) {
                        alert("Error occur. Please try again");
                        console.log(data.error);
                    } else {
                         swal("Insert success");
                        location.reload();
                    }
                });
            }
        }

        function Edit(id) {
            $("#btn-save").attr("disabled", "disabled");
            if ($("#txtName").val().length > 0) {
                $.post("/cp/do/color/edit.ashx", {
                    id: id,
                    name: $("#txtName").val(),
                    brandID: $("#txtBrand").val(),
                    hex: $("#txtCode").val()

                }, data => {
                    data = JSON.parse(data);

                    if (data.success == -1) {
                        alert("Error occur. Please try again");
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
            $(input).prop("disabled", true);
            //$(input).text("Deleting");
            ShowLoading();
            alertify.confirm("Are you sure Delete", function () {
                $.ajax({
                    url: "/cp/do/color/delete.aspx",
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
                           swal("Delete success");
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
                        //$(input).text("Delete");
                        HideLoading();
                    }
                })

            });
        }

        $(function () {
            $("#txtCode").minicolors({
                theme: 'bootstrap'
            });
        })
    </script>
</asp:Content>