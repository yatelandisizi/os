
Ops.load("jquery.template.min.js");
Ops.load("datepicker");

$(function(){

    $(".i-select").click(function(){
        var name = $(this).children("input").attr("name");
        $(".i-select").each(function(){
            if ($(this).children("input").attr("name") != name 
                && $(this).children("ul").css("display") != "none") {
                $(this).children("ul").hide();
            }
            $(this).css("zIndex", 0);
        });
        $(this).css("zIndex", 99);
        $(this).children("ul").toggle();
    });
    
    $(".i-select ul li").click(function(){
        var $input = $(this).parent().parent().children("input");
        var $span = $(this).parent().parent().children("span"); 
        $span.html($(this).html());
        $input.val($(this).attr("val"));
    });
    
    $("#do_search").click(function(){
        $(".i-select ul").hide();
        loadList();
    });
    $(".i-date").datePicker({offset:{top:8,left:0}});

    var sortField = "";
    var condition = {};

    function pageLink() {
        $(".page-wrap a").click(function(){
            loadList("?"+$(this).attr("href").match("[^?]+$"));
            return false;
        });
    }

//    function loadList(search, post) {

//        $("#main_list").html('<div class="ajax-loader1"></div>');

//        var post = post || "";
//        var search = search || "?p=1";
//        
//        if (post == "") {
//            condition["type"] = $("#search_type").children("input").val();
//            condition["sdate"] = $("#search_sdate").val();
//            condition["edate"] = $("#search_edate").val();
//            
//            for (var key in condition) {
//                if (condition[key] && condition[key] != ""){
//                    post += "&"+key+"="+encodeURIComponent(condition[key]);
//                }
//            }
//        }

//        if (sortField != "") {
//            if (sortField.slice(-1) == ",")
//                sortField = sortField.substr(0, sortField.length-1);
//            post += "&sort="+sortField;
//        }

//        if (post.substr(0,1) == "&")
//            post = post.substring(1);
//        if (post.slice(-1) == "&")
//            post = post.substr(0, post.length-1);

//        $.ajax({
//            type: "POST",
//            url: "/user/funds/record"+search,
//            data: post,
//            dataType: "json",
//            success: function(res) {
//                if (res["return"] && res["return"] > 0) {
//                    var html;
//                    html = $.template("main-list", res["data"]);
//                    $("#main_list").html(html);
//                    html = $.template("page-list", res["data"]);
//                    $(".page-wrap").html(html);
//                    pageLink();
//                } else {
//                    alert(res["errmsg"]);if(res["errmsg"].indexOf("未登录") != -1) window.location.reload();
//                }
//            },
//            error: function(xhr, status, e) {
//                if (e != "") alert(e); 
//            }
//        });
//    }

    loadList();
});

