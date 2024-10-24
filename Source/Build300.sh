#!/bin/bash

# 目录
mkdir -p Scripts/Ruleset
mkdir -p Scripts/{QuantumultX,Stash,Surge}/Ruleset

# 合并
{
    curl -L "https://raw.githubusercontent.com/dler-io/Rules/main/Surge/Surge%203/Provider/Reject.list"
    echo ""
    curl -L "https://raw.githubusercontent.com/ConnersHua/RuleGo/master/Surge/Ruleset/Extra/Reject/Advertising.list"
    echo ""
    curl -L "https://raw.githubusercontent.com/ConnersHua/RuleGo/master/Surge/Ruleset/Extra/Reject/Malicious.list"
    echo ""
    curl -L "https://raw.githubusercontent.com/ConnersHua/RuleGo/master/Surge/Ruleset/Extra/Reject/Tracking.list"
    echo ""
    curl -L "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanAD.list"
    echo ""
    curl -L "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanProgramAD.list"
    echo ""
    curl -L "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanEasyListChina.list"
} > Scripts-repo/Ruleset/AdBlockLite.list
{
    curl -L "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ProxyGFWlist.list"
    echo ""
    curl -L "https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/gfw.txt"
} > Scripts-repo/Ruleset/Global.list

# 独立
curl -L -o Scripts-repo/Ruleset/AdBlock.list "https://raw.githubusercontent.com/privacy-protection-tools/anti-AD/master/anti-ad-surge.txt"
curl -L -o Scripts-repo/Ruleset/Advertising.list "https://raw.githubusercontent.com/Cats-Team/AdRules/main/adrules.list"
curl -L -o Scripts-repo/Ruleset/CNCIDR4.list "https://raw.githubusercontent.com/Hackl0us/GeoIP2-CN/release/CN-ip-cidr.txt"
curl -L -o Scripts-repo/Ruleset/CNCIDR6.list "https://raw.githubusercontent.com/Masaiki/GeoIP2-CN/release/CN-ip-cidr.txt"
curl -L -o Scripts-repo/Ruleset/Apple.list "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Apple.list"
curl -L -o Scripts-repo/Ruleset/BiliBili.list "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Bilibili.list"
curl -L -o Scripts-repo/Ruleset/Netflix.list "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Netflix.list"
curl -L -o Scripts-repo/Ruleset/PrivateTracker.list "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/PrivateTracker.list"

curl -L -o Scripts-repo/Ruleset/AmazonIP.list "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/AmazonIp.list"
curl -L -o Scripts-repo/Ruleset/China.list "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ChinaDomain.list"
curl -L -o Scripts-repo/Ruleset/ChinaIPv4.list "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ChinaIp.list"
curl -L -o Scripts-repo/Ruleset/ChinaIPv6.list "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ChinaIpV6.list"
curl -L -o Scripts-repo/Ruleset/Easylist.list "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanEasyList.list"
curl -L -o Scripts-repo/Ruleset/Google.list "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Google.list"
curl -L -o Scripts-repo/Ruleset/Microsoft.list "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Microsoft.list"
curl -L -o Scripts-repo/Ruleset/Privacy.list "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanEasyPrivacy.list"

curl -L -o Scripts-repo/Ruleset/ChinaASN.list "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/ChinaASN/ChinaASN_Resolve.list"
curl -L -o Scripts-repo/Ruleset/ChinaIPBGP.list "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/ChinaIPsBGP/ChinaIPsBGP.list"
curl -L -o Scripts-repo/Ruleset/ChinaIPMax.list "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/ChinaIPs/ChinaIPs.list"
curl -L -o Scripts-repo/Ruleset/ChinaMax.list "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/ChinaMax/ChinaMax.list"
curl -L -o Scripts-repo/Ruleset/ChinaMediaMax.list "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/ChinaMedia/ChinaMedia.list"
curl -L -o Scripts-repo/Ruleset/Game.list "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Game/Game.list"
curl -L -o Scripts-repo/Ruleset/GlobalMax.list "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Global/Global.list"
curl -L -o Scripts-repo/Ruleset/GlobalMediaMax.list "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/GlobalMedia/GlobalMedia.list"

curl -L -o Scripts-repo/Ruleset/CNCIDR.list "https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/cncidr.txt"
curl -L -o Scripts-repo/Ruleset/DIRECT.list "https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/direct.txt"
curl -L -o Scripts-repo/Ruleset/GreatFire.list "https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/greatfire.txt"
curl -L -o Scripts-repo/Ruleset/GreatFireWall.list "https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/gfw.txt"
curl -L -o Scripts-repo/Ruleset/PROXY.list "https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/proxy.txt"
curl -L -o Scripts-repo/Ruleset/Private.list "https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/private.txt"
curl -L -o Scripts-repo/Ruleset/REJECT.list "https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/reject.txt"
curl -L -o Scripts-repo/Ruleset/Tld-Not-CN.list "https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/tld-not-cn.txt"

# 独立
curl -L -o Scripts-repo/QuantumultX/Ruleset/AdBlock.list "https://raw.githubusercontent.com/privacy-protection-tools/anti-AD/master/anti-ad-surge.txt"
curl -L -o Scripts-repo/Stash/Ruleset/AdBlock.yaml "https://raw.githubusercontent.com/privacy-protection-tools/anti-AD/master/anti-ad-surge.txt"
curl -L -o Scripts-repo/Surge/Ruleset/AdBlock.list "https://raw.githubusercontent.com/privacy-protection-tools/anti-AD/master/anti-ad-surge.txt"

curl -L -o Scripts-repo/QuantumultX/Ruleset/Advertising.list "https://raw.githubusercontent.com/Cats-Team/AdRules/main/adrules.list"
curl -L -o Scripts-repo/Stash/Ruleset/Advertising.yaml "https://raw.githubusercontent.com/Cats-Team/AdRules/main/adrules.list"
curl -L -o Scripts-repo/Surge/Ruleset/Advertising.list "https://raw.githubusercontent.com/Cats-Team/AdRules/main/adrules.list"