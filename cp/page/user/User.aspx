<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="cp_page_user_User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>

        .action-box {
            display: inline-flex;
        }

            .action-box > button {
                margin: 5px;
            }

        .btn-redeem {
            margin: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Page header -->
     <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">User</li>
    </ol>
    <div class="heading-elements">
        <a id="btn-add" class="btn btn-success" onclick="OpenModal(0)" class="btn  btn-labeled-right bg-blue ">Add New </a>
    </div>
    <p></p>
    <div class="panel panel-flat">
        <div class="panel-heading">
            <div class="col-md-6 col-md-offset-3">
                <input style="margin-left:300px;" class="form-control" onkeyup="Search(this)" placeholder="input phone number" />
            </div>

            <h7 class="panel-title" style="width: 150px"><span class="fa fa-user-alt"></span>Users (<%=list.Count %>)</h7>
            <p></p>
            <div class="heading-elements">
            </div>
        </div>

        <div class="table" id="tblUsers">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Birthday</th>
                        <th>Register Date</th>
                        <th>Reward</th>
                        <th>Rank</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody id="tbody-user">
                    <%foreach (var i in list)
                        { %>
                    <tr>
                        <td><%=i.UserId %></td>
                        <td><%=i.FirstName+" "+i.LastName %></td>
                        <td><%=i.Email %></td>
                        <td><%=i.PhoneNumber %></td>
                        <td><% try { string bd = DateTime.Parse(i.Birthday).ToString("MM/dd/yyyy");
                               Response.Write(bd);
                               }
                               catch { Response.Write("--"); } %></td>
                        <td><%=DateTime.Parse(i.RegisterDate.ToString()).ToString("MM/dd/yyyy") %></td>
                        <td><%=i.TotalReward %></td>
                        <td><%=level[Convert.ToInt32(i.UserLevel)] %></td>
                        <td>
                            <div class="action-box">
                                <a class="btn btn-info" onclick="OpenModal(<%=i.UserId%>)">
                                   <i class="fas fa-edit"></i>
                                </a>
                                <a class="btn"  onclick="Delete(this,<%=i.UserId%>)"><i class="fas fa-trash"></i></a>
                                <button  onclick="OpenRedeem(<%=i.UserId %>)"><i class="fas fa-gift"></i></button>
                            </div>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <div id="mdUser" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="m-title">User</h4>
                </div>
                <div class="row modal-body">
                    <div class="col-md-6 form-group">
                        <label>First Name</label>
                        <input class="form-control" id="txtfName" />
                    </div>
                    <div class="col-md-6 form-group">
                        <label>First Name</label>
                        <input class="form-control" id="txtlName" />
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Password</label>
                        <input type="password" class="form-control" id="txt-password" />
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Retype-Password</label>
                        <input type="password" class="form-control" id="txtre-password" />
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Email</label>
                        <input id="txtEmail" class="form-control" />
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Phone Number</label>
                        <input id="txtPhone" class="form-control" />
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Birthday</label>
                        <input id="txtEBirthday" class="form-control date" type="text" />
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Reward</label>
                        <input id="txtReward" value="0" class="form-control" />
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btn-save">Save</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    <div id="mdRedeem" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Redeem Voucher</h4>
                </div>
                <div class="modal-body" style="text-align: center">
                    <button class="btn btn-info btn-lg btn-redeem">GET $5.00 VOUCHER - 100 POINTS</button>
                    <button class="btn btn-info btn-lg btn-redeem">GET $10.00 VOUCHER - 200 POINTS</button>
                    <button class="btn btn-info btn-lg btn-redeem">GET $15.00 VOUCHER - 300 POINTS</button>
                    <button class="btn btn-info btn-lg btn-redeem">GET $20.00 VOUCHER - 400 POINTS</button>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>


    <div id="mdIncrease" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add point</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Point</label>
                        <input type="number" class="form-control" id="point" />
                    </div>
                    <div class="form-group text-center">
                        <button class="btn btn-success" id="btn-submit-increase">Submit</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(function () {
            $(".date").datetimepicker({
                viewMode: 'days',
                format: 'MM/DD/YYYY',
            });
        });

        function Search(input) {
            var filter = $(input).val();

            for (i = 0; i < $("#tbody-user tr").length; i++) {
                var td = $("#tbody-user tr").eq(i).find("td").eq(3);
                if (td.text().indexOf(filter) > -1) {
                    $("#tbody-user tr").eq(i).show();
                } else {
                    $("#tbody-user tr").eq(i).hide();
                }
            }
        }

        function OpenModal(id) {
            $("#mdUser input").val("");
            $("#mdUser").modal();
            if (id == 0) {
                $("#btn-save").attr("onclick", "Add()");
                $("#txt-password").parent().show();
                $("#txtre-password").parent().show();
                $("#txtEmail").removeAttr("disabled");
            } else {
                $("#btn-save").attr("onclick", "Edit(" + id + ")");
                $("#txt-password").parent().hide();
                $("#txtre-password").parent().hide();
                $("#txtEmail").attr("disabled", "disabled");
                $.post("/cp/do/user/get-by-ID.ashx", {
                    id: id
                }, function (data) {
                    data = JSON.parse(data);
                    if (data.success == -1) {
                        console.log(data.error);
                        alertify.error("Error. Please try again");
                    } else {
                        $("#txtfName").val(data.first_name);
                        $("#txtlName").val(data.last_name);
                        $("#txtEmail").val(data.email);
                        $("#txtPhone").val(data.phone);
                        $("#txtEBirthday").val(data.birthday);
                        $("#txtReward").val(data.reward);
                    }
                })
            }
        }


        function OpenRedeem(UserID) {
            $("#mdRedeem").modal();
            $(".btn-redeem").eq(0).attr("onclick", `Redeem(${UserID},1)`);
            $(".btn-redeem").eq(1).attr("onclick", `Redeem(${UserID},2)`);
            $(".btn-redeem").eq(2).attr("onclick", `Redeem(${UserID},3)`);
            $(".btn-redeem").eq(3).attr("onclick", `Redeem(${UserID},4)`);
        }


        function Redeem(userID, type) {
            swal({
                title: "Are you sure?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: '#DD6B55',
                confirmButtonText: 'Yes, I am sure!',
                cancelButtonText: "No, cancel it!",
                closeOnConfirm: false,
                closeOnCancel: false
            }).then(function (result) {
                if (result.value) {
                    $.post("/cp/do/user/redeem.ashx", {
                        type: type,
                        userID: userID
                    }, function (data) {
                        if (data.success == -1) {
                            console.log(data.error);
                            alertify.error("Error. Pleaser try again");
                        } else if (data.success == 0) {
                            alertify.error(data.message);
                        } else {
                            alertify.success("Redeem successfully");
                            location.reload();
                        }
                    });
                }
            });
        }


        function Add() {

            var fname = $("#txtfName").val();
            var lname = $("#txtlName").val();
            var password = $("#txt-password").val();
            var _repassword = $("#txtre-password").val();
            var email = $("#txtEmail").val();
            var phone = $("#txtPhone").val();
            var birthday = $("#txtEBirthday").val();
            var reward = $("#txtReward").val();

            var regex = /^(\([0-9]{3}\) |[0-9]{3}-)[0-9]{3}-[0-9]{4}$/;
            var re =
                /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;

            if (fname.trim().length == 0) {
                alert.error("Please enter first name !");
            } else if (fname.trim().length < 2 || fname.trim().length > 100) {
                alert.error("Fist name more than 2 and less than 100 characters.");
            } else if (lname.trim().length == 0) {
                alert.error("Please enter last name !");
            } else if (lname.trim().length < 2 || lname.trim().length > 100) {
                alert.error("Last name more than 2 and less than 100 characters.");
            } else if (password.trim().length == 0 || _repassword.trim().length == 0) {
                alert.error("Please enter password.");
            } else if (password.trim() != _repassword.trim()) {
                alert.error("Confirm password invalid. ");
            } else if (password.trim().length < 8) {
                alert.error("Password must more than 8 character. ");
            } else if (email.trim().length == 0) {
                alert.error("Please enter your email address!");
            } else if (!re.test(email)) {
                alert.error("Not a valid email address");
            } else if (phone.trim().length == 0) {
                alert.error("Please enter your Phone.");
            } else if (birthday.trim().length == 0) {
                alert.error("Please enter your birthday!");
            } else {
                $("#btn-save").attr("disabled", "disabled");
                $("#btn-save").text("Adding");
                $.post("/cp/do/user/add.ashx", {
                    fname: fname,
                    lname: lname,
                    password: password,
                    email: email,
                    phone: phone,
                    birthday: birthday,
                    reward: reward
                }, function (data) {
                    data = JSON.parse(data);
                    $("#btn-save").removeAttr("disabled");
                    $("#btn-save").text("Add");
                    if (data.success == -1) {
                        console.log(data.error);
                        alertify.error("Error. Please try again");
                    } else if (data.success == 0) {
                        alertify.error("Email existed");
                    } else {
                        alertify.success("Add success");
                        location.reload();
                    }
                });
            }
        }


        function Edit(id) {

            var fname = $("#txtfName").val();
            var lname = $("#txtlName").val();
            var phone = $("#txtPhone").val();
            var birthday = $("#txtEBirthday").val();
            var reward = $("#txtReward").val();

            var regex = /^(\([0-9]{3}\) |[0-9]{3}-)[0-9]{3}-[0-9]{4}$/;
            var re =
                /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;

            if (fname.trim().length == 0) {
                alertify.error("Please enter first name !");
            } else if (fname.trim().length < 2 || fname.trim().length > 100) {
                alertify.error("Fist name more than 2 and less than 100 characters.");
            } else if (lname.trim().length == 0) {
                alertify.error("Please enter last name !");
            } else if (lname.trim().length < 2 || lname.trim().length > 100) {
                alertify.error("Last name more than 2 and less than 100 characters.");
            } else if (phone.trim().length == 0) {
                alertify.error("Please enter your Phone.");
            } else if (birthday.trim().length == 0) {
                alertify.error("Please enter your birthday!");
            } else {
                $("#btn-save").attr("disabled", "disabled");
                $("#btn-save").text("Editing");
                $.post("/cp/do/user/edit.ashx", {
                    id: id,
                    fname: fname,
                    lname: lname,
                    phone: phone,
                    birthday: birthday,
                    reward: reward
                }, function (data) {
                    data = JSON.parse(data);
                    $("#btn-save").removeAttr("disabled");
                    $("#btn-save").text("Edit");
                    if (data.success == -1) {
                        console.log(data.error);
                        alertify.error("Error. Please try again");
                    } else {
                        alertify.success("Edit success");
                        location.reload();
                    }
                });
            }
        }

        function Delete(input,id) {
            alertify.confirm("Are you sure Delete", function () {
                $(input).prop("disabled", true);
                ShowLoading();
                $.ajax({
                    url: "/cp/do/user/delete.aspx",
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
                            location.href = "/cp-user";
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

        function IncreasePoint(userID) {
            $("#mdIncrease").modal();
            $("#btn-submit-increase").attr("onclick", "SubmitIncrease(" + userID + ")");
        }

        function SubmitIncrease(userID) {
            $("#btn-submit-increase").prop("disabled", true);
            $.post("/cp/do/user/increase-point.ashx", {
                id: userID,
                value: $("#point").val()
            }, data => {
                data = JSON.parse(data);
                if (data.success == -1) {
                    alertify.error("Error occur. Please try again");
                    console.log(data.error);
                    $("#btn-submit-increase").prop("disabled", false);
                } else {
                    $("#btn-submit-increase").prop("disabled", false);
                    location.reload();
                }
                $("#mdIncrease").modal("hide");
            })
        }
    </script>
</asp:Content>
