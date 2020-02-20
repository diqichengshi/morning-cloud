layui.define(["form", "jquery"], function (exports) {
    var form = layui.form,
        $ = layui.jquery,
        BankAddress = function () {
        };

    BankAddress.prototype.provinces = function () {
        //加载省数据
        var proHtml = '', that = this;
        $.get("/city/area", {cityCode: '', type: 1}, function (pro) {

            for (var i = 0; i < pro.length; i++) {
                var bankProvinceCode = $("#bankProvinceCode").val(); // provinceCode不为空,需要进行反显,并查询下级市信息
                if (pro[i].cityCode == bankProvinceCode) {
                    proHtml += '<option selected="selected" value="' + pro[i].cityCode + '">' + pro[i].cityName + '</option>';
                    // 查询要反显的市信息
                    $.post('/city/area', {cityCode: bankProvinceCode, type: 2}, function (val) {
                        //console.log(val.length) ;
                        that.citys(val);
                    }, "json");
                }else {
                    proHtml += '<option value="' + pro[i].cityCode + '">' + pro[i].cityName + '</option>';
                }
            }
            //初始化省数据
            $("select[name=bankProvince]").append(proHtml);
            form.render();
            form.on('select(bankProvince)', function (proData) {
                console.log("选择省");
                $("select[name=bankCity]").html('<option value="">请选择县/区</option>');
                var value = proData.value;

                if (value > 0) {
                    $.post('/city/area', {cityCode: value, type: 2}, function (val) {
                        console.log(val.length) ;
                        that.citys(val);
                    }, "json");
                    //that.citys(pro[$(this).index() - 1].childs);

                } else {
                    $("select[name=bankCity]").attr("disabled", "disabled");
                }
            });
        }, 'json');
    }

    //加载市数据
    BankAddress.prototype.citys = function (citys) {

        var cityHtml = '<option value="">请选择市</option>', that = this;
        for (var i = 0; i < citys.length; i++) {
            var bankCityCode = $("#bankCityCode").val(); // cityCode不为空,需要进行返显,并查询下级区县信息
            if (citys[i].cityCode == bankCityCode) {
                cityHtml += '<option selected="selected" value="' + citys[i].cityCode + '">' + citys[i].cityName + '</option>';
            }else {
                cityHtml += '<option value="' + citys[i].cityCode + '">' + citys[i].cityName + '</option>';
            }
        }
        $("select[name=bankCity]").html(cityHtml).removeAttr("disabled");
        form.render();
    }

    var bankAddress = new BankAddress();
    exports("bankAddress", function () {
        bankAddress.provinces();
    });
});
