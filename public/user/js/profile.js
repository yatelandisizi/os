
Ops.load('data/tdist');
//Ops.load('http://a.tbcdn.cn/p/address/120214/tdist.js');
Ops.load('form');
Ops.load('ajaxfile');
Ops.load('Jcrop');

$(function(){
    var errmsg = '<p class="tips"><span class="ico-error"><i></i>[errmsg]</span></p>';
    var msg = '<p class="tips"><span class="ico-right"><i></i>[msg]</span></p>';
    function showTab(val) {
        $(".u-tab > li").each(function(){
            var id = $(this).attr("val");
            if (id == val) {
                $(this).addClass("current");
                $("#"+id).show();
                return;
            }
            $(this).removeClass("current");
            $("#"+id).hide();
        });
    }

    function getAreaSelect(id) {
        var id = id || "1";
        var select = "";
        for (var area in tdist) {
            if (tdist[area][1] == id) {
                select += '<li val="'+area+'"><a>'+tdist[area][0]+'</a></li>';
            }
        }
        return select;
    }

    function getProvinceSelect() {
        province_select = getAreaSelect("1");
        return province_select;
    }
    
    var province_select="";
    getProvinceSelect();
    
    $(".u-tab > li").click(function(){
        if ($(this).hasClass("current")) {
            return;
        }
        showTab($(this).attr("val")); 
    });

    $(".i-select").each(function(){
        if ($(this).attr("id").indexOf("province_select") != -1) {
            $(this).children("ul").html(province_select);
        }
    });

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

    function selectClick(){
        var $div = $(this).parent().parent();
        var id  = $div.attr("id");
        var val = $(this).attr("val");
        if (id.indexOf("province_select") != -1) {
            var $city = $div.next();
            $city.children("input").val(0);
            $city.children("span").html("请选择");
            $city.children("ul").html(getAreaSelect(val));
            $(".i-select > ul > li").click(selectClick);
        }
        $div.children("span").html($(this).children("a").html());
        $div.children("input").val(val);
    }

    $(".i-select > ul > li").click(selectClick);
    $(".sel-region").each(function(){
        var tid = $.trim($(this).html());
        if (/\d+/.test(tid) && typeof(tdist[tid]) != "undefined")
            $(this).html(tdist[tid][0]);
    });
    
    $("input[name=idcard]").change(function(){
        var idcard = $(this).val();
        if (idcard.length >= 15) {
            var birthdate = idcard.substr(6, 4)+"-"+idcard.substr(10,2)+"-"+idcard.substr(12,2);
            $("input[name=birthdate]").val(birthdate);
        }
    });
    
    function bindRadio(radios) {
        for (var e in radios) {
            $("input[name="+radios[e]+"]").click(function(){
                var val = $(this).val();
                var radio2 = $(this).attr("bind");
                if (val == 2) {
                    $("input[name="+radio2+"]").each(function(){
                        if ($(this).val() == 2)
                            $(this).attr("checked", true);
                        $(this).attr("disabled", true);
                    });
                } else if(val == 1) {
                    $("input[name="+radio2+"]").each(function(){
                        $(this).attr("disabled", false);
                    });
                }
            });
        }
    }
    
    bindRadio(["have_house","have_car"]);
     

    var avatar_preview_old = $(".avatar-preview").html();
    
    function uploadAvatar(fid, pw, ph) {
        if ($("#"+fid).val() == "") {
            return;
        }
        var pw = pw || $(".avatar-preview").width();
        var ph = ph || $(".avatar-preview").height();

        var width,height,coords;
        function updatePreview(c) {
            if (parseInt(c.w) < 1)
                return;
            var x = pw / c.w;
            var y = ph / c.h;
            if (x * width == 0)
                return;
            coords = c.x+","+c.y+","+c.w+","+c.h;
            $("#avatar_preview").css({
                width: Math.round(x * width) + "px",
                height: Math.round(y * height) + "px",
                marginLeft: "-" + Math.round(x * c.x) + "px",
                marginTop: "-" + Math.round(y * c.y) + "px"
            });
        }
        
        $("#avatar_cut_apply").click(function(){
            coords += ","+width+","+height;
            $(".pop-wrap").hide();
            $("#"+fid).remove();
            $("#info_avatar").val($("#avatar_preview").attr("src")+":"+coords);
        });
        
        $("#avatar_cut_cancel").click(function(){
            $(".pop-wrap").hide();
            $(".i-up").show();
            $(".avatar-preview").html(avatar_preview_old);
            reloadAvatarFile();
        });
 
        $("#avatar_file_close").click(function(){
            $(".pop-wrap").hide();
            $(".i-up").show();
            reloadAvatarFile();
        });

        $(".i-up").hide();
        $(".pop-wrap").show();
        $(".pop-loading").show();
        $("#profile_info_msg").hide();

        $.ajaxFileUpload({
            global: true,
            url: "/upload/avatar",
            fileElementId: fid,
            dataType: "json",
            success: function(res, status) {
                $(".pop-loading").hide();
                if (res["return"] > 0 && res["saveurl"] != "") {
                    $(".pop-upload").show();
                    width=parseInt($("#avatar_cut_area").css("width").replace("px", ""));
                    if (width > res["width"])
                        width = res["width"];
                    height=parseInt($("#avatar_cut_area").css("height").replace("px", ""));
                    if (height > res["height"])
                        height = res["height"];
                    $("#avatar_cut_area").css({
                        width: width+"px",
                        height: height+"px"
                    });
                    $("#avatar_cut_area").html("<img width='"+width+"px' height='"+height+"px' id='avatar_target' src='"+res["saveurl"]+"' />");
                    $(".avatar-preview").html("<img id='avatar_preview' src='"+res["saveurl"]+"' />");
                    $("#avatar_target").Jcrop({
                        onChange: updatePreview,
                        onSelect: updatePreview,
                        setSelect: [0,0, 250,250],
                        aspectRatio: 1
                    }, function(){
                    });
                } else {
                    $(".pop-wrap").hide();
                    $(".i-up").show();
                    reloadAvatarFile();
                    $("#profile_info_msg").html(errmsg.replace("[errmsg]", res["errmsg"])).show();
                }
            },
            error: function(xhr, status, e) {
                    $(".pop-wrap").hide();
                    $(".i-up").show();
                    reloadAvatarFile();
                    $("#profile_info_msg").html(errmsg.replace("[errmsg]", e)).show();
            }
        });
        return false;
    }
    
    function reloadAvatarFile(){
        $("#info_avatar_file").change(function(){
            uploadAvatar("info_avatar_file");
        });
    }
    
    reloadAvatarFile();

    $.ajaxSetup({dataType:"json",global:false});
    
    var avatar_file_box = $("#avatar_file_box").html();
    $("#profile_info_submit").click(function(){
        if ($("#info_idcard").length > 0 && !confirm("请再次确认您所填写的信息是否正确，如果不正确请点\"取消\"并修改")) return false;
        $("#profile_info_form").ajaxSubmit({
            dataType: "json",
            success: function(res) {
                    if (res["return"] > 0) {
                        $("#profile_info_msg").hide();
                        showTab("profile_job_form");
                    } else {
                        $(".i-up").show();
                        $("#avatar_file_box").html(avatar_file_box);
                        reloadAvatarFile();
                        $("#profile_info_msg").html(errmsg.replace("[errmsg]", res["errmsg"])).show();
                    }
            },
            error: function(xhr, status, e) {
                if (e != "") alert(e); 
            }
        });
        return false;
    });
    
    $("#profile_job_submit").click(function(){
        if ($("#job_company").length > 0 && !confirm("请再次确认您所填写的信息是否正确，如果不正确请点\"取消\"并修改")) return false;
        $("#profile_job_form").ajaxSubmit({
            dataType: "json",
            success: function(res) {
                if (res["return"] > 0) {
                    $("#profile_job_msg").hide();
                    showTab("profile_contact_form");
                } else {
                    $("#profile_job_msg").html(errmsg.replace("[errmsg]", res["errmsg"])).show();
                }
            },

            error: function(xhr, status, e) {
                if (e != "") alert(e); 
            }
        });
        return false;
    });
    
    $("#profile_contact_submit").click(function(){
        if ($("#contact_family_name").length > 0 && !confirm("请再次确认您所填写的信息是否正确，如果不正确请点\"取消\"并修改")) return false;
        $("#profile_contact_form").ajaxSubmit({
            dataType: "json",
            success: function(res) {
                if (res["return"] > 0) {
                    $("#profile_contact_msg").html(msg.replace("[msg]", res["msg"])).show();
                } else {
                    $("#profile_contact_msg").html(errmsg.replace("[errmsg]", res["errmsg"])).show();
                }
            },
            error: function(xhr, status, e) {
                if (e != "") alert(e); 
            }
        });
        return false;
    });

});

