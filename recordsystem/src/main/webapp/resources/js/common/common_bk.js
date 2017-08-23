//$(".mynavbarbox").height(window.document.body.scrollHeight-62);
OfficeExtension = ["docx", "doc", "xls", "xlsx", "ppt", "pptx"];
PdfExtension = ["pdf"];
ImgExtension = ["png", "jpg", "gif", "bmp", "jpeg"];
VideoExtension = ["flv", "mp4", "mov"];
MusicEXtension = ["mp3", "wav"];

Style_Setting = {
    A4: {
        realWidth: 210,
        realHeigth: 297
    },
    A3: {
        realWidth: 297,
        realHeigth: 410
    }
};
fileLimit = {
    filesize: 100,
    extension: OfficeExtension.concat(PdfExtension).concat(ImgExtension).concat(VideoExtension).concat(MusicEXtension).join("|"),
    fileNum: 5
};
ExportFileNameSuffix = {
    volume: "卷目录",
    piece: "件目录",
    record: "卷内目录"
}
RecordCategory = {
    volume: "_volume",
    piece: "_piece",
    record: "_record"
}
currentFile = "暂未上传文件";
previewFile = {
    filetype: "pdf"
}

$(document).ready(function () {
    function readURL(imgFile) {
        var newPreview = document.getElementById('preview_ie');
        newPreview.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = imgFile.value;
        newPreview.style.width = '160px';
        newPreview.style.height = '120px';
    }

    /*var cWidth =$(document.body).width();
     var cHeight = $(document.body).height();
     var contentWidth = cWidth-187;
     if($(".mynavbarbox").is(":visible")){
     $(".rightbox").width(contentWidth);
     }else{
     $(".rightbox").width(cWidth-$(".mynavbarbox").width());
     }
     var Ccheight = $(".rightbox").height();
     if(Ccheight>(cHeight-64)){
     $("ul.main-menu").css("min-height",(Ccheight+40)+"px");
     }else{
     $("ul.main-menu").css("min-height",(cHeight-68)+"px");
     }*/
    /*DragDrop.bind($('#commonModal2')[0], {
     anchor: $('#commonModal2 .modal-header')[0]
     });*/

    (function () {
        var showVideo = function (filePath) {

            var html = '<div class="video" id="CuPlayer"><strong>温馨提示：您的Flash Player版本过低，请<a href="http://www.CuPlayer.com/">点此进行网页播放器升级</a>！</strong></div>';
            $(".filepreviewarea").append(html);
            var so = new SWFObject('<c:url value="/resources/js/cuplayer/CuPlayerMiniV4.swf"/>', "CuPlayerV4", "600", "410", "9", "#000000");
            so.addParam("allowfullscreen", "true");
            so.addParam("allowscriptaccess", "always");
            so.addParam("wmode", "opaque");
            so.addParam("quality", "high");
            so.addParam("salign", "lt");
            so.addVariable("CuPlayerSetFile", '<c:url value="/resources/js/cuplayer/CuPlayerSetFile.xml"/>'); //播放器配置文件地址,例SetFile.xml、SetFile.asp、SetFile.php、SetFile.aspx
            so.addVariable("CuPlayerFile", filePath); //视频文件地址
            so.addVariable("CuPlayerImage", '<c:url value="/resources/images/website.png"/>');//视频略缩图,本图片文件必须正确
            so.addVariable("CuPlayerWidth", "600"); //视频宽度
            so.addVariable("CuPlayerHeight", "410"); //视频高度
            so.addVariable("CuPlayerAutoPlay", "yes"); //是否自动播放
            so.write("CuPlayer");
        }
    });
    (function ($) {
        $.fn.getBaseName = function () {
            return "/" + document.URL.split("/")[3];
        };

        $.fn.drags = function (opt) {

            opt = $.extend({
                handle: "",
                cursor: "move"
            }, opt);

            var $selected = this;
            var $elements = (opt.handle === "") ? this : this.find(opt.handle);

            $elements.css('cursor', opt.cursor).on("mousedown", function (e) {
                var pos_y = $selected.offset().top - e.pageY,
                    pos_x = $selected.offset().left - e.pageX;
                $(document).on("mousemove", function (e) {
                    $selected.offset({
                        top: e.pageY + pos_y,
                        left: e.pageX + pos_x
                    });
                }).on("mouseup", function () {
                    $(this).off("mousemove"); // Unbind events from document
                });
                e.preventDefault(); // disable selection
            });

            return this;

        };
    })(jQuery);

    $(document).on("click", "#customModal .cancel", function (e) {
        $("#customModal").remove();
    });
    //alert( $("#commonModal2").length);
    // $("#commonModal2").modal("hide").drags({handle: ".modal-header"});
    console.log(root);
    var getUuid = function getUuid() {
        var len = 32;//32长度
        var radix = 16;//16进制
        var chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split('');
        var uuid = [], i;
        radix = radix || chars.length;
        if (len) {
            for (i = 0; i < len; i++)uuid[i] = chars[0 | Math.random() * radix];
        } else {
            var r;
            uuid[8] = uuid[13] = uuid[18] = uuid[23] = '-';
            uuid[14] = '4';
            for (i = 0; i < 36; i++) {
                if (!uuid[i]) {
                    r = 0 | Math.random() * 16;
                    uuid[i] = chars[(i == 19) ? (r & 0x3) | 0x8 : r];
                }
            }
        }
        return uuid.join('');
    }

    $.checkcondition = function () {
        var starttime = $("#starttime").val();
        var startdate = new Date(starttime);
        var endtime = $("#endtime").val();
        var enddate = new Date(endtime);
        if (startdate.getTime() > enddate.getTime()) {
            var result = {datetip: "起始日期必须小于结束日期！请重新选择日期！"};
            $("#dateTipTemplate").tmpl(result).replaceAll($("#commonModal .modal-content"));
            $("#commonModal").modal("show");
            //console.alert("搜索提示：起始日期必须小于结束日期！请重新选择日期！！");
            return false;
        } else {
            return true;
        }
    }

    var checkFile = function (files) {
        if (files.length > 0) {
            for (var i = 0; i < files.length; i++) {
                var file = files[i];
                if (file.size > fileLimit.filesize * 1000000) {
                    return false;
                } else if (fileLimit.extension.indexOf(file.name.substring(file.name.lastIndexOf(".") + 1)) == -1) {
                    return false;
                }
            }
            if ($(".filewell .onefile").length + files.length > fileLimit.fileNum) {
                return false;
            }
        }
        return true;
    }
    var imgindex = 0;
    var imgjson = {};
    var fileindex = 0;
    $.getKeys = function (map) {
        var keys = [];
        for (var prop in map) {
            keys.push(prop);
        }
        return keys;
    }
    $(document).delegate(".btn-file", "change", function (e) {
        //$(".filewell").empty();
        var resfiles = document.getElementsByName("resFile");
        var length = resfiles.length;
        var files = resfiles[length - 1].files;
        if (files) {
            if (checkFile(files)) {
                for (var i = 0; i < files.length; i++) {
                    var result = {};
                    var file = files[i];
                    var imgsrc = "";
                    var name = file.name;
                    var suffix = name.substring(name.lastIndexOf(".") + 1);
                    var imgid = "";
                    previewFile.filetype = suffix;
                    if ($.inArray(suffix, PdfExtension) != -1) {
                        imgsrc = root + 'resources/images/filetype/pdf_64.png';

                    } else if ($.inArray(suffix, ImgExtension) != -1) {
                        imgsrc = root + 'resources/images/filetype/pictures_64.png';
                        $(".filepreviewarea").empty();
                        imgid = "img_" + imgindex;
                        var pre = $("<div class='row center'> <img> </div>");
                        $(".filepreviewarea").append(pre);
                        imgjson[imgid] = file;
                        $('.filepreviewarea img').attr('src', window.URL.createObjectURL(file));
                        imgindex++;
                    } else if ($.inArray(suffix, OfficeExtension) != -1) {
                        imgsrc = root + 'resources/images/filetype/word_64.png';
                    } else if ($.inArray(suffix, VideoExtension) != -1) {
                        imgsrc = root + 'resources/images/filetype/video_64.png';
                    } else if ($.inArray(suffix, MusicEXtension) != -1) {
                        imgsrc = root + 'resources/images/filetype/music_64.png';
                    }
                    var fileClass = "file" + fileindex;
                    result.imgid = imgid;
                    result.imgsrc = imgsrc;
                    result.filename = name;
                    result.fileClass = fileClass;

                    $(".filewell .currentFile").removeClass("currentFile");
                    var onefile = $("#fileTemplate").tmpl(result);
                    onefile.addClass("currentFile");
                    $(".filewell").append(onefile);
                    var currentFileInput = $(this).find("input[type='file']:visible");
                    currentFileInput.addClass(fileClass);
                    currentFileInput.hide();
                    $(this).append($("<input class='form-control addFile' id='resFile' name='resFile' type='file' multiple>"));
                    fileindex++;
                    var showFile = function (imgid, filename) {
                        currentFile = filename;
                        var suffix = filename.substring(filename.lastIndexOf(".") + 1);
                        if ($.inArray(suffix, ImgExtension) != -1) {
                            $(".filepreviewarea").empty();
                            var pre = $("<div class='row center'> <img id='" + imgid + "' > </div>");
                            $(".filepreviewarea").append(pre);
                            file = imgjson[imgid];
                            $('.filepreviewarea img').attr('src', window.URL.createObjectURL(file));
                            return false;
                        }
                        //var prepath = root + 'resources/tempfile/' + temppath + '/pretemp.' + suffix;
                        //var temppath = getUuid();
                        //$("#recordForm #temppath").val(temppath);
                        $("#recordForm #filename").val(filename);
                        $.each($("#recordForm input"), function (i, v) {
                            $(v).addClass("ignore");
                        });
                        $("#recordForm").submit();
                        $.each($("#recordForm input"), function (i, v) {
                            $(v).removeClass ("ignore");
                        });
                    }

                    //showFile(imgid,name);
                    $(".preview").on("click", function (e) {
                        e.preventDefault();
                        $(".filewell .currentFile").removeClass("currentFile");
                        $(this).closest(".onefile").addClass("currentFile");
                        var filename = $(this).parent().parent().find(".filename").text();
                        var imgid = $(this).parent().siblings(".imgid").val();
                        showFile(imgid, filename);
                    });
                    $(".delete").on("click", function (e) {
                        e.preventDefault();
                        var fClass = $(this).siblings("input").val();
                        $("." + fClass).remove();
                        var thisfile = $(this).closest(".onefile");
                        if (thisfile.hasClass("currentFile")) {
                            if (thisfile.next().empty()) {
                                if (document.getElementById('tempiframe') != null) {
                                    document.getElementById('tempiframe').src = "";
                                } else {
                                    $(".filepreviewarea").empty();
                                }
                            } else {
                                var filename = thisfile.next().find(".filename").text();
                                var imgid = thisfile.next().find(".imgid").val();
                                showFile(imgid, filename);
                            }
                        }
                        thisfile.remove();
                    });
                }
            }
        } else {
            $(".filepreviewarea").empty();
            var pre = $("<div class='row center'> <img id='imgPreview' style='max-height: 400px;width: 100%'> </div>");
            $(".filepreviewarea").append(pre);
            document.getElementById("imgPreview").filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = this.value;
        }


        /*var filepath = $(this).find("input[type='file']").val();
         var filename = filepath.substring(filepath.lastIndexOf("\\") + 1);*/
        /*var file = document.getElementById("valuedomain").files[0];
         if (file != null && file.size > 500000) {
         $("#tipTemplate").tmpl().replaceAll($("#view .modal-content"));
         $("#view").modal("show");
         } else if ($('#hospitalApplyForm').valid()) {
         $('#hospitalApplyForm').submit();
         }*/
        /*if (filename != '') {
         if ($(this).parent().find(".btnfilename").length != 0) {
         $(this).parent().find(".btnfilename").text(filename);
         } else {
         $("<p class='btnfilename'>" + filename + "</p>").appendTo($(this).parent());
         }
         }*/
    });
    $(".mynavbarbox").css("min-height", $(window).height() - $(".mynavbar").height() - 2);
    $(".mycontainer").css("min-height", $(window).height() - $(".mynavbar").height() - 2);
    /*$(".mynavbarbox").css("min-height",$(window).height()-$(".mynavbar").height()-2);
     var setHeight = function(){
     if($(".mynavbarbox").height() - 21 < $(".rightbox").height()){
     var dd = window.document.body.scrollHeight-$(".mynavbar").height();
     console.log(dd);
     $(".mynavbarbox").height(dd);
     }
     }
     setHeight();*/
    var setHeight = function () {
        /*if ($(".mynavbarbox").height() - 21 < $(".rightbox").height()) {

         }*/
        var scrollHeight = window.document.documentElement.scrollHeight;
        if (scrollHeight < window.document.body.scrollHeight) {
            scrollHeight = window.document.body.scrollHeight;
        }

        var dd = scrollHeight - $(".mynavbar").height();
        $(".mynavbarbox").height(dd);
    }

    $(document).ajaxStop(function (e) {
        setHeight();
    });
    $(window).on("scroll", function (e) {
        setHeight();
    });
    $(document).ajaxError(function (event, jqXHR, options, errorMsg) {
        console.log(event);
        console.log(jqXHR);
        console.log(options);
        console.log(errorMsg);
        noty({
            text: "暂无权限,可向管理员申请权限!",
            layout: "top",
            type: "failure",
            timeout: 1000,
        });
    });

    /*$(".rightbox").resize(function(e){
     setHeight();
     });*/


    $.ajaxSetup({
        complete: function (xhr) {
            if (xhr.getResponseHeader('E_TIMEOUT') == "1") {
                //redirect to login
                window.location.reload();
            }
        }
    });


    function check(date) {
        time = new Date(Date.parse(date.replace(/-/g, "/"))).getDate();
        return ( time == date.substring(date.length - 2));
    }

    function defaultDate(num) {
        if (num < 10) {
            num = "0" + num;
        }
        return num;
    }


//日期+天
    function reduceDays(d, n) {
        var t = new Date(d);//复制并操作新对象，避免改动原对象
        t.setDate(t.getDate() - n);
        return t.getFullYear() + '-' + defaultDate((t.getMonth() + 1)) + '-' + defaultDate(t.getDate());
    }

//日期+月。日对日，若目标月份不存在该日期，则置为最后一日
    function reduceMonths(d, n) {
        var t = new Date(d);
        t.setMonth(t.getMonth() - n);
        if (t.getDate() != d.getDate()) {
            t.setDate(0);
        }
        return t.getFullYear() + '-' + defaultDate((t.getMonth() + 1)) + '-' + defaultDate(t.getDate());
    }

//日期+年。月对月日对日，若目标年月不存在该日期，则置为最后一日
    function reduceYears(d, n) {
        var t = new Date(d);
        t.setFullYear(t.getFullYear() - n);
        if (t.getDate() != d.getDate()) {
            t.setDate(0);
        }
        return t.getFullYear() + '-' + defaultDate((t.getMonth() + 1)) + '-' + defaultDate(t.getDate());
    }

    //时间格式化
    function getNowFormatDate(date) {
        var seperator1 = "-";
        var seperator2 = ":";
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = year + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
        return currentdate;
    }
});
