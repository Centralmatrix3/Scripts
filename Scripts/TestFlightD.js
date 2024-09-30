/*
 * @name = TestFlightD
 * @tool = Stash Surge QuantumultX
 * @author = NobyDa
----------------------------------------
http:
  script:
    - match: ^https?:\/\/testflight\.apple\.com\/v\d\/accounts\/.+?\/install$
      name: TestFlight.D
      type: request
      require-body: true
      timeout: 120

  mitm:
    - "testflight.apple.com"

script-providers:
  TestFlight.D:
    url: https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Scripts/TestFlightD.js
    interval: 86400
----------------------------------------
[Script]
TF下载修正 = type=http-request,pattern=^https?:\/\/testflight\.apple\.com\/v\d\/accounts\/.+?\/install$,script-path=https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Scripts/TestFlightD.js,requires-body=true,timeout=120

[MITM]
hostname = %APPEND% testflight.apple.com
----------------------------------------
[rewrite_local]
^https?:\/\/testflight\.apple\.com\/v\d\/accounts\/.+?\/install$ url script-request-body https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Scripts/TestFlightD.js

[mitm]
hostname = testflight.apple.com
----------------------------------------
*/

let app = JSON.parse($request.body);
app.storefrontId = '143441-19,29';
$done({body:JSON.stringify(app)});