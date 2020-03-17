import config from './config'

const transDate = date => {
    if (typeof date == typeof 'a') {
        if (parseInt(date) == date) {
            date = timestamp2date(date)
        } else {
            date = string2date(date)
        }
    } else if (typeof date == typeof 1) {
        date = timestamp2date(date)
    }
    if (date instanceof Date) {
        return date
    }
    return new Date('a')
}

const isValidDate = (date) => {
    return date && date instanceof Date && !isNaN(date.getTime())
}

const timestamp2date = timestamp => {
    return (timestamp) ? new Date(timestamp * 1000) : new Date()
}

const string2date = datestring => {
    return (datestring) ? new Date(datestring.replace(/-/g, '/')) : new Date()
}

const dateFormat = (format, timestamp) => {
    let jsdate = transDate(timestamp);
    let pad = function (n, c) {
        if ((n = n + "").length < c) {
            return new Array(++c - n.length).join("0") + n;
        } else {
            return n;
        }
    };
    let txt_weekdays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    let txt_ordin = {
        1: "st",
        2: "nd",
        3: "rd",
        21: "st",
        22: "nd",
        23: "rd",
        31: "st"
    };
    let txt_months = ["", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    let f = {
        // Day 
        d: function () {
            return pad(f.j(), 2)
        },
        D: function () {
            return f.l().substr(0, 3)
        },
        j: function () {
            return jsdate.getDate()
        },
        l: function () {
            return txt_weekdays[f.w()]
        },
        N: function () {
            return f.w() + 1
        },
        S: function () {
            return txt_ordin[f.j()] ? txt_ordin[f.j()] : 'th'
        },
        w: function () {
            return jsdate.getDay()
        },
        z: function () {
            return (jsdate - new Date(jsdate.getFullYear() + "/1/1")) / 864e5 >> 0
        },

        // Week 
        W: function () {
            var a = f.z(),
                b = 364 + f.L() - a;
            var nd2, nd = (new Date(jsdate.getFullYear() + "/1/1").getDay() || 7) - 1;
            if (b <= 2 && ((jsdate.getDay() || 7) - 1) <= 2 - b) {
                return 1;
            } else {
                if (a <= 2 && nd >= 4 && a >= (6 - nd)) {
                    nd2 = new Date(jsdate.getFullYear() - 1 + "/12/31");
                    return dateFormat("W", Math.round(nd2.getTime() / 1000));
                } else {
                    return (1 + (nd <= 3 ? ((a + nd) / 7) : (a - (7 - nd)) / 7) >> 0);
                }
            }
        },

        // Month 
        F: function () {
            return txt_months[f.n()]
        },
        m: function () {
            return pad(f.n(), 2)
        },
        M: function () {
            return f.F().substr(0, 3)
        },
        n: function () {
            return jsdate.getMonth() + 1
        },
        t: function () {
            var n;
            if ((n = jsdate.getMonth() + 1) == 2) {
                return 28 + f.L();
            } else {
                if (n & 1 && n < 8 || !(n & 1) && n > 7) {
                    return 31;
                } else {
                    return 30;
                }
            }
        },

        // Year 
        L: function () {
            var y = f.Y();
            return (!(y & 3) && (y % 1e2 || !(y % 4e2))) ? 1 : 0
        },
        //o not supported yet 
        Y: function () {
            return jsdate.getFullYear()
        },
        y: function () {
            return (jsdate.getFullYear() + "").slice(2)
        },

        // Time 
        a: function () {
            return jsdate.getHours() > 11 ? "pm" : "am"
        },
        A: function () {
            return f.a().toUpperCase()
        },
        B: function () {
            // peter paul koch: 
            var off = (jsdate.getTimezoneOffset() + 60) * 60;
            var theSeconds = (jsdate.getHours() * 3600) + (jsdate.getMinutes() * 60) + jsdate.getSeconds() + off;
            var beat = Math.floor(theSeconds / 86.4);
            if (beat > 1000) beat -= 1000;
            if (beat < 0) beat += 1000;
            if ((String(beat)).length == 1) beat = "00" + beat;
            if ((String(beat)).length == 2) beat = "0" + beat;
            return beat;
        },
        g: function () {
            return jsdate.getHours() % 12 || 12
        },
        G: function () {
            return jsdate.getHours()
        },
        h: function () {
            return pad(f.g(), 2)
        },
        H: function () {
            return pad(jsdate.getHours(), 2)
        },
        i: function () {
            return pad(jsdate.getMinutes(), 2)
        },
        s: function () {
            return pad(jsdate.getSeconds(), 2)
        },
        //u not supported yet 

        // Timezone 
        //e not supported yet 
        //I not supported yet 
        O: function () {
            var t = pad(Math.abs(jsdate.getTimezoneOffset() / 60 * 100), 4);
            if (jsdate.getTimezoneOffset() > 0) t = "-" + t;
            else t = "+" + t;
            return t;
        },
        P: function () {
            var O = f.O();
            return (O.substr(0, 3) + ":" + O.substr(3, 2))
        },
        //T not supported yet 
        //Z not supported yet 

        // Full Date/Time 
        c: function () {
            return f.Y() + "-" + f.m() + "-" + f.d() + "T" + f.h() + ":" + f.i() + ":" + f.s() + f.P()
        },
        //r not supported yet 
        U: function () {
            return Math.round(jsdate.getTime() / 1000)
        }
    };

    return format.replace(/[\\]?([a-zA-Z])/g, function (t, s) {
        let ret = '';
        if (t != s) {
            // escaped 
            ret = s;
        } else if (f[s]) {
            // a date function exists 
            ret = f[s]();
        } else {
            // nothing special 
            ret = s;
        }
        return ret;
    });
}

const sortAddressTree = (data) => {
    let areaTree = {};
    let provinces = Object.values(data.province_list);
    let provinceKeys = Object.keys(data.province_list);

    areaTree["00"] = provinces;

    let areas = {};
    for (let code in data.county_list) {
        let subcode = code.substring(0, 4);
        if (!areas[subcode]) areas[subcode] = [];
        areas[subcode].push(data.county_list[code]);
    }

    for (let code in data.city_list) {
        let idx = provinceKeys.indexOf(code.substring(0, 2) + "0000");
        if (idx < 0) continue;
        let province = provinces[idx];
        if (!areaTree[province]) areaTree[province] = [];
        areaTree[province].push(data.city_list[code]);

        let subcode = code.substring(0, 4);
        if (areas[subcode]) {
            areaTree[data.city_list[code]] = areas[subcode];
        }
    }
    return areaTree;
}

const formatNumber = (n, len = 2) => {
    if (isNaN(n)) n = 0;
    let l = n.toString().length;
    return l >= len ? n : (new Array(len - l + 1).join('0') + n)
}

const formatMoney = (money) => {
    if (!money) money = 0;
    return (money * 0.01).toFixed(2)
}

const fixImageUrl = (img, defaultImg='') => {
    if (!img) return defaultImg;

    if (img.startsWith('/')) {
        img = img.substr(1)
    }

    return config.imgServer + img;
}

const fixListImage = (list, key = 'image', defaultImg='') => {
    if (!list) return list;

    if(list instanceof Array){
        list.forEach(item => {
            return fixListImage(item, key, defaultImg)
        })
    }else{
        let keys = key.split(',')
        keys.forEach(k => {
            if (list.hasOwnProperty(k)) {
                list[k] = fixImageUrl(list[k],defaultImg)
            }else if(k.indexOf('.')>0){
                let subs=k.split('.'),deep=list,len=subs.length
                for(let i=0; i < len ;i++){
                    if(!deep[subs[i]])continue;
                    if( i == len-1){
                        if(deep[subs[i]] instanceof Array){
                            deep[subs[i]]=deep[subs[i]].map(item=>{
                                return fixImageUrl(item)
                            })
                        }else{
                            deep[subs[i]] = fixImageUrl(deep[subs[i]],defaultImg);
                        }
                    }else{
                        if(deep[subs[i]] instanceof Array){
                            deep[subs[i]]=fixListImage(deep[subs[i]],subs.slice(i+1).join('.'),defaultImg)
                            break;
                        }
                        deep = deep[subs[i]]
                    }
                }
            }
        })
    }
   
    return list
}

const parseQuery = (query)=>{
    let param={}
    if(query){
        query = query.substring(1)
        let parts = query.split('&')
        for(let i=0;i<parts.length;i++){
            let eIndex=parts[i].indexOf('=')
            if(eIndex > 0){
                let key = parts[i].substr(0,eIndex)
                param[key] = decodeURIComponent(parts[i].substr(eIndex+1))
            }
        }
    }
    return param
}

const maskString = (str, len=3)=>{
    if(!str)return '*'
    let strlen=str.length
    if(strlen <= len+1){
        len = strlen - 2
    }
    let left = Math.floor((strlen-len)* 0.5)
    if(len <= 0){
        len = 1;
    }

    return str.substring(0,left)+new Array(len+1).join('*')+str.substring(left+len);
}

const parseHtml = (html)=>{
    if(typeof html!= 'string' || html=='')return html
    //移除不支持的
    html = html.replace(/&emsp;/g,'')
    html = html.replace(/\bid="[^"]+"\s*/g, '')

    html = html.replace(/<([\w]+)\s+(?:class="([^"]+)")?/g,(mth,tag,cls)=>{
        //console.log(tag,cls)
        if(tag=='br'){
            return mth
        }else{
            return '<'+tag+' class="tag_'+tag+(cls?(' '+cls):'')+'" '
        }
    })
    html = html.replace(/src="([^"]+)"/g,(mth,url)=>{
        //console.log(url)
        return 'src="' + fixImageUrl(url) + '"'
    })
    return html
}

export default {
    isValidDate: isValidDate,
    transDate: transDate,
    dateFormat: dateFormat,
    sortAddressTree: sortAddressTree,
    formatNumber: formatNumber,
    formatMoney: formatMoney,
    fixImageUrl: fixImageUrl,
    fixListImage: fixListImage,
    parseQuery: parseQuery,
    maskString: maskString,
    parseHtml: parseHtml
}