<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Giftcard.aspx.cs" Inherits="cp_page_giftcard_Giftcard" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Page header -->
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Gift Card</li>
    </ol>
      <a id="btn-add" data-toggle="modal" data-target="#addGiftCardModal" class="btn btn-success">Add New Gift-Card</a>
    <p></p>
    <!-- /page header -->
    <!-- Content area -->
    <div class="content">
        <!-- Table -->
        <div class="panel panel-flat">
            <div class="panel-heading">
                <input id="txtSearch" style="width: 500px;margin-left:300px; overflow: hidden;" type="text" class="form-control" placeholder="Input phonenumber and press Enter" />

                <h7 class="panel-title" style="width:300px"><span class="icon-medal2""></span> Giftcard (<%=list.Count %>)</h7>
                <div class="heading-elements">
                </div>
            </div>

            <div class="table-responsive" id="tblReward">
                <table class="table">
                    <thead>
                        <tr>
                            <th>GiftCardID</th>
                            <th>GiftCard-Name</th>
                            <th>GiftCardCost</th>
                            <th>GiftCardCode</th>
                            <th>CreateByUserID</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%foreach (var i in list)
                            { %>
                        <tr class="model_<%=i.GiftCardID %>">
                            <td><%=i.GiftCardID %></td>
                            <td><%=i.GiftCardName %></td>
                            <td><%=i.GiftCardCost %></td>
                            <td><%=i.GiftCardCode %></td>
                            <td><%=i.CreateByUserId %></td>
                            <td>
                                 <button class="btn btn-success" onclick="Edit(<%=i.GiftCardID%>)">Edit</button>
                                 <button class="btn btn-danger" onclick="Delete(<%=i.GiftCardID%>)">Delete</button>
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
                    <h4 class="modal-title" id="m-title">Edit GiftCard</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label">UserId   </label>
                        <input class="form-control" id="txtuserid" disabled="disabled" />
                        <input class="form-control" id="txtUserIdAdd" />
                    </div>
                    <div class="form-group" id="txt-giftcarddate">
                            <label class="control-label" id="lblGiftCardDate" >GiftCardID</label>
                            <input class="form-control" id="txtgiftcardid" disabled="disabled" /> 
                        </div>
                    <div class="form-group" >
                        <label class="control-label" >GiftCardName</label>
                        <input class="form-control" id="txtgiftcardname" /> 
                    </div>
                    <div class="form-group" id="txt-giftcardcost">
                        <label class="control-label" >GiftCard-Cost</label>
                        <input class="form-control" id="txtgiftcardcost" />
                    </div>
                    <div class="form-group" id="txt-giftcardgiveittoemail">
                        <label class="control-label" >GiveItToEmail</label>
                        <input class="form-control" id="txtgiveittoemail" />
                    </div>
                    <div class="form-group" id="txt-giftcarddesc">
                        <label class="control-label" >GiftCardDescription</label>
                        <input class="form-control" id="txtgiftcarddesc" />
                    </div>
                    <div class="form-group" id="txt-giftcardnotes">
                        <label class="control-label" >GiftCardNotes</label>
                        <input class="form-control" id="txtgiftcardnotes" />
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
    <div id="addGiftCardModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    
                    <h4 class="modal-title">Add GiftCard</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                            <input class="form-control"  id="txtSearchUser" placeholder="Input phone number to get username..." />
                            <button class="btn btn-search btn-success" onclick="Searchuser()">Search</button>
                    </div> 
                    <div class="form-group">
                        <label><b>User name</b></label>
                        <input class="form-control" id="txtUserNameNew" disabled="disabled" />
                        <input type="hidden" id="txtUserID" />
                    </div>
                    <div class="form-group">
                        <label><b>Gift-Card-Name</b></label>
                        <input class="form-control" id="txtgiftcardnameadd" />
                    </div>
                    <div class="form-group">
                        <label><b>Gift-Card-Cost</b></label>
                        <input class="form-control" id="txtgiftcardcostadd" />
                    </div>
                    <div class="form-group">
                        <label><b>Give-It-To-Email</b></label>
                        <input class="form-control" id="txtgiveittoemailadd" />
                    </div>
                    <div class="form-group">
                        <label><b>GiftCardDescription</b></label>
                        <input class="form-control" id="txtgiftcarddescadd" />
                    </div>                    
                    <div class="form-group">
                        <label><b>GiftCardNotes</b></label>
                        <input class="form-control" id="txtgivftcardnortesadd" />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" onclick="AddGiftCard()">Add</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div id="modalregister" class="modal fade" role="dialog">
        <p>where to login !!</p>
    </div>

    <script>

        function UpdateStatus(SliderID, Status) {
            //alert(SliderID + "-" + Status)
        }
        var RewardID = 0;
        var UserId = "";
        var voucherok = 0;
        function checkvouchercode(vouchercode){
            
            alert("You have choose Voucher with code : "+vouchercode);
            $("#txtVoucherCode").val(vouchercode);

        }
        function checkcash(val){
            var paymethod=parseFloat(val);
            var cash=parseFloat($("#txtcash").val());
            cash=cash-paymethod;
            $("#txtcash").val(cash);
        }
        function checkgiftcard(giftcardcost,id,giftcardcode){

            var flag=true;
            
            var spent=$("#txtPriceNew").val();
            if(spent.trim().length==0){
                swal("Error", "The spent not null!");
                flag=false;
            }
            if(flag==true){
            var giftcardcode=giftcardcode;
            var giftcardcost=giftcardcost;

            var output = "<input class='form-control' id='txtgiftcardused'/><button class='btn btn-primary' onclick='usethisgiftcard(\""+giftcardcode+"\",\""+giftcardcost+"\")' >Use this GiftCard</button>";
            $("#" + id).attr("disabled","true");
            
            $("#usegiftcard").html(output);
            $("#txtgiftcardused").val(giftcardcost);
            }
        }
        function usethisgiftcard(giftcardcode,giftcardcost){
            var giftcardcode=giftcardcode;
            var giftcardcost=giftcardcost;
            
            var totalgiftcard=parseFloat($("#txtgiftcardused").val());
            $.post("/cp/api/usegiftcard.aspx",{giftcardcode:giftcardcode,giftcardcost:totalgiftcard});
            
             var cost=parseFloat(giftcardcost);
            $("#txttxtgiftcardused").val(cost);
             if($("#txtgiftcard").val()==""){
                  swal("", "You have use GiftCard");
                  totalgiftcard=cost;
                  $("#txtgiftcard").val(totalgiftcard);
                  checkcash(cost);
                           
                 }
            else{
                  giftcard=parseFloat($("#txtgiftcard").val());
                   checkcash(cost);
                  totalgiftcard+=giftcard;
                  swal("", "You have use GiftCard");
                  $("#txtgiftcard").val(totalgiftcard);
                            
                            
            
                        }
            

        }
        
        function nocheckvoucher(){
            var flag=true;
            
            var spent=$("#txtPriceNew").val();
            if(spent.trim().length==0){
                swal("Error", "The spent not null!");
                flag=false;
            }
            if(flag==true){
            swal("Correct", "You have use no Voucher!");
            var price = parseFloat($("#txtPriceNew").val());
            var discount= parseFloat($("#txtdiscount").val());
            var notttttt=(price*discount);
            var subprice = price - (price*discount);
            var ttdiscount=(price*discount);
            $("#txtRewardNew").val(subprice);
            

            $("#lblVoucherOk").html("With no use voucher you are discounted $" +0+ "<br/> and membership: "+discount*100+"% $"+notttttt+" ");
            
            $("#txttotaldiscount").val(ttdiscount);
            $("#txtcash").val(subprice);
            $("#txttotalpayment").val(subprice);
            }
        }
        function CheckVoucher(vouchercode)
        {
            var flag=true;
            var spent=$("#txtPriceNew").val();
            if(spent.trim().length==0){
                swal("Error", "The spent not null!");
                flag=false;
            }
            if(flag==true){
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
                        var discount= parseFloat($("#txtdiscount").val());
                        var notttttt=(price*discount);
                        var subprice = price - (price*discount) - parseFloat(data);
                        var ttdiscount=(price*discount) + parseFloat(data);
                        $("#txtRewardNew").val(subprice);
                        

                        $("#lblVoucherOk").html("With this voucher you are discounted $" +data + "<br/> and membership: "+discount*100+"% $"+notttttt+" ");
                        
                        $("#txttotaldiscount").val(ttdiscount);
                        $("#txttotalpayment").val(subprice);


                      
                    }
                });
            }
        }
        }




        function Add() {
            
            var GiftCardDate = $("#txtrewarddate").val();
            var GiftCardName = $("#txtgiftcardname").val();
            var GiftCardCost=$("#txtgiftcardcost").val();
            var GiveItToEmail=$("#txtgiveittoemail").val();
            var GiftCardID=$("#txtgiftcardid").val();
            var UserId = $("#txtuserid").val();
            var GiftCardDescription = $("#txtgiftcarddesc").val();
            var GiftCardNotes = $("#txtgiftcardnotes").val();

            

           
                $.post("/cp/do/giftcard/edit-giftcard.aspx", {

                    GiftCardID: GiftCardID,
                    UserId: UserId,
                    GiftCardName: GiftCardName,
                    GiftCardCost: GiftCardCost,
                    GiveItToEmail: GiveItToEmail,
                    GiftCardDescription: GiftCardDescription,
                    GiftCardNotes: GiftCardNotes

                }, function (data) {
                    if (data == 1) {
                        swal("OK.!");
                        location.reload();
                    }
                    else {
                        swal("Lỗi, thử lại!!")
                    }
                }

                    );

            }
          
 

        function Edit(id) {
            RewardID = id;
            document.getElementById("m-title").innerHTML = "Edit GiftCard";
            $("#txtpass-word").hide();
            $("#txtUserIdAdd").hide();
            $("#txtuserid").show();
            //$("#txtSearchUser").hide();
            $("#txt-rewarddate").show();
            //$("#txtRewardDateAdd").hide();
            $("#rewardnote").show();
            $.getJSON("/cp/do/giftcard/get-json-giftcard.aspx", { id: id }, function (data) {

                $("#txtuserid").val(data.CreateByUserId);

                $.getJSON("/cp/do/giftcard/get-json-user.aspx", { id: data.UserId }, function (userdata) {
                    $("#txtusername").val(userdata.FirstName + userdata.LastName);
                    $("#txtPhone").val(userdata.PhoneNumber);
                    $("#txtEmail").val(userdata.Email);
                })
                $("#txtgiftcardid").val(data.GiftCardID);
                $("#txtgiftcardname").val(data.GiftCardName);
                $("#txtgiftcardcost").val(data.GiftCardCost);
                $("#txtgiveittoemail").val(data.GiveItToEmail);
                $("#txtgiftcarddesc").val(data.GiftCardDescription);
                $("#txtgiftcardnotes").val(data.GiftCardNotes);
                

            })
            $('#txtId').val(id);
            $('#myModal').modal({
                backdrop: 'static',
                keyboard: false
            });
        }
        function Delete(id) {
            var r = confirm("Are you sure to Delete this giftcard ?");
            if (r == true) {
                $.get("/cp/do/giftcard/delete-giftcard.aspx", { id: id, status: -1 }, function (data) {
                    if (data == -1) {
                        $('#model_' + id).remove();
                        location.reload();
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

        document.getElementById('txtSearchUser').onkeydown = (function (event) {
            if (event.keyCode == 13) {
                Searchuser();
            }
        });
        function Searchuser() {
            var text = $("#txtSearchUser").val();
            console.log(text);
            $.getJSON("/cp/api/search-user.aspx", {
                searchStr: text,
            }, function (data) {
                if (data == '0') {
                    var notfounduser = "User Not Exist!"
                    $("#txtUserNameNew").val(notfounduser);
                }
                var userlevel="";
                var userdiscount=0;
                if(data.UserLevel==0){
                    userlevel=" Normal";
                    userdiscount=0;
                }
                else if(data.UserLevel==1){
                    userlevel="Sliver";
                    userdiscount=0.05
                }
                else if(data.UserLevel==2){
                    userlevel="Gold";
                    userdiscount=0.1;

                }
                else if (data.UserLevel==3) {
                    userlevel="Platinum";
                    userdiscount=0.15;
                }
                else {
                    userlevel = "";
                }
                var userName = data.FirstName + " " + data.LastName + " User-Level: " + userlevel;
                console.log(data.FirstName);
                if (data.FirstName.trim() != "" || data.LastName.trim() != "" || userlevel=="") {
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

        document.getElementById('txtSearch').onkeydown = function (event) {
            if (event.keyCode == 13) {
                var phone = $("#txtSearch").val();
                $.post("/cp/api/search-giftcard.aspx", {
                    phone: phone,
                }, function (data) {
                    
                    $("#tblReward").html(data);
                });
            } else {
                $("#tblReward").load(" #tblReward");
            }
        } 
        

        $(document).ready(function () {
            var currentDate = new Date().toUTCString();
            $("#txtRewardDate").val(currentDate);
          
        });

        function AddGiftCard() {
            var error = "";
            var flag = true;
            var userID = $("#txtUserID").val();
            var giftcardname = $("#txtgiftcardnameadd").val();
            var giftcardcost = $("#txtgiftcardcostadd").val();
            var giveittoemail = $("#txtgiveittoemailadd").val();
            var giftcarddesc = $("#txtgiftcarddescadd").val();
            var giftcardnotes = $("#txtgivftcardnortesadd").val();
          

            if (giftcardname.trim().length == 0) {
                error += "Please enter your giftcardname.!";
                flag = false;
            }
            if (giftcardcost.trim().length == 0) {
                error +=  "Please enter your giftcardcost.!";
                flag = false;
            }
            if(giveittoemail.trim().length==0){
                error += "Please enter your email to give it.!";
                flag=false;
            }
            if (userID.trim().length == 0) {
                error += "Please enter userid.!";
                flag = false;
            }
            if (giftcarddesc.trim().length == 0) {
                error += "Please enter giftcard description.!";
                flag = false;
            }
            if (giftcardnotes.trim().length == 0) {
                error += "Please enter giftcard notes.!";
                flag = false;
            }
            if(flag == false)
            {
                alert("Reward error", error);
            }
            else{
            
                $.post("/cp/do/giftcard/add-new-giftcard.aspx", {
                    userID: userID,
                    giftcardname: giftcardname,
                    giftcardcost: giftcardcost,
                    giveittoemail: giveittoemail,
                    giftcarddesc: giftcarddesc,
                    giftcardnotes: giftcardnotes
                    
                }, function (data) {
                    if (data == 1) {
                        swal("Insert Success !")
                        location.reload();
                    }
                    else {
                        swal(data);
                        
                    }
                });
            }
        }
    </script>
</asp:Content>

