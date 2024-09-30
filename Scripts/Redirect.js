/*
 * @name = Redirect
 * @tool = Stash Surge QuantumultX
 * @author = app2smile
----------------------------------------
http:
  script:
    - match: ^https:\/\/boxer\.baidu\.com\/scheme\?scheme
      name: No-Redirect
      type: response
      timeout: 60

  mitm:
    - "boxer.baidu.com"

script-providers:
  No-Redirect:
    url: https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Scripts/Redirect.js
    interval: 86400
----------------------------------------
[Script]
No-Redirect = type=http-response,pattern=^https:\/\/boxer\.baidu\.com\/scheme\?scheme,script-path=https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Scripts/Redirect.js,timeout=60

[MITM]
hostname = %APPEND% boxer.baidu.com
----------------------------------------
[rewrite_local]
https:\/\/boxer\.baidu\.com\/scheme\?scheme url script-response-header https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Scripts/Redirect.js

[mitm]
hostname = boxer.baidu.com
----------------------------------------
*/

const method = $request.method;
const url = $request.url;
const status = $response.status;
let headers = $response.headers;
const notifiTitle = "百度搜索防跳转AppStore错误";

if (method !== "GET" || status !== 302 || !headers.hasOwnProperty('Location')) {
    console.log(`method:${method},status:${status},url:${url}`);
    $notification.post(notifiTitle, "百度防跳转AppStore", "method/status有误");
} else {
    if (headers.Location.indexOf('.apple.com') !== -1) {
        let tokenData = getUrlParamValue(url, 'tokenData');
        if (tokenData == null) {
            console.log(`未获取到tokenData,url:${url}`);
            $notification.post(notifiTitle, "getUrlParamValue", "未获取到tokenData");
        } else {
            let tokenDataObj = JSON.parse(decodeURIComponent(tokenData));
            headers.Location = tokenDataObj.url;
            console.log('成功');
        }
    } else {
        console.log('无需修改Location');
    }
}
$done({
    headers
});

function getUrlParamValue(url, queryName) {
    return Object.fromEntries(url.substring(url.indexOf("?") + 1)
        .split("&")
        .map(pair => pair.split("="))
    )[queryName];
}