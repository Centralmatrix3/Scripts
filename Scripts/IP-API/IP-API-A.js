/*
 * @name = IP-API
 * @tool = QuantumultX
 * @author = CrossUtility
----------------------------------------
[general]
geo_location_checker = https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Scripts/IP-API/IP-API-A.js
----------------------------------------
*/

if ($response.statusCode != 200) {
  $done(Null);
}

var body = $response.body;
var obj = JSON.parse(body);
var title = obj['country'];
var subtitle = obj['city'] + ' ' + obj['isp'];
var ip = obj['query'];
var description = "国家" + ":" + obj['country'] + '\n' + "城市" + ":" + obj['city'] + '\n' + "运营商" + ":" + obj['isp'] + '\n' + "数据中心" + ":" + obj['org'];


$done({title, subtitle, ip, description});