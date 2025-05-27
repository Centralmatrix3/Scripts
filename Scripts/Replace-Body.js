/*
 * @name = Replace-Body
 * @desc = Replace-Body
 * @author = mieqq
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