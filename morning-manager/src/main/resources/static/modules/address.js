layui.define(["form", "jquery"], function (exports) {
    var form = layui.form,
        $ = layui.jquery,
        Address = function () {
        };

    Address.prototype.provinces = function () {
        //加载省数据
        var proHtml = '', that = this;
        $.get("/city/area", {cityCode: '', type: 1}, function (pro) {

            for (var i = 0; i < pro.length; i++) {
                var provinceCode = $("#provinceCode").val(); // provinceCode不为空,需要进行反显,并查询下级市信息
                if (pro[i].cityCode == provinceCode) {
                    proHtml += '<option selected="selected" value="' + pro[i].cityCode + '">' + pro[i].cityName + '</option>';
                    // 查询要反显的市信息
                    $.post('/city/area', {cityCode: provinceCode, type: 2}, function (val) {
                        //console.log(val.length) ;
                        that.citys(val);
                    }, "json");
                }else {
                    proHtml += '<option value="' + pro[i].cityCode + '">' + pro[i].cityName + '</option>';
                }
            }
            //初始化省数据
            $("select[name=province]").append(proHtml);
            form.render();
            form.on('select(province)', function (proData) {

                $("select[name=area]").html('<option value="">请选择县/区</option>');
                var value = proData.value;

                if (value > 0) {
                    $.post('/city/area', {cityCode: value, type: 2}, function (val) {
                        //console.log(val.length) ;
                        that.citys(val);
                    }, "json");
                    //that.citys(pro[$(this).index() - 1].childs);

                } else {
                    $("select[name=city]").attr("disabled", "disabled");
                }
            });
        }, 'json');
    }

    //加载市数据
    Address.prototype.citys = function (citys) {

        var cityHtml = '<option value="">请选择市</option>', that = this;
        for (var i = 0; i < citys.length; i++) {
            var cityCode = $("#cityCode").val(); // cityCode不为空,需要进行返显,并查询下级区县信息
            if (citys[i].cityCode == cityCode) {
                cityHtml += '<option selected="selected" value="' + citys[i].cityCode + '">' + citys[i].cityName + '</option>';
                // 查询要反显的区信息
                $.post('/city/area', {cityCode: cityCode, type: 3}, function (area) {
                    that.areas(area);
                }, "json");
            }else {
                cityHtml += '<option value="' + citys[i].cityCode + '">' + citys[i].cityName + '</option>';
            }
        }
        $("select[name=city]").html(cityHtml).removeAttr("disabled");
        form.render();
        form.on('select(city)', function (cityData) {
            var value = cityData.value;
            if (value > 0) {
                $.post('/city/area', {cityCode: value, type: 3}, function (area) {
                    that.areas(area);
                }, "json");
                //that.areas(citys[$(this).index() - 1].childs);
            } else {
                $("select[name=area]").attr("disabled", "disabled");
            }
        });
    }

    //加载县/区数据
    Address.prototype.areas = function (areas) {
        var areaHtml = '<option value="">请选择县/区</option>';
        for (var i = 0; i < areas.length; i++) {
            var countyCode=$("#countyCode").val(); // countyCode不为空,需要进行返显
            if (areas[i].cityCode == countyCode) {
                areaHtml += '<option selected="selected" value="' + areas[i].cityCode + '">' + areas[i].cityName + '</option>';
            }else {
                areaHtml += '<option value="' + areas[i].cityCode + '">' + areas[i].cityName + '</option>';
            }
        }
        $("select[name=area]").html(areaHtml).removeAttr("disabled");
        form.render();
    }

    var address = new Address();
    exports("address", function () {
        address.provinces();
    });
});
