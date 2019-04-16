<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Voucher.aspx.cs" Inherits="cp_page_voucher_Voucher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Voucher</li>
    </ol>
    <a class="btn btn-success" data-toggle="modal" data-target="#modalAddVoucher">Add New Voucher</a>
        
    <!-- /page header -->
    <!-- Content area -->
    <div class="content">
        <!-- Table -->
        <div class="panel panel-flat">
            <div class="panel-heading">
                <input id="txtSearch" style="width: 500px; margin-left: 200px; float: left; overflow: hidden;" type="text" class="form-control" placeholder="Input phonenumber and press Enter" />
                <button style="" class="btn btn-search btn-success" onclick="SearchReward()">Search</button>

                <h5 class="panel-title" style="width: 300px"><span class="icon-medal2"></span>Voucher (<%=list.Count %>)</h5>
                <div class="heading-elements">
                </div>
            </div>

            <div class="table-responsive" id="tblReward">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>VoucherID</th>
                            <th>VoucherName</th>
                            <th>VoucherMinCost</th>
                            <th>VoucherDefaultCost</th>
                            <th>VoucherCode</th>
                            <th>UserId</th>
                            <th>Added Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            string pn = "0";
                            for (int i = list.Count - 1 ; i > -1; i-- )
                   {%>
                        <tr class="model_<%=list[i].VoucherID %>">
                            <td><%=list[i].VoucherID %></td>
                            <td><%=list[i].VoucherName%></td>
                            <td><%=list[i].VoucherMinCost%></td>
                            <td><%=list[i].VoucherDefaultCost%></td>
                            <td><%=list[i].VoucherCode%></td>
                            <td><%=UM.GetEmailByID(Convert.ToInt32(list[i].UserId))%> <br /> 
                                <% try { pn = UM.GetUserByID(Convert.ToInt32(list[i].UserId)).PhoneNumber; } catch { } %>
                                <%= pn %>

                            </td>
                            <td><%=list[i].VoucherAddedDate %></td>
                            <td>
                                <a class="btn btn-info" onclick="Edit(<%=list[i].VoucherID%>)">
                                    <i class="fa fa-edit" style="font-size: 15px; right: 10px"></i>
                                </a>
                                <a class="btn" onclick="Delete(this,<%=list[i].VoucherID %>)">
                                    <i class="fa fa-trash" style="font-size: 15px"></i>
                                </a>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- /table -->

    <!-- ./ content-->
    <!-- Modal EDIT VOUCHER -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    
                    <h4 class="modal-title" id="m-title">Edit Voucher</h4>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label class="control-label">UserId</label>


                        <input class="form-control" id="txtuserid"  disabled="disabled" />

                    </div>
                    <div class="form-group">
                        <label class="control-label">VoucherId</label>
                        <input class="form-control" id="txtvoucherid" disabled="disabled" />
                    </div>


                    <div class="form-group">
                        <label class="control-label">VoucherName</label>
                        <select id="voucherleveledit" class="form-control">
                            <option value="VoucherLevel1">VoucherLevel1</option>
                            <option value="VoucherLevel2">VoucherLevel2</option>
                            <option value="VoucherLevel3">VoucherLevel3</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label class="control-label">VoucherMinCost</label>
                        <input class="form-control" id="txtvouchermincost" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">VoucherDefaultCost</label>
                        <input class="form-control" id="txtvoucherdefaultcost" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">VoucherDescription</label>
                        <input class="form-control" id="txtvoucherdesc" />
                    </div>



                </div>
                <div class="modal-footer">
                    <input type="hidden" id="txtId" value="" />
                    <button type="button" class="btn btn-success" onclick="Add()">Save</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- ./ Modal EDIT VOUCHER -->


    <!-- Modal ADD VOUCHER  -->
    <div id="modalAddVoucher" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    
                    <h4 class="modal-title">Add Voucher</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <input class="form-control" id="txtSearchUser" placeholder="Input phone number to get userid..." />
                        <p></p>
                        <button class="btn btn-search btn-success" onclick="SearchUser()">Search</button>
                    </div>

                    <div class="form-group">
                        <label><b>User name</b></label>
                        <input class="form-control" id="txtUserNameNew" disabled="disabled" />
                        <input type="hidden" id="txtUserID" />
                    </div>
                    <div class="form-group">
                        <label><b>Voucher-Name</b></label>
                        <select class="form-control" id="voucherlevel">
                            <option value="VoucherLevel1">VoucherLevel1</option>
                            <option value="VoucherLevel2">VoucherLevel2</option>
                            <option value="VoucherLevel3">VoucherLevel3</option>
                        </select>
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" onclick="AddVoucher()">Add</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>


            </div>
        </div>
    </div>
    <!-- ./ Modal VOUCHER -->

    <script>
        function UpdateStatus(SliderID, Status) {
            //alert(SliderID + "-" + Status)
        }
        var RewardID = 0;
        var UserId = "";
        var searchid = "";
        var voucherok = 0;
        function checkvouchercode(vouchercode) {

            alert("You have choose Voucher with code : " + vouchercode);
            $("#txtVoucherCode").val(vouchercode);

        }
        function checkcash(val) {
            var paymethod = parseFloat(val);
            var cash = parseFloat($("#txtcash").val());
            cash = cash - paymethod;
            $("#txtcash").val(cash);
        }
        function checkgiftcard(giftcardcost, id, giftcardcode) {

            var flag = true;

            var spent = $("#txtPriceNew").val();
            if (spent.trim().length == 0) {
                swal("Error", "The spent not null!");
                flag = false;
            }
            if (flag == true) {
                var giftcardcode = giftcardcode;
                var giftcardcost = giftcardcost;

                var output = "<input class='form-control' id='txtgiftcardused'/><button class='btn btn-primary' onclick='usethisgiftcard(\"" + giftcardcode + "\",\"" + giftcardcost + "\")' >Use this GiftCard</button>";
                $("#" + id).attr("disabled", "true");

                $("#usegiftcard").html(output);
                $("#txtgiftcardused").val(giftcardcost);
            }
        }
        function usethisgiftcard(giftcardcode, giftcardcost) {
            var giftcardcode = giftcardcode;
            var giftcardcost = giftcardcost;

            var totalgiftcard = parseFloat($("#txtgiftcardused").val());
            $.post("/cp/api/usegiftcard.aspx", { giftcardcode: giftcardcode, giftcardcost: totalgiftcard });

            var cost = parseFloat(giftcardcost);
            $("#txttxtgiftcardused").val(cost);
            if ($("#txtgiftcard").val() == "") {
                swal("", "You have use GiftCard");
                totalgiftcard = cost;
                $("#txtgiftcard").val(totalgiftcard);
                checkcash(cost);

            }
            else {
                giftcard = parseFloat($("#txtgiftcard").val());
                checkcash(cost);
                totalgiftcard += giftcard;
                swal("", "You have use GiftCard");
                $("#txtgiftcard").val(totalgiftcard);



            }


        }

        function nocheckvoucher() {
            var flag = true;

            var spent = $("#txtPriceNew").val();
            if (spent.trim().length == 0) {
                swal("Error", "The spent not null!");
                flag = false;
            }
            if (flag == true) {
                swal("Correct", "You have use no Voucher!");
                var price = parseFloat($("#txtPriceNew").val());
                var discount = parseFloat($("#txtdiscount").val());
                var notttttt = (price * discount);
                var subprice = price - (price * discount);
                var ttdiscount = (price * discount);
                $("#txtRewardNew").val(subprice);


                $("#lblVoucherOk").html("With no use voucher you are discounted $" + 0 + "<br/> and membership: " + discount * 100 + "% $" + notttttt + " ");

                $("#txttotaldiscount").val(ttdiscount);
                $("#txtcash").val(subprice);
                $("#txttotalpayment").val(subprice);
            }
        }
        function CheckVoucher(vouchercode) {
            var flag = true;
            var spent = $("#txtPriceNew").val();
            if (spent.trim().length == 0) {
                swal("Error", "The spent not null!");
                flag = false;
            }
            if (flag == true) {
                $("#txtVoucherCode").val(vouchercode);
                var uid = $("#txtUserID").val();
                var vouchercode = $("#txtVoucherCode").val();

                if (vouchercode.trim().length == 0) {
                    swal("", "Please enter voucher code.!");
                }
                else {
                    $.post("/cp/api/check-voucher-exist.aspx", { vouchercode: vouchercode, userid: uid }, function (data) {
                        if (data == 1) {
                            voucherok = 0;
                            swal("Error", "Voucher is used! or not existed! Please check again!");
                        }
                        else {
                            voucherok = 1;
                            swal("Correct", "Thank you for using this voucher!");
                            // UPDATE User Reward  -->
                            var price = parseFloat($("#txtPriceNew").val());
                            var discount = parseFloat($("#txtdiscount").val());
                            var notttttt = (price * discount);
                            var subprice = price - (price * discount) - parseFloat(data);
                            var ttdiscount = (price * discount) + parseFloat(data);
                            $("#txtRewardNew").val(subprice);


                            $("#lblVoucherOk").html("With this voucher you are discounted $" + data + "<br/> and membership: " + discount * 100 + "% $" + notttttt + " ");

                            $("#txttotaldiscount").val(ttdiscount);
                            $("#txttotalpayment").val(subprice);

                        }
                    });
                }
            }
        }




        function Add() {
            var voucherid = $("#txtvoucherid").val();

            var voucherlevel = $('#voucherleveledit :selected').text();
            var vouchermincost = $("#txtvouchermincost").val();
            var voucherdefaultcost = $("#txtvoucherdefaultcost").val();
            var voucherdesc = $("#txtvoucherdesc").val();

            var UserId = $("#txtuserid").val();
            $.post("/cp/do/voucher/edit-voucher.aspx", {

                voucherid: voucherid,
                UserId: UserId,

                voucherlevel: voucherlevel,
                vouchermincost: vouchermincost,
                voucherdefaultcost: voucherdefaultcost,
                voucherdesc: voucherdesc

            }, function (data) {
                if (data == 1) {
                    alert("OK.!");
                    location.href = "/cp/page/voucher/Voucher.aspx"
                }
                else {
                    alert("Lỗi, thử lại!!")
                }
            }

            );

        }

        function Edit(id) {

            RewardID = id;
            document.getElementById("m-title").innerHTML = "Edit Voucher";

            $.getJSON("/cp/do/voucher/get-json-voucher.aspx", { id: id }, function (data) {

                $("#txtuserid").val(data.UserId);
                $("#txtvoucherid").val(data.VoucherID);
                $("#txtvouchername").val(data.VoucherName);
                $("#txtvouchermincost").val(data.VoucherMinCost);
                $("#txtvoucherdefaultcost").val(data.VoucherDefaultCost);
                $("#txtvoucherdesc").val(data.VoucerDescreption);
                var voucherlevel = $("#txtvouchername").val();
                $("#voucherleveledit select").val(voucherlevel);





            })
            $('#txtId').val(id);
            $('#myModal').modal({
                backdrop: 'static',
                keyboard: false
            });
        }
        function Delete(input,id) {
            alertify.confirm("Are you sure Delete", function () {
                $(input).prop("disabled", true);
                ShowLoading();
                $.ajax({
                    url: "/cp/do/voucher/delete-voucher.aspx",
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
                            location.href = "/cp-voucher";
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


        function openModal(id) {

            $("#txtuserid").val("");
            $("#txtReward").val("");
            $("#txtrewarddate").val("");
            $("#txtPrice").val("");

            if (id == 0) {
                searchid = "true";
                document.getElementById("m-title").innerHTML = "Add Reward";
                $("#txtUserIdAdd").show();
                $("#txtuserid").hide();
                $("#txt-reward").hide();
                $("#txtSearchUser").show();
                //$("#txtRewardDateAdd").hide();

                $("#txt-rewarddate").hide();
                //$("#txtReward").val("0");
            }
            else {
                document.getElementById("m-title").innerHTML = "Edit Voucher";
                $("#txtpass-word").hide();
                $("#txtUserIdAdd").hide();
                $("#txtrewarddate").hide();
                $("#txtuserid").show();
            }
            $('#txtId').val(id);
            $('#myModal').modal({
                backdrop: 'static',
                keyboard: false
            });
        }

        /* Search user */
        document.getElementById('txtSearchUser').onkeydown = (function (event) {

            if (event.keyCode == 13) {

                SearchUser();
            }
        });
        function SearchUser() {
            var text = $("#txtSearchUser").val();
            var flags = true;
            var logtext = text.trim();
            if (text.trim() == "") {
                flags = false;
                alert('Please input user phone number!');
            }
            else {
                console.log(text);
                $.getJSON("/cp/api/search-user.aspx", {
                    searchStr: text,
                }, function (data) {
                    var userName = data.FirstName + " " + data.LastName;
                    console.log(data.FirstName);
                    if (userName.trim() != "" || userName != null) {
                        $("#txtUserNameNew").val(userName);
                        $("#txtUserID").val(data.UserId);


                    } else {
                        $("#txtUserNameNew").val("User not exist.");
                    }
                });

            }

        }


        function SearchReward() {
            var phone = $("#txtSearch").val();
            $.post("/cp/page/voucher/search-voucher.aspx", {
                phone: phone,
            }, function (data) {

                $("#tblReward").html(data);
            });
        }
        /* Search reward */
        document.getElementById('txtSearch').onkeydown = function (event) {
            if (event.keyCode == 13) {
                SearchReward();
            } else {
                $("#tblReward").load(" #tblReward");
            }
        }

        $(document).ready(function () {
            var currentDate = new Date().toUTCString();
            $("#txtRewardDate").val(currentDate);

        });

        /***** Add New Reward **********/
        function AddVoucher() {
            var error = "";
            var flag = true;
            var userID = $("#txtUserID").val();

            var voucherlevel = $('#voucherlevel :selected').text();




            if (userID.trim().length == 0) {
                error += "Please enter userid.!";
                flag = false;
            }

            if (flag == false) {
                alert("Voucher error", error);
            }
            else {


                $.post("/cp/do/voucher/add-new-voucher.aspx", {
                    userId: userID,
                    voucherlevel: voucherlevel

                }, function (data) {
                    if (data == 1) {
                        location.href = "/cp/Voucher.aspx"
                    }
                    else {
                        alert(data);
                    }
                });
            }
        }
        /***** /Add New Reward **********/
    </script>
</asp:Content>

