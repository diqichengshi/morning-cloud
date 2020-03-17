
const BASE_URL = process.env.NODE_ENV == 'production' ?
                'http://cms.qisosoft.net/' : 
                '';
                // 'http://127.0.0.1:8081/';

const USER_AGENT = navigator.userAgent;

export default {
    root: process.env.NODE_ENV == 'production' ?'/':'/',
    version: '20191201',
    server : BASE_URL + 'api/trans-gateway/',
    imgServer : BASE_URL,
    appid : '111',
    wxid: 'uH7bPMGXHr',
    isWechat: USER_AGENT.indexOf('MicroMessenger')>-1,
    signPackage: null,
    mobileRegexp: /^1[3-9]\d{9}$/,
    emailRegexp: /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/
};