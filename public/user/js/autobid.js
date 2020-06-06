
$(function(){
    var errmsg = '<p class="tips"><span class="ico-error"><i></i>[errmsg]</span></p>';
    var msg = '<p class="tips"><span class="ico-right"><i></i>[msg]</span></p>';

    $(".i-select").click(function(){
        var name = $(this).children("input").attr("name");
        $(".i-select").each(function(){
            if ($(this).children("input").attr("name") != name 
                && $(this).children("ul").css("display") != "none") {
                $(this).children("ul").hide();
            }
            $(this).css("zIndex", 0);
            $(this).parent().css("zIndex", 0);
        });

        $(this).parent().parent().children(".i-item").each(function(){
            if ($(this).children("input").length > 0) {
                $(this).css("zIndex", 0);
            }
        });

        $(this).css("zIndex", 99);
        $(this).parent().css("zIndex", 99);
        $(this).children("ul").toggle();
    });

    $(".i-select ul li").click(function(){
        var $input = $(this).parent().parent().children("input");
        var $span = $(this).parent().parent().children("span"); 
        $span.html($(this).html());
        $input.val($(this).attr("val"));
    });
    

    $("button").click(function(){
        var msgId = "#autobid_msg";
        var todo = $(this).attr("do");
        if (todo == "close") {
            if (!confirm("关闭后再开启将重新排名，你确定要关闭自动投标？"))
                return false;
        }
        $("input[name=do]").val(todo);

        var post = $("#autobid_form").serialize();
        var url = $("#autobid_form").attr("action");

        $(msgId).hide();
        $.ajax({
            type: "POST",
            url: url,
            data: post,
            dataType: "json",
            success: function(res) {
                if (res["return"] > 0) {
                    $(msgId).html(msg.replace("[msg]", res["msg"])).show("fast").fadeOut(2000);
                    if (todo == "enable") {
                        $("#autobid_status_show").html('<span style="color:green;">已开启</span>');
                        if (res["rank"] != undefined && res["rank"]["no"] != undefined) {
                            $("#autobid_rank").show();
                            var rankStr = res["rank"]["no"];
                            $("#autobid_rank_show").html(rankStr);
                            $("#autobid_amount_show").html(res["amount"]);
                        }
                    } else if (todo == "close") {
                        $("#autobid_rank").hide();
                        $("#autobid_status_show").html('<span style="color:red;">已关闭</span>');
                    }
                } else {
                    $(msgId).html(errmsg.replace("[errmsg]", res["errmsg"])).show("fast").fadeOut(5000);
                }
            },
            error: function(xhr, status, e) {
                if (e != "") alert(e);
            }
        });

    });
	
	
	Ops.spreadbtn('spreadbtn');
	
});
