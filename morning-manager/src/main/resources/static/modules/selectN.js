/*
* @version: 1.2
* @Author:  tomato
* @Date:    2018-4-24 22:56:00
* @Last Modified by:   tomato
* @Last Modified time: 2018-5-26 18:08:43
* @Last Modified by:   高峰
* @Last Modified time: 2018-11-26 00:51:00
*/
//无限级下拉框
layui.define(['jquery', 'form'], function (exports) {
    var MOD_NAME = 'selectN';
    var $ = layui.jquery;
    var form = layui.form;
    var obj = function (config) {
        //当前选中数据值名数据
        this.selected = [];
        //当前选中的值
        this.values = [];
        //当前选中的名
        this.names = [];
        //当前选中最后一个值
        this.lastValue = '';
        //当前选中最后一个值
        this.lastName = '';
        //是否已选
        this.isSelected = false;
        //初始化配置
        this.config = {
            //选择器id或class
            elem: '',
            //无限级分类数据
            data: [],
            //ajax请求的数据地址,获取数据后会赋值给data
            url: '',
            //默认选中值
            selected: [],
            //空值项提示，可设置为数组['请选择省','请选择市','请选择县']
            tips: ['请选择'],
            //是否允许搜索，可设置为数组[true,true,true]
            search: [false],
            //选择项宽度，可设置为数组['80','90','100']
            width: null,
            //为真只取最后一个值
            last: false,
            //值验证，与lay-verify一致
            verify: '',
            //事件过滤器，lay-filter名,不设置与选择器相同(去#.)
            filter: '',
            //select的name 不设置与选择器相同(去#.) 只有一个下拉框时可以不填,多级下拉时必须设置,form表单提交的属性名称
            name: [],
            //数据分隔符
            delimiter: ',',
            //数据的键名 status=0为禁用状态
            field: {idName: 'id', titleName: 'name', statusName: 'status', childName: 'children'},
            //多表单区分 form.render(type, filter); 为class="layui-form" 所在元素的 lay-filter="" 的值
            formFilter: null
        }

        //实例化配置
        this.config = $.extend(this.config, config);

        //获取当前下拉框数量
        this.getSelectTotal = function () {
            var self = this, config = self.config;
            return $(config.elem).find('select').length;
        }

        //“请选择”文字
        this.getTip = function () {
            var self = this, config = self.config;
            var i = self.getSelectTotal();
            if (config.tips.hasOwnProperty(i)) {
                return config.tips[i];
            }
            return ' ';
        }

        //获取<select>的name
        this.getName = function () {
            var self = this, config = self.config;
            var i = self.getSelectTotal();
            if (config.name.hasOwnProperty(i)) {
                return config.name[i];
            }
            return ' ';
        }

        //设置是否允许搜索
        this.getSearch = function () {
            var self = this, config = self.config;
            var i = self.getSelectTotal();
            if (config.search.hasOwnProperty(i)) {
                return config.search[i] === true ? 'lay-search ' : ' ';
            }
            return ' ';
        }

        //设置是否允许搜索
        this.setWidth = function () {
            var o = this, c = o.config;
            if (Object.prototype.toString.call(c.width) != '[object Array]') {
                return /^\d+$/.test(c.width) ? 'style="width:' + c.width + 'px;" ' : ' ';
            }
            else {
                var i = $(c.elem).find('select').length;
                if (c.width.hasOwnProperty(i)) {
                    return /^\d+$/.test(c.width[i]) ? 'style="width:' + c.width[i] + 'px;" ' : ' ';
                }
            }
        }

        //创建一个Select,入参是下拉框的数据
        this.createSelect = function (optionData) {
            var self = this, config = self.config, field = config.field;
            var html = '';
            html += '<div class="layui-input-inline" ' + self.setWidth() + '>';
            html += ' <select ' + ' name= "' + self.getName() + '"' + self.getSearch() + ' lay-filter="' + config.filter + '">';
            html += '  <option value="">' + self.getTip() + '</option>';
            for (var i = 0; i < optionData.length; i++) {
                var disabled = optionData[i][field.statusName] == 0 ? 'disabled="" ' : '';
                html += '  <option ' + disabled + 'value="' + optionData[i][field.idName] + '">' + optionData[i][field.titleName] + '</option>';
            }
            html += ' </select>';
            html += '</div>';
            return html;
        };

        //获取当前option的数据
        this.getOptionData = function (catData, optionIndex) {
            var f = this.config.field;
            var item = catData;
            for (var i = 0; i < optionIndex.length; i++) {
                if ('undefined' == typeof item[optionIndex[i]]) {
                    item = null;
                    break;
                }
                else if ('undefined' == typeof item[optionIndex[i]][f.childName]) {
                    item = null;
                    break;
                }
                else {
                    item = item[optionIndex[i]][f.childName];
                }
            }
            return item;
        };

        //初始化
        this.init = function () {
            var self = this, config = self.config,
                $E = $(config.elem);
            if (self.getSelectTotal() < 1) {
                //创建顶级select
                var html = self.createSelect(config.data);
                $E.html(html);
            }
            $E.find('div.layui-input-inline').nextAll().remove();

            form.render('select', config.formFilter);
        };

        //下拉事件
        this.change = function (data) {
            var self = this, config = self.config;
            var $thisItem = $(data.elem).parent();
            //移除后面的select
            $thisItem.nextAll('div.layui-input-inline').remove();
            if (self.getSelectTotal() < config.name.length) {
                var childItem = self.getData(config.url + '/' + data.value);
                var html = self.createSelect(childItem);
                $thisItem.after(html);
            }
            form.render('select', config.formFilter);
        };

        //ajax方式获取候选数据
        this.getData = function (url) {
            var d;
            $.ajax({
                url: url,
                dataType: 'json',
                async: false,
                success: function (json) {
                    d = json;
                },
                error: function () {
                    console.log(MOD_NAME + ' hint：候选数据ajax请求错误 ');
                    d = false;
                }
            });
            return d;
        }


    };

    //渲染一个实例
    obj.prototype.render = function () {
        var self = this, config = self.config, $E = $(config.elem);
        if ($E.length == 0) {
            console.error(MOD_NAME + ' hint：找不到容器 ' + config.elem);
            return false;
        }
        //检查是否直接赋值data了,是否为空 "",null,undefined
        if (!$.trim(config.data)) {
            if ($.trim(config.url)) {
                config.data = self.getData(config.url);
            }
            else {
                console.error(MOD_NAME + ' hint：缺少分类数据');
                return false;
            }
        }

        //检查name是否设置，没有设置使用elem
        if (config.name.length == 0) {
            config.name.push(config.elem.replace('#', '').replace('.', ''));
        }
        //检查filter是否设置
        if (!$.trim(config.filter)) {
            config.filter = config.elem.replace('#', '').replace('.', '');
        }
        //初始化
        self.init();
        //监听下拉事件
        form.on('select(' + config.filter + ')', function (data) {
            self.change(data);
        });
    }
    //设置下拉初始值,入参selected是数组
    obj.prototype.set = function (selected) {
        var self = this, config = self.config, $E = $(config.elem);
        //判断是否为空
        if (!$.trim(selected)) {
            return;
        }
        for (var i = 0; i < selected.length; i++) {
            var $select = $E.find('select[name="' + config.name[i] + '"]');
            //如果还没有下拉框，创建
            if ($select.length == 0) {
                var childItem = self.getData(config.url + '/' + selected[i - 1]);
                var html = self.createSelect(childItem);
                $E.append(html);
                form.render('select', config.formFilter);
                var $select = $E.find('select[name="' + config.name[i] + '"]');
            }
            //设置初始值
            $select.val(selected[i]);
        }
        form.render('select', config.formFilter);
        //处理最后选中下拉框的下一个下拉框
        if (selected.length < config.name.length) {
            var childItem = self.getData(config.url + '/' + selected[selected.length - 1]);
            var html = self.createSelect(childItem);
            $E.append(html);
            form.render('select', config.formFilter);
        }
    }
    //输出模块
    exports(MOD_NAME, function (config) {
        var _this = new obj(config);
        _this.render();
        return _this;
    });
});