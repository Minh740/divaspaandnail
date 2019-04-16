$(document).ready(function () {
    var $window = $(window);
    var windowsize = $window.width();
    var Interval;
    Bannerauto();
    var totalSlider = $("#total-slider").text();

    function Bannerauto() {
        Interval = setInterval(function () {
            try {

                if ($("#bnext").is(":hover") == false && $("#bback").is(":hover") == false && $(".groupbanner").is(":hover") == false) {
                    BannerNext(totalSlider);
                }

            } catch (e) {

            }
        }, 8000);
    }

    $("#bnext").click(function () {
        BannerNext(totalSlider);
        clearTimeout(Interval);
        Bannerauto();
    });

    $("#bback").click(function (e) {
        BannerBack(totalSlider);
        clearTimeout(Interval);
        Bannerauto();
    });


    //    var clicks = 0, timer = null;
    //    $("#bnext").bind("click", function (e) {
    //        clicks++;
    //        if (clicks === 1) {
    //            timer = setTimeout(function () {
    //                BannerNext(4);
    //                clicks = 0;
    //            }, 250);

    //        } else {
    //            clearTimeout(timer);
    //            clicks = 0;
    //        }
    //    })
    //    .on("dblclick", function (e) {
    //        e.preventDefault();
    //    });


    //Scroll Top
    $('#linktop').click(function () {
        $("body").animate({
            scrollTop: 0
        }, '500');
    });

    //Notification
    $("#closenoti").click(function () {
        $("#groupnoti").css("display", "none");
    });
    //End Notification

    //top an va hien
    $(window).scroll(showDiv);

    function showDiv() {
        if ($(window).scrollTop() > 300) {
            $('#linktop').fadeIn('slow');
        } else {
            $('#linktop').fadeOut('slow');
        }
    }
    //top an va hien


    //List menu services
    var timer;
    $("#menu2").mouseenter(function () {
        clearTimeout(timer);
        $("#menu2 ul").css("display", "block");
        $("#menu2 ul").stop(true, true).animate({
            height: "320px"
        }, 400);
    });

    $("#menu2").mouseleave(function () {
        timer = setTimeout(function () {
            $("#menu2 ul").stop(true, true).animate({
                marginTop: "-10px"
            }, 200, function () {
                $("#menu2 ul").fadeOut(400, function () {
                    $("#menu2 ul").css("margin-top", "0px");
                    $("#menu2 ul").stop(true, true).animate({
                        height: "0px"
                    }, 400);
                });
            });
        }, 300);
    });

    //    $("#menu2 ul").mouseenter(function () {
    //    clearTimeout(timer);
    //    });

    //    $("#menu2 ul").mouseleave(function () {
    //    timer = setTimeout(function () {
    //    $("#menu2 ul").stop(true, true).animate({ marginTop: "-10px" }, 200, function () {
    //    $("#menu2 ul").fadeOut(400, function () {
    //    $("#menu2 ul").css("margin-top", "0px");
    //    $("#menu2 ul").stop(true, true).animate({ height: "0px" }, 400);
    //    });
    //    });
    //    }, 300);
    //    });
    //End list menu services

    function BannerNext(count) {
        var iNext;
        iNext = $("#flag").html();
        $("#banner" + iNext.toString()).stop(true, true).fadeOut(800);
        $(".bannertxt").stop(true, true).fadeOut(200);
        if (iNext == count) {
            iNext = "1";
        } else {
            iNext = (parseInt(iNext) + 1).toString();
        }
        $("#banner" + iNext.toString()).stop(true, true).fadeIn(600, function () {
            $(".bannertxt").stop(true, true).fadeIn(600);
        });
        $("#flag").html(iNext.toString());
    }

    function BannerBack(count) {
        var iBack;
        iBack = $("#flag").html();
        $("#banner" + iBack.toString()).stop(true, true).fadeOut(800);
        $(".bannertxt").stop(true, true).fadeOut(200);
        if (iBack == "1") {
            iBack = count;
        } else {
            iBack = (parseInt(iBack) - 1).toString();
        }
        $("#banner" + iBack.toString()).stop(true, true).fadeIn(600, function () {
            $(".bannertxt").stop(true, true).fadeIn(600);
        });
        $("#flag").html(iBack.toString());
    }



    //chay menutrong mobile    

    var playmenu = "1";
    $(".menuimg").click(function () {
        if (playmenu == "1") {
            Menu_mlick1();
        } else {
            Menu_mlick2();
        }
    });

    function Menu_mlick1() {
        $(".menu_m").stop(true, true).animate({
            height: "410px"
        }, 400);
        playmenu = "0";
    }

    function Menu_mlick2() {
        $(".menu_m").stop(true, true).animate({
            height: "40px"
        }, 400);
        playmenu = "1";
    }


    ////opt bar
    //$("#otpsubmit").click(function () {
    //    $("#otpsubmit").fadeOut(50);
    //    var sNotify = "";
    //    if ($("#firstname").val() == "") {
    //        sNotify += "* Please input the first name<br/>";
    //    }
    //    if ($("#lastname").val() == "") {
    //        sNotify += "* Please input the last name<br/>";
    //    }
    //    if ($("#email").val() == "") {
    //        sNotify += "* Please input the Email<br/>";
    //    }
    //    else {
    //        if (!checkEmail($("#email").val())) {
    //            sNotify += "*Invalid Email<br/>";
    //        }
    //    }

    //    if (sNotify != "") {
    //        $("#optnotifycontent").html(sNotify);
    //        $("#optnotify").fadeIn(50);
    //        $("#otpsubmit").fadeIn(50);
    //    }
    //    else {
    //        var sFirstName = $("#firstname").val();
    //        var sLastName = $("#lastname").val();
    //        var sEmail = $("#email").val();
    //        $.ajax(
    //            {
    //                type: "POST",
    //                url: "process.aspx/optemail",
    //                data: "{'sFirstName':'" + sFirstName + "','sLastName':'" + sLastName + "','sEmail':'" + sEmail + "'}",
    //                contentType: "application/json; charset=utf-8",
    //                dataType: "json",
    //                async: "true",
    //                cache: "false",

    //                success: function (msg) {
    //                    if (msg.d == "0") {
    //                        $("#optnotifycontent").html("Your infomation has been submitted. Thank you!");
    //                        $("#optnotify").fadeIn(50);
    //                        $("#firstname").val("");
    //                        $("#lastname").val("");
    //                        $("#email").val("");
    //                    }
    //                    else {
    //                        $("#optnotifycontent").html("This email has been added. Please enter another email!");
    //                        $("#optnotify").fadeIn(50);
    //                        $("#email").val("");
    //                    }
    //                    $("#otpsubmit").fadeIn(50);
    //                },

    //                Error: function (x, e) {
    //                    $("#optnotifycontent").html("Some Error! Please try again later");
    //                    $("#optnotify").fadeIn(50);
    //                }
    //            });

    //    }

    //});

    $("#notifyok").click(function () {
        $("#optnotifycontent").html("");
        $("#optnotify").fadeOut(50);
    });

    function checkEmail(email) {
        var filter = /^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/;
        if (!filter.test(email)) {
            return false;
        } else {
            return true;
        }
    }

    //opt bar

    //Contact Form
    $("#bSend").click(function () {
        $("#bSend").fadeOut(50);
        $("#formwait").fadeIn(20);

        //Check form
        var sNotify = "";

        //Name
        if ($("#txtName").val() == "") {
            sNotify += "* Please input the first name<br/>";
        }

        //Email
        if ($("#txtEmail").val() == "") {
            sNotify += "* Please input the Email<br/>";
        } else {
            if (!checkEmail($("#txtEmail").val())) {
                sNotify += "*Invalid Email<br/>";
            }
        }

        //Phone
        if ($("#txtPhone").val() == "") {
            sNotify += "* Please input your phone number<br/>";
        } else {
            if (!checkPhone($("#txtPhone").val())) {
                sNotify += "*Invalid Phone Number<br/>";
            }
        }

        //Content
        //Name
        if ($("#txtContent").val() == "") {
            sNotify += "* Please input the message<br/>";
        }

        if (sNotify != "") {
            $("#formnotifycontent").html(sNotify);
            $("#formnotify").fadeIn(50);
            $("#bSend").fadeIn(50);
            $("#formwait").fadeOut(20);
        } else {
            var sName = $("#txtName").val();
            var sEmail = $("#txtEmail").val();
            var sPhone = $("#txtPhone").val();
            var sContent = $("#txtContent").val();


            $.ajax({
                url: "/api/contact.ashx",
                method: "post",
                data: {
                    name: sName,
                    email: sEmail,
                    phone: sPhone,
                    content: sContent,
                },
                success: function (data) {
                    console.log(data);
                    data = JSON.parse(data);
                    $("#formwait").fadeOut(20);
                    $("#formsubmit").fadeIn(50);

                    if (data.success == -1) {
                        $("#formnotifycontent").html("Some Error! Please try again later" + data);
                        $("#formnotify").fadeIn(50);
                    } else {
                        $("#formnotifycontent").html("Your message has been sent. Thank you!");
                        $("#formnotify").fadeIn(50);
                        $("#txtName").val("");
                        $("#txtEmail").val("");
                        $("#txtPhone").val("");
                        $("#txtContent").val("");
                    }
                },
                error: function (error) {
                    console.log(error);
                    $("#formwait").fadeOut(20);
                    $("#formsubmit").fadeIn(50);
                    $("#formnotifycontent").html("Some Error! Please try again later" + data);
                    $("#formnotify").fadeIn(50);
                }
            });
        }
    });

    $("#formnotifyok").click(function () {
        $("#formnotifycontent").html("");
        $("#formnotify").fadeOut(50);
    });

    function checkEmail(email) {
        var filter = /^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/;
        if (!filter.test(email)) {
            return false;
        } else {
            return true;
        }
    }

    function checkPhone(email) {
        var filter = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/;
        if (!filter.test(email)) {
            return false;
        } else {
            return true;
        }
    }
    //Contact Form

});

function myNavFunc() {
    // If it's an iPhone..
    // If it's an iPhone..
    var iOS = /iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream;
    if (iOS) {
        window.open("http://maps.apple.com/?q=7038780886");
    } else {
        window.open("http://maps.google.com/?q=+World+Nails+Day+Spa+4151+Cheshire+Station+Dale+City+VA+22193");
    }
}