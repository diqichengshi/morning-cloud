/**
 * 图片相关处理js
 *
 * @author auto generator
 * @version v1.0.1, 2018/09/20 23:33:23
 */
layui.define([], function (exports) {
    var $ = layui.$

    window.showBigImg=function (imgPath){
        var path=imgPath;
        if(imgPath.indexOf("base64,") == -1){
            path='/file/fileDownload?fileId='+imgPath;
        }
        var img = "<img src='" + path + "'  />";
        var setting = {
            type: 1,
            title: false,
            closeBtn: 0,
            skin: 'bigImgSkin',
            shadeClose: true,
            shade: 0.5, //遮罩透明度
            content: img
        }

        getImageWidth(path,function(w,h){
            setting.area = [w+"px",h+"px"];
            // 设置layer
            parent.layer.open(setting);
        });
    }

    function getImageWidth(url,callback){
        var img = new Image();
        img.src = url;
        // 如果图片被缓存，则直接返回缓存数据
        if(img.complete){
            callback(img.width, img.height);
        }else{
            // 完全加载完毕的事件
            img.onload = function(){
                callback(img.width, img.height);
            }
        }
    }

    window.showBigImg1=function (imgPath){
        if(imgPath.indexOf('fileId=') != -1){
            imgPath='/file/fileDownload?fileId='+imgPath.split('fileId=')[1];
        }
        var img = "<img src='" + imgPath + "'  />";
        var setting = {
            type: 1,
            title: false,
            closeBtn: 0,
            skin: 'bigImgSkin',
            shadeClose: true,
            shade: 0.5, //遮罩透明度
            content: img
        }

        getImageWidth(imgPath,function(w,h){
            setting.area = [w+"px",h+"px"];
            // 设置layer
            parent.layer.open(setting);
        });
    }
    window.showVideo=function (videoPath){
        var path=videoPath;
        if(videoPath.indexOf("base64,") == -1){
            path='/file/fileDownload?fileId='+videoPath;
        }
        var img = "<video src='" + path + "'  />";
        var setting = {
            type: 1,
            title: false,
            closeBtn: 0,
            skin: 'bigImgSkin',
            shadeClose: true,
            shade: 0.5, //遮罩透明度
            content: img
        }

        getImageWidth(path,function(w,h){
            setting.area = [w+"px",h+"px"];
            // 设置layer
            parent.layer.open(setting);
        });
    }
    

    exports('showImg', {})
});