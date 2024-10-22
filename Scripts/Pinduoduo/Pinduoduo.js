/*
 * @name = 拼多多
 * @desc = 拼多多去广告
 * @author = RuCu6
*/

const url = $request.url;
if (!$response.body) $done({});
let obj = JSON.parse($response.body);

if (url.includes("/api/alexa/homepage/hub")) {
  // 底部标签栏
  if (obj?.result) {
    if (obj?.result?.bottom_tabs?.length > 0) {
      // 标签栏1
      obj.result.bottom_tabs = obj.result.bottom_tabs.filter((i) => /(?:chat_list|index|personal)/.test(i?.link));
    }
    if (obj?.result?.buffer_bottom_tabs?.length > 0) {
      // 标签栏2
      obj.result.buffer_bottom_tabs = obj.result.buffer_bottom_tabs.filter((i) => /(?:chat_list|index|personal)/.test(i?.link));
    }
    // delete obj.result.icon_set; // 顶部图标 多多买菜 现金大转盘
    delete obj.result.search_bar_hot_query; // 搜索框填充词
    delete obj.result.top_skin; // 顶部背景图
  }
}

$done({ body: JSON.stringify(obj) });
