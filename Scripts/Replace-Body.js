/*
 * @name = Replace-Body
 * @desc = Replace-Body
 * @author = mieqq
----------------------------------------
实现QuantumultX的response-body和request-body重写类型
  
如QuantumultX:
https://service.ilovepdf.com/v1/user url response-body false response-body true
   
可改写为 Surge:
[Script] 
test = type=http-response,pattern=https://service.ilovepdf.com/v1/user,requires-body=1,script-path=https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Scripts/Replace-Body.js,argument=false->true

argument=要匹配值=作为替换的值
支持正则:如argument=\w+->test
支持正则修饰符:如argument=/\w+/g->test
支持多参数:argument=匹配值1->替换值1&匹配值2->替换值2

支持改写响应体和请求体体(type=http-response或http-request)必须打开需要body(requires-body=1)

修改json格式的键值:
argument=("key")\s?:\s?"(.+?)"->$1: "new_value"

s修饰符可以让.匹配换行符如:argument=/.+/s->hello
----------------------------------------
*/

function getRegexp(re_str) {
  let regParts = re_str.match(/^\/(.*?)\/([gims]*)$/)
  if (regParts) {
    return new RegExp(regParts[1], regParts[2])
  } else {
    return new RegExp(re_str)
  }
}

let body
if (typeof $argument == 'undefined') {
  console.log('requires $argument')
} else {
  if (typeof $response != 'undefined') {
    body = $response.body
  } else if (typeof $request != 'undefined') {
    body = $request.body
  } else {
    console.log('script type error')
  }
}

let argument = $argument ?? ''
if (body) {
  try {
    argument = decodeURIComponent(argument)
  } catch (e) {}
  console.log('argument')
  console.log(argument)
  argument.split('&').forEach(item => {
    let [match, replace] = item.split('->')
    console.log('match')
    console.log(match)
    console.log('replace')
    console.log(replace)
    let re = getRegexp(match)
    body = body.replace(re, replace)
  })
  // console.log('body')
  // console.log(body)
  $done({ body })
} else {
  console.log('Not Modify')
  $done({})
}