<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Reward.aspx.cs" Inherits="cp_page_reward_Reward" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <!-- Page header -->
    <div class="page-header">
        <div class="page-header-content">
            <div class="page-title">
                <h4><i class="icon-arrow-left52 position-left"></i><span class="text-semibold">Reward</span> Management</h4>
            </div>

            <div class="heading-elements">
                <a id="btn-add" data-toggle="modal" data-target="#addRewardModal" class="btn btn-labeled btn-labeled-right bg-blue heading-btn">Add New <b><i class="icon-menu7"></i></b></a>
            </div>
        </div>

        <div class="breadcrumb-line">
            <ul class="breadcrumb">
                <li><a href="/"><i class="icon-home2 position-left"></i>Home</a></li>
                <li><a href="/cp/Reward.aspx"><i class="icon-blog position-left"></i>Reward Management</a></li>
            </ul>


        </div>
    </div>  
    <!-- /page header -->
    <!-- Content area -->
    <div class="content">
        <!-- Table -->
        <div class="panel panel-flat">
            <div class="panel-heading">
                <div class="form-group">
                    <input id="txtSearch" style="width: 500px; float: left; overflow: hidden;" type="text" class="form-control" placeholder="Input phonenumber and press Enter" />
                <button class="btn btn-search btn-success" onclick="SearchReward()" style="margin-left:10px;margin-top:0.5px">Search</button>
                
                    </div>
                <div class="form-group" style="display: -webkit-inline-box;">
                    <label class="control-label"><b>Search-By-Date</b></label>
                    <div class="" style="margin-left: 10px; width: 40%">
                        <label class="control-label">FromDate</label>
                        <input class="form-control" id="txtfromdate" type="date" style="" />

                    </div>
                    <div class="" style="margin-left: 10px; width: 40%">
                        <label class="control-label">ToDate</label>
                        <input class="form-control" id="txttodate" type="date" style="" />
                    </div>
                </div>
                    <div class="form-group">
                    <button class="btn btn-danger" style="margin-left: 20px" onclick="searchday()">SEARCH-BY-DATE</button>
                </div>
            </div>
               
                <div class="heading-elements">
                </div>
                    

            <div class="table-responsive" id="tblReward">
                 <h5 class="panel-title" style="width:300px"><span class="icon-medal2""></span> Reward (<%=list.Count%>)</h5>
                <table class="table">
                    <thead>
                        <tr>
                            <th>RewardID</th>
                            <th>User</th>
                            <th>Point</th>
                            <th>Date</th>
                            <th>Phone</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%foreach (var i in list)
                            { %>
                        <tr class="model_<%=i.RewardID %>">
                            <td><%=i.RewardID %></td>
                            <td><%=i.UserId %><p style=""><%
                                                              UserManager UM = new UserManager();
                                                              UsersTbx user = new UsersTbx();
                                                              user = UM.GetUserByID(Convert.ToInt32(i.UserId));%>
                                <%=user.FirstName%>  <%=user.LastName%></p></td>

                            <td><%=i.Reward %></td>
                            <td><%=i.RewardDate %></td>
                            <td>
                                <%=user.PhoneNumber %>
                            </td>
                            <td>
                                <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Action
                                            <span class="caret"></span></button>

                                    <ul class="dropdown-menu" style="padding:5px">
                                        <li style="float:left;margin-left:5px"><button class="btn btn-success" onclick="Edit(<%=i.RewardID%>)">Edit</button></li>
                                        <li style="float:left;margin-left:5px"><button class="btn btn-danger" onclick="Delete(<%=i.RewardID%>)">Delete</button></li>
                                    </ul>
                                
                                </div>
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
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" id="m-title">Edit Reward</h4>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label class="control-label">UserId   </label>
                        
                       
                        <input class="form-control" id="txtuserid" disabled="disabled" />
                        <label id=username>Name</label>
                        <input class="form-control" id="txtusername" disabled="disabled"/>
                    
                        <input class="form-control" id="txtUserIdAdd" />
                    </div>
                    <div class="form-group" id="txt-rewarddate">
                            <label class="control-label" id="lblRewardDate" >RewardDate</label>
                            <input class="form-control" id="txtrewarddate" disabled="disabled" /> 
                        </div>
                        <div class="form-group" >
                                <label class="control-label" >Phone</label>
                                <input class="form-control" id="txtPhone" disabled="disabled"/> 
                            </div>
                            <div class="form-group" >
                                    <label class="control-label" >Email</label>
                                    <input class="form-control" id="txtEmail" disabled="disabled"/> 
                                </div>

                    <div class="form-group" >
                        <label class="control-label" >Price</label>
                        <input class="form-control" id="txtPrice" /> 
                    </div>
                    <div class="form-group" id="txt-reward">
                        <label class="control-label" >Reward</label>
                        <input class="form-control" id="txtReward" />
                    </div>
                    <div class="form-group">
                        <label>Notes</label>
                        <textarea style="height:200px;" class="form-control" id="txtRewardNotes" placeholder="Please enter your notes sevices..."></textarea>
                    </div>

                    
                   
                    <div class="modal-footer">
                        <input type="hidden" id="txtId" value="" />
                        <button type="button" class="btn btn-success" onclick="Add()">Save</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div id="addRewardModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add Reward</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                            <input class="form-control"  id="txtSearchUser" placeholder="Input phone number to get userid..." />
                            <button class="btn btn-search btn-success" onclick="SearchUser()">Search</button>
                    </div> 

                    <div class="form-group">
                        <label><b>User name</b></label>
                        <input class="form-control" id="txtUserNameNew" disabled="disabled" />
                        <input type="hidden" id="txtUserID" />
                    </div>
                    <div class="form-group">
                        <label><b>Spent</b></label>
                        <input class="form-control" id="txtPriceNew" />
                    </div>
                    <div class="form-group">
                        <label><b>DisCount</b></label>
                        <input class="form-control" id="txtdiscount" />
                    </div>
                    <div class="form-group">
                        <label><b>Voucher Code</b></label>
                        <div id="lblVoucher"></div>
                        
                        <input class="form-control" id="txtVoucherCode" />
                            <button class="btn btn-primary" onclick="CheckVoucher()">Check Voucher</button>
                            <button class="btn btn-primary" onclick="nocheckvoucher()">No Use Voucher</button>

                        <div id="lblVoucherOk" style="padding:10px;color:green"></div>
                    </div>
                    
                    
                    
                    <div class="form-group">
                        <label><b>Total Discount</b></label>
                        <input class="form-control" id="txttotaldiscount" />
                    </div>
                    <div class="form-group">
                        <label><b> Pay by GiftCard</b></label>
                        <div id="lblgiftcard">
                            
                        </div>
                        <div id="usegiftcard">

                        </div>
                        <div class="form-group">
                        <label><b> Total GiftCard</b></label>
                        <input class="form-control" id="txtgiftcard" onchange="checkcash(this.value)" />
                        </div>

                    </div>

                    <div class="form-group">
                        <label><b> Pay by Credit</b></label>
                        <input class="form-control" id="txtcredit" onchange="checkcash(this.value)"/>
                    </div>
                    <div class="form-group">
                        <label><b> Pay by NoaNail-Credit</b></label>
                        <input class="form-control" id="txtnoanailcredit" onchange="checkcash(this.value)"/>
                    </div>
                    <div class="form-group">
                        <label><b> Pay by Cash</b></label>
                        <input class="form-control" id="txtcash" />
                    </div>
                    
                    <div class="form-group">
                        <label><b> Total Payment</b></label>
                        <input class="form-control" id="txttotalpayment" />
                    </div>

                       
                    <div class="form-group">
                        <label><b>Reward Point</b></label>
                        <input class="form-control" id="txtRewardNew" />
                    </div>
                    <div class="form-group">
                        <label><b>Reward Date</b></label>
                        <input class="form-control" id="txtRewardDate" disabled="disabled" />
                    </div>
                    <div class="form-group">
                        <label><b>Notes</b></label>
                        <textarea style="height:200px;" class="form-control" id="txtrewardnote" placeholder="Please enter your notes sevices..."></textarea>
                    </div>
                    <div class="form-group">
                    <applet name="jzebra" code="jzebra.PrintApplet.class" archive="./jzebra.jar" width="100" height="100">
                      <param name="printer" value="zebra">
                    </applet>
                    </div>
                    
                    <div class="modal-footer">
                        <button type="button" id="btnAddReward" class="btn btn-success" onclick="AddReward()">Add</button>
                        <button type="button" id="#btnPrint" onclick="Print()" class="btn btn-success" >Print</button>

                        <button type="button" style="float:left;color:aqua" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                    <script>
                        function Print()
                        {
                            $("#btnPrint").printPage();
                            //alert("test");
                        }
                        
                    </script>
                </div>
            </div>
        </div>
    </div>

    <script>

        function UpdateStatus(SliderID, Status) {
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
            var RewardDate = $("#txtrewarddate").val();
            var Price = $("#txtPrice").val();
            var fl = true;
            if (RewardID == 0) {
                UserId = $("#txtUserIdAdd").val();
                var Reward = $("#txtRewardNew").val();
            }
            else {
                var Reward = $("#txtRewardNew").val();
                UserId = $("#txtuserid").val();
                if (Reward.trim().length == 0) {
                    error += "Please enter Reward.\n";
                    fl = false;
                }
            }
            var base64 = "";
            var error = "";

            if (UserId.trim().length == 0) {
                error += "Please enter UserId.\n";
                fl = false;
            }

            if (Price.trim().length == 0) {
                error += "Please enter Price.\n "
                fl = false;
            }
            // truyen voucher code len server cho reward nay
            var vouchercode = $("#txtVoucherCode").val();
            if (voucherok == 0) {
                vouchercode = "no";
            }

            if (fl) {
                $.post("/cp/do/add-new-reward.aspx", {

                    RewardID: RewardID,
                    UserId: UserId,
                    Reward: Reward,
                    Price: Price,
                    vouchercode: vouchercode

                }, function (data) {
                    if (data == 1) {
                        swal("OK.!");
                        location.href = "/cp/Reward.aspx"
                    }
                    //else {
                    //    swal("Lỗi, thử lại!!")
                    //}
                }

                    );

            }
            else {
                swal(error);
            }
        }

        function Edit(id) {
            
            RewardID = id;
            document.getElementById("m-title").innerHTML = "Edit Reward";
            $("#txtpass-word").hide();
            $("#txtUserIdAdd").hide();
            $("#txtuserid").show();
            //$("#txtSearchUser").hide();
            $("#txt-rewarddate").show();
            //$("#txtRewardDateAdd").hide();
            $("#rewardnote").show();
            $.getJSON("/cp/do/get-json-reward.aspx", { id: id }, function (data) {

                $("#txtuserid").val(data.UserId);

                $.getJSON("/cp/do/get-json-user.aspx", { id: data.UserId }, function (userdata) {
                    $("#txtusername").val(userdata.FirstName + userdata.LastName);
                    $("#txtPhone").val(userdata.PhoneNumber);
                    $("#txtEmail").val(userdata.Email);
                })
                $("#txtReward").val(data.Reward);
                $("#txtrewarddate").val(data.RewardDate);
                $("#txtPrice").val(data.Price);
                $("#txtRewardNotes").val(data.Notes);

            })
            $('#txtId').val(id);
            $('#myModal').modal({
                backdrop: 'static',
                keyboard: false
            });
        }
        function Delete(id) {
            var r = confirm("Are you sure delete ?");
            if (r == true) {
                $.get("/cp/do/delete-reward.aspx", { id: id, status: -1 }, function (data) {
                    if (data == -1) {
                        $('#model_' + id).remove();
                        location.href = "/cp/Reward.aspx";
                    }
                })
            }
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
                document.getElementById("m-title").innerHTML = "Edit Reward";
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
            console.log(text);
            $.getJSON("/api/search-user.aspx", {
                searchStr: text,
            }, function (data) {
                var userlevel = "";
                var userdiscount = 0;
                if (data.UserLevel == 0) {
                    userlevel = " Normal";
                    userdiscount = 0;
                }
                else if (data.UserLevel == 1) {
                    userlevel = "Sliver";
                    userdiscount = 0.05
                }
                else if (data.UserLevel == 2) {
                    userlevel = "Gold";
                    userdiscount = 0.1;

                }
                else {
                    userlevel = "Platinum";
                    userdiscount = 0.15;
                }
                var userName = data.FirstName + " " + data.LastName + " User-Level: " + userlevel;
                console.log(data.FirstName);
                if (userName.trim() != "" || userName != null) {
                    $("#txtUserNameNew").val(userName);
                    $("#txtUserID").val(data.UserId);

                    $("#lblVoucher").html(data.VoucherList);
                    $("#lblgiftcard").html(data.GiftCardList);
                    $("#txtdiscount").val(userdiscount);
                } else {
                    $("#txtUserNameNew").val("User not exist.");
                }
            });
        }
        function searchday() {
            var fromdate = $("#txtfromdate").val();
            var todate = $("#txttodate").val();
            $.post("/api/search-bydate.aspx", {
                fromdate: fromdate,
                todate: todate
            }, function (data) {
                $("#tblReward").html(data);
            });
        }
        
        function SearchReward() {
            var phone = $("#txtSearch").val();
            $.post("/api/search-reward.aspx", {
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
        function AddReward() {
            $("#btnAddReward").hide();
            var error = "";
            var flag = true;
            var UserNameNew = $("#txtUserNameNew").val();
            var userID = $("#txtUserID").val();
            var price = $("#txtPriceNew").val();
            var rewardDate = $("#txtRewardDate").val();
            var notes = $("#txtrewardnote").val();
            var discount = $("#txttotaldiscount").val();
            var payment = $("#txttotalpayment").val();
            var cash = $("#txtcash").val();
            var credit = $("#txtcredit").val();
            var noanailcredit = $("#txtnoanailcredit").val();
            var giftcard = $("#txtgiftcard").val();

            var reward = $("#txtRewardNew").val();
            console.log(rewardDate);

            if (price.trim().length == 0) {
                error += "Please enter your spent.\n";
                flag = false;
            }
            if (reward.trim().length == 0) {
                error += "Please enter your reward.\n";
                flag = false;
            }
            if (UserNameNew.trim().length == 0) {
                error += "Please enter phone number into box search to get username.\n";
                flag = false;
            }
            if (notes.trim().length == 0) {
                error += "Please enter notes.\n";
                flag = false;
            }
            if (flag == false) {
                swal("Reward error", error);
                 $("#btnAddReward").show();
            }
            else {
                $("#txtPriceNew").css("border", "1px solid #ddd");
                $("#priceError").hide();

                // truyen voucher code len server cho reward nay
                var vouchercode = $("#txtVoucherCode").val();
                if (voucherok == 0) {
                    vouchercode = "no";
                }
                $.post("/cp/do/add-reward.aspx", {
                    userId: userID,
                    price: price,
                    rewardDate: rewardDate,
                    reward: reward,
                    notes: notes,
                    discount: discount,
                    payment: payment,
                    vouchercode: vouchercode,
                    cash: cash,
                    credit: credit,
                    noanailcredit: noanailcredit,
                    giftcard: giftcard

                }, function (data) {
                    if (data == 1) {
                        swal("","Succeeded","success");
                        location.href = "/cp/Reward.aspx"
                    }
                });
            }
        }
        /***** /Add New Reward **********/
    </script>
</asp:Content>

