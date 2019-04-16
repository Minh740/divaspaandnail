<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="cp_page_contact_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item"><a href="Contact.aspx">Contact</a></li>
        <li class="breadcrumb-item active">Add New Contact</li>
    </ol>
    <form>
        <div class="form-group">
            <div class="form-row">
                <div class="col-md-6">
                    <div class="form-label-group">
                        <input type="text" id="txtName" class="form-control" placeholder="Name" required="required" autofocus="autofocus" />
                        <label for="txtName">Name</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-label-group">
                        <input type="text" id="txtPhone" class="form-control" placeholder="Phone" required="required" autofocus="autofocus" />
                        <label for="txtPhone">Phone</label>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-row">
                <div class="col-md-6">
                    <div class="form-label-group">
                        <input type="text" id="txtEmail" class="form-control" placeholder="Email" required="required" autofocus="autofocus" />
                        <label for="txtEmail">Email</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-label-group">
                        <input type="text" id="txtIp" class="form-control" placeholder="Ip" required="required" autofocus="autofocus" />
                        <label for="txtIp">Ip</label>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-row">
                <div class="col-md-12">
                    <label for="txtContent">BodyContent</label>
                    <div class="form-label-group">
                        <textarea class="form-control tinymce" id="txtContent"></textarea>
    </div>
                        
                    </div>
                </div>
            </div>
      

        <button class="btn btn-primary btn-block" onclick="addcontact(this)">Add New Contact</button>
    </form>
    <script>
        function addcontact(input) {
            $(input).prop("disabled", true);
            var name = $("#txtName").val();
            var phone = $("#txtPhone").val();
            var email = $("#txtEmail").val();
            var ip = $("#txtIp").val();
            var bodycontent = tinymce.get("txtContent").getContent();
            var createday = $("#txtCreateDay").val();
            $.post("/cp/do/contact/add.aspx", {
                name: name,
                phone: phone,
                email: email,
                ip: ip,
                bodycontent: bodycontent,
                createday: createday,
            }, function (data) {
                if (data != 1) {
                    alertify.alert("Error", data);
                }
                else {
                    alertify.alert("Succses");
                    location.href = "/cp/page/contact/Contact.aspx";

                }
            }
            );


        }
    </script>
</asp:Content>


