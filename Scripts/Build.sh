#!/usr/bin/env bash

set -euo pipefail
repo_name="$(basename "$GITHUB_REPOSITORY")"
download() {
    local output="$1"
    shift
    : > "$output"
    for url in "$@"; do
        echo "Processed: $url -> $output"
        curl -fsSL --retry 3 --retry-delay 2 "$url" >> "$output" ||
        { echo "Download Failed: $url"; exit 1; }
        echo >> "$output"
    done
}

if [[ "$repo_name" == "Scripts" ]]; then
    echo "Execute in $repo_name Repository"
    rule_path=("Ruleset" "QuantumultX/Ruleset" "Stash/Ruleset" "Surge/Ruleset")
    for dir in "${rule_path[@]}"; do
        mkdir -p "$repo_name/$dir"
    done
    declare -A load_ruleA=(
        ["$repo_name/Ruleset/AdBlockLite.list"]="AdBlockLite"
        ["$repo_name/Ruleset/Global.list"]="Global"
    )
    AdBlockLite=(
        "https://raw.githubusercontent.com/ConnersHua/RuleGo/master/Surge/Ruleset/Extra/Reject/Advertising.list"
        "https://raw.githubusercontent.com/ConnersHua/RuleGo/master/Surge/Ruleset/Extra/Reject/Malicious.list"
        "https://raw.githubusercontent.com/ConnersHua/RuleGo/master/Surge/Ruleset/Extra/Reject/Tracking.list"
        "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanAD.list"
        "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanProgramAD.list"
        "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanEasyListChina.list"
    )
    Global=(
        "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ProxyGFWlist.list"
        "https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/gfw.txt"
    )
    for out_file in "${!load_ruleA[@]}"; do
        declare -n ref="${load_ruleA[$out_file]}"
        download "$out_file" "${ref[@]}"
    done
    declare -A load_ruleB=(
        ["$repo_name/Ruleset/AdBlock.list"]="https://raw.githubusercontent.com/privacy-protection-tools/anti-AD/master/anti-ad-surge.txt"
        ["$repo_name/Ruleset/AdGuardBlock.list"]="https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/AdGuardSDNSFilter/AdGuardSDNSFilter.list"
        ["$repo_name/Ruleset/Advertising.list"]="https://raw.githubusercontent.com/Cats-Team/AdRules/main/adrules.list"
        ["$repo_name/Ruleset/Alibaba.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Alibaba.list"
        ["$repo_name/Ruleset/Amazon.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Amazon.list"
        ["$repo_name/Ruleset/AmazonIP.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/AmazonIp.list"
        ["$repo_name/Ruleset/Apple.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Apple.list"
        ["$repo_name/Ruleset/Baidu.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Baidu.list"
        ["$repo_name/Ruleset/ByteDance.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/ByteDance.list"
        ["$repo_name/Ruleset/BiliBili.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Bilibili.list"
        ["$repo_name/Ruleset/CNCIDR.list"]="https://raw.githubusercontent.com/Loyalsoldier/geoip/release/text/cn.txt"
        ["$repo_name/Ruleset/CNCIDR4.list"]="https://raw.githubusercontent.com/Hackl0us/GeoIP2-CN/release/CN-ip-cidr.txt"
        ["$repo_name/Ruleset/CNCIDR6.list"]="https://raw.githubusercontent.com/Masaiki/GeoIP2-CN/release/CN-ip-cidr.txt"
        ["$repo_name/Ruleset/China.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ChinaDomain.list"
        ["$repo_name/Ruleset/ChinaASN.list"]="https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/ChinaASN/ChinaASN_Resolve.list"
        ["$repo_name/Ruleset/ChinaIPBGP.list"]="https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/ChinaIPsBGP/ChinaIPsBGP.list"
        ["$repo_name/Ruleset/ChinaIPMax.list"]="https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/ChinaIPs/ChinaIPs.list"
        ["$repo_name/Ruleset/ChinaIPv4.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ChinaIp.list"
        ["$repo_name/Ruleset/ChinaIPv6.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ChinaIpV6.list"
        ["$repo_name/Ruleset/ChinaMax.list"]="https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/ChinaMax/ChinaMax.list"
        ["$repo_name/Ruleset/ChinaMediaMax.list"]="https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/ChinaMedia/ChinaMedia.list"
        ["$repo_name/Ruleset/DIRECT.list"]="https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/direct.txt"
        ["$repo_name/Ruleset/Easylist.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanEasyList.list"
        ["$repo_name/Ruleset/Facebook.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Facebook.list"
        ["$repo_name/Ruleset/Game.list"]="https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Game/Game.list"
        ["$repo_name/Ruleset/GlobalMax.list"]="https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Global/Global.list"
        ["$repo_name/Ruleset/GlobalMediaMax.list"]="https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/GlobalMedia/GlobalMedia.list"
        ["$repo_name/Ruleset/Google.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Google.list"
        ["$repo_name/Ruleset/GreatFire.list"]="https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/greatfire.txt"
        ["$repo_name/Ruleset/GreatFireWall.list"]="https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/gfw.txt"
        ["$repo_name/Ruleset/Microsoft.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Microsoft.list"
        ["$repo_name/Ruleset/Netflix.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Netflix.list"
        ["$repo_name/Ruleset/PROXY.list"]="https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/proxy.txt"
        ["$repo_name/Ruleset/Privacy.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanEasyPrivacy.list"
        ["$repo_name/Ruleset/Private.list"]="https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/private.txt"
        ["$repo_name/Ruleset/PrivateTracker.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/PrivateTracker.list"
        ["$repo_name/Ruleset/REJECT.list"]="https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/reject.txt"
        ["$repo_name/Ruleset/Tld-Not-CN.list"]="https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/tld-not-cn.txt"
        ["$repo_name/Ruleset/USCIDR.list"]="https://raw.githubusercontent.com/Loyalsoldier/geoip/release/text/us.txt"
        ["$repo_name/Ruleset/WeChat.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Wechat.list"
    )
    for out_file in "${!load_ruleB[@]}"; do
        download "$out_file" "${load_ruleB[$out_file]}"
    done
    declare -A load_ruleC=(
        ["AdBlock"]="AdBlock.list"
        ["Advertising"]="Advertising.list"
        ["AppStore"]="AppStore.list"
        ["Apple"]="Apple.list"
        ["BiliBili"]="BiliBili.list"
        ["ChinaASN"]="ChinaASN.list"
        ["ChinaMedia"]="ChinaMedia.list"
        ["DouYin"]="DouYin.list"
        ["GEOIPCN"]="GEOIPCN.list"
        ["GitHub"]="GitHub.list"
        ["Global"]="Global.list"
        ["GlobalMedia"]="GlobalMedia.list"
        ["Google"]="Google.list"
        ["HMTMedia"]="HMTMedia.list"
        ["LAN"]="LAN.list"
        ["Microsoft"]="Microsoft.list"
        ["Telegram"]="Telegram.list"
        ["TikTok"]="TikTok.list"
        ["Unbreak"]="Unbreak.list"
        ["WeChat"]="WeChat.list"
    )
    declare -A formats=(
        ["QuantumultX"]="list"
        ["Stash"]="yaml"
        ["Surge"]="list"
    )
    for key in "${!load_ruleC[@]}"; do
        file="$repo_name/Ruleset/${load_ruleC[$key]}"
        base="$(basename "${load_ruleC[$key]}" .list)"
        for platform in "${!formats[@]}"; do
            dirs="$repo_name/$platform/Ruleset/$base.${formats[$platform]}"
            cp "$file" "$dirs"
            echo "Processed: $file -> $dirs"
        done
    done
    echo "$repo_name Repository: All Ruleset Processed!"

elif [[ "$repo_name" == "Matrix-io" ]]; then
    echo "Execute in $repo_name Repository"
    rule_path=("Clash" "Egern" "Loon" "QuantumultX" "Shadowrocket" "Sing-box" "Stash" "Surge")
    for dir in "${rule_path[@]}"; do
        mkdir -p "$repo_name/$dir/Ruleset"
    done
    declare -A load_ruleA=(
        ["ABC"]="ABC.list"
        ["AMAP"]="AMAP.list"
        ["AcFun"]="AcFun.list"
        ["AdBlock"]="AdBlock.list"
        ["Advertising"]="Advertising.list"
        ["AliPay"]="AliPay.list"
        ["Alibaba"]="Alibaba.list"
        ["All4"]="All4.list"
        ["Amazon"]="Amazon.list"
        ["AmazonCN"]="AmazonCN.list"
        ["Android"]="Android.list"
        ["AppStore"]="AppStore.list"
        ["Apple"]="Apple.list"
        ["AppleTV"]="AppleTV.list"
        ["Baidu"]="Baidu.list"
        ["BiliBili"]="BiliBili.list"
        ["Blizzard"]="Blizzard.list"
        ["ByteDance"]="ByteDance.list"
        ["CNCIDR"]="CNCIDR.list"
        ["CNCIDR4"]="CNCIDR4.list"
        ["CNCIDR6"]="CNCIDR6.list"
        ["ChinaASN"]="ChinaASN.list"
        ["ChinaIPBGP"]="ChinaIPBGP.list"
        ["ChinaIPMax"]="ChinaIPMax.list"
        ["ChinaIPv4"]="ChinaIPv4.list"
        ["ChinaIPv6"]="ChinaIPv6.list"
        ["ChinaMax"]="ChinaMax.list"
        ["ChinaMedia"]="ChinaMedia.list"
        ["Claude"]="Claude.list"
        ["Coolapk"]="Coolapk.list"
        ["Copilot"]="Copilot.list"
        ["DIRECT"]="DIRECT.list"
        ["Deezer"]="Deezer.list"
        ["Discord"]="Discord.list"
        ["Docker"]="Docker.list"
        ["DouBan"]="DouBan.list"
        ["DouYin"]="DouYin.list"
        ["DouYu"]="DouYu.list"
        ["Dropbox"]="Dropbox.list"
        ["Facebook"]="Facebook.list"
        ["GEOIPCN"]="GEOIPCN.list"
        ["GitHub"]="GitHub.list"
        ["GitLab"]="GitLab.list"
        ["Global"]="Global.list"
        ["GlobalMax"]="GlobalMax.list"
        ["GlobalMedia"]="GlobalMedia.list"
        ["Google"]="Google.list"
        ["GoogleCN"]="GoogleCN.list"
        ["GreatFireWall"]="GreatFireWall.list"
        ["HBO"]="HBO.list"
        ["HBOAsia"]="HBOAsia.list"
        ["HMTMedia"]="HMTMedia.list"
        ["Heroku"]="Heroku.list"
        ["HuYa"]="HuYa.list"
        ["Hulu"]="Hulu.list"
        ["HuluJP"]="HuluJP.list"
        ["ICloud"]="ICloud.list"
        ["IQiYi"]="IQiYi.list"
        ["JOOX"]="JOOX.list"
        ["LAN"]="LAN.list"
        ["Microsoft"]="Microsoft.list"
        ["MyTVSuper"]="MyTVSuper.list"
        ["NetEase"]="NetEase.list"
        ["NetEaseMusic"]="NetEaseMusic.list"
        ["Netflix"]="Netflix.list"
        ["NivodTV"]="NivodTV.list"
        ["Onedrive"]="Onedrive.list"
        ["OpenAI"]="OpenAI.list"
        ["Oracle"]="Oracle.list"
        ["PROXY"]="PROXY.list"
        ["PayPal"]="PayPal.list"
        ["PikPak"]="PikPak.list"
        ["PornHub"]="PornHub.list"
        ["Qobuz"]="Qobuz.list"
        ["Quark"]="Quark.list"
        ["Quora"]="Quora.list"
        ["REJECT"]="REJECT.list"
        ["SoundCloud"]="SoundCloud.list"
        ["Speedtest"]="Speedtest.list"
        ["Spotify"]="Spotify.list"
        ["Steam"]="Steam.list"
        ["SteamCN"]="SteamCN.list"
        ["TIDAL"]="TIDAL.list"
        ["TapTap"]="TapTap.list"
        ["Telegram"]="Telegram.list"
        ["Tencent"]="Tencent.list"
        ["TencentVideo"]="TencentVideo.list"
        ["TikTok"]="TikTok.list"
        ["Twitch"]="Twitch.list"
        ["Twitter"]="Twitter.list"
        ["Unbreak"]="Unbreak.list"
        ["Vercel"]="Vercel.list"
        ["WeChat"]="WeChat.list"
        ["WeiBo"]="WeiBo.list"
        ["WhatsApp"]="WhatsApp.list"
        ["Wikipedia"]="Wikipedia.list"
        ["Ximalaya"]="Ximalaya.list"
        ["Yandex"]="Yandex.list"
        ["YouTube"]="YouTube.list"
        ["Youku"]="Youku.list"
    )
    declare -A formats=(
        ["Clash"]="yaml"
        ["Egern"]="yaml"
        ["Loon"]="list"
        ["QuantumultX"]="list"
        ["Shadowrocket"]="list"
        ["Sing-box"]="json"
        ["Stash"]="yaml"
        ["Surge"]="list"
    )
    declare -A exclude=(
        ["Clash"]=""
        ["Egern"]=""
        ["Loon"]=""
        ["QuantumultX"]=""
        ["Shadowrocket"]=""
        ["Sing-box"]="ChinaASN GEOIPCN"
        ["Stash"]=""
        ["Surge"]=""
    )
    should_skip_rule() {
        local platform="$1" rule="$2"
        for r in ${exclude[$platform]}; do
            [[ "$rule" == "$r" ]] && return 0
        done
        return 1
    }
    for rule in "${!load_ruleA[@]}"; do
        for platform in "${!formats[@]}"; do
            should_skip_rule "$platform" "$rule" && { echo "Skipped $rule for $platform"; continue; }
            extension="${formats[$platform]}"
            output_dir="$repo_name/$platform/Ruleset"
            output_file="$output_dir/$rule.$extension"
            url="https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/${load_ruleA[$rule]}"
            download "$output_file" "$url"
        done
    done
    echo "$repo_name Repository: All Ruleset Processed!"

else
    echo "Unknown Repository: $repo_name"
    echo "Please Execute in Scripts Repository or Matrix-io Repository."
    exit 1
fi