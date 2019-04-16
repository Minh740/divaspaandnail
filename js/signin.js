$(document).ready(function () {

    $("#bSubmit").click(function () {
        fSignIn();
    });
    $("#formnotifyoksignup").click(function () {
        $("#formnotifycontentsignup").html("");
        $("#formnotifysignup").fadeOut(50);
    });


    function fSignIn() {
        fShow_img_loader();
        $("#bSubmit").fadeOut(10);
        $("#waitdiv").fadeIn(10);
        var sErr = "";

        var sFirstName = $("#txtFirstName").val();
        var sLastName = $("#txtLastName").val();
        var sEmail = $("#txtEmail").val();
        var sPhone = $("#txtPhone").val();
        var sBirthDate = $("#datepicker").val();

        if (sFirstName == "") {
            sErr += "+ Please enter your First Name";
        }

        if (sLastName == "") {
            if (sErr != "") {
                sErr += "<br>";
            }
            sErr += "+ Please enter your Last Name";
        }

        if (sPhone == "") {
            if (sErr != "") {
                sErr += "<br>";
            }
            sErr += "+ Please enter your Phone";
        }

        if (sEmail == "") {
            if (sErr != "") {
                sErr += "<br>";
            }
            sErr += "+ Please enter your Email";
        }
        else {
            if (!validateEmail(sEmail)) {
                if (sErr != "") {
                    sErr += "<br>";
                }
                sErr += "+ Invalid Email"
            }
        }

        if (sBirthDate == "") {
            sErr += "<br>";
            sErr += "+ Please enter your BirthDate";
        }
        else {
            if (validateDate(sBirthDate) == 1) {
                if (sErr != "") {
                    sErr += "<br>";
                }
                sErr += "+ Invalid Birthdate"
            }
        }

        if (sErr != "") {
            fHide_img_loader();
            $("#bSubmit").fadeIn(10);
            $("#formnotifycontentsignup").html(sErr);
            $("#formnotifysignup").fadeIn(10);
        }
        else {
            $.ajax({
                url: "/api/register.ashx",
                method: "POST",
                data: {
                    sFirstName: sFirstName,
                    sLastName: sLastName,
                    sEmail: sEmail,
                    sPhone: sPhone,
                    sBirthDate: sBirthDate
                },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.success == -1) {
                        console.log(data.error);
                        $("#formnotifycontentsignup").html("Some Error! Please try again later");
                        $("#formnotifysignup").fadeIn(50);

                    } else if (data.success == 0) {
                        $("#formnotifycontentsignup").html("This email or phone number has already been used. Please try again.");
                        $("#formnotifysignup").fadeIn(50);
                        $("#bSubmit").fadeIn(10);
                    } else {
                        $("#formnotifycontentsignup").html("Your information has been submitted. You will receive this deal soon. Thank You!");
                        $("#formnotifysignup").fadeIn(50);
                        $("#bSubmit").fadeIn(10);
                        fClear();
                    }
                    fHide_img_loader();
                },
                error: function (error) {
                    fHide_img_loader();
                    console.log(error);
                    $("#formnotifycontentsignup").html("Some Error! Please try again later");
                    $("#formnotifysignup").fadeIn(50);
                }
            });
        }
    }

    //Ham check Email
    function validateEmail(email) {
        var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
    }

    //Ham check Date
    function validateDate(date) {
        var iErr = 0;
        var cDate = date.split("-");
        if (parseInt(cDate[0]) > 12 || parseInt(cDate[1]) > 31) {
            iErr = 1;
        }
        return iErr;
    }

    function fClear() {
        $("#txtFirstName").val("");
        $("#txtLastName").val("");
        $("#txtEmail").val("");
        $("#txtPhone").val("");
        $("#txtFirstName").val("");
        $("#datepicker").val("");
    }


    //Hàm loader img
    function fShow_img_loader() {
        $("#loadspinner").fadeIn("slow");
    }
    function fHide_img_loader() {
        $("#loadspinner").fadeOut("slow");
    }
});