<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Color.aspx.cs" Inherits="cp_page_color_Color" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js" ></script>
    <link href="/cp/page/service/StyleSheet.css" rel="stylesheet" />
     <script src="/cp/lib/color-picker/jquery.minicolors.js" ></script>
    <link href="/cp/lib/color-picker/jquery.minicolors.css" rel="stylesheet" />
    <script src="/cp/page/service/bootstrap-table-pagination.js"></script>
    <script src="/cp/page/service/pagination.js"></script>
    

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
        <input id="txtSearch" style="width: 500px; margin-left: 200px; float: left; overflow: hidden;" type="text" class="form-control" placeholder="Input name color and press Enter" />
        <button style="" class="btn btn-search btn-success" onclick="SearchReward()">Search</button>
        </div>
        <p></p>
        <div class="panel-heading">
            <h7 class="panel-title">Color (<%=list.Count %>)</h7>
            <div class="heading-elements">
            </div>
        </div>
        <div id="tblReward">
        <div class="table-responsive">
            <table class="table table-bordered paginated">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Brand</th>
                        <th>Color</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody id="developers">
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
            <div class="col-md-12 text-center">
			    <ul class="pagination pagination-lg pager" id="developer_page"></ul>
		    </div>
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
            jQuery.noConflict();
            $("#mdInput").modal();
            if (type == 0) {
                jQuery("#btn-save").attr("onclick", "Add()");
                jQuery("#txtCode").minicolors("value", "#ffffff");
            }
            else {
                $("#btn-save").attr("onclick", "Edit(" + type + ")");
                $("#txtName").val(jQuery(input).parent().parent().find("td").eq(1).text());
                $("#txtBrand").val(jQuery(input).parent().parent().find("td").eq(2).data("id")).change();
                $("#txtCode").minicolors("value", jQuery(input).parent().parent().find("td").eq(3).text());
            }

        }

        function Add() {
            console.log(jQuery("#txtCode").val());
            jQuery("#btn-save").attr("disabled", "disabled");
            if (jQuery("#txtName").val().length == 0) {
                alert("Please enter brand name");
            } else if (jQuery("#txtCode").val().length == 0) {
                alert("Please enter color");
            } else {
                jQuery.post("/cp/do/color/add.ashx", {
                    name: jQuery("#txtName").val(),
                    brandID: jQuery("#txtBrand").val(),
                    hex: jQuery("#txtCode").val()
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
            jQuery("#btn-save").attr("disabled", "disabled");
            if (jQuery("#txtName").val().length > 0) {
                jQuery.post("/cp/do/color/edit.ashx", {
                    id: id,
                    name: jQuery("#txtName").val(),
                    brandID: jQuery("#txtBrand").val(),
                    hex: jQuery("#txtCode").val()

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


        function SearchReward() {
            var name = $("#txtSearch").val();
            $.post("/cp/page/color/search-color.aspx", {
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