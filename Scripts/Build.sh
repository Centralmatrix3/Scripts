#!/usr/bin/env bash

set -euo pipefail

repository="$(basename "$GITHUB_REPOSITORY")"
download() {
    local output_file="$1"
    shift
    : > "$output_file"
    for source_url in "$@"; do
        curl -fsSL --retry 3 --retry-delay 2 "$source_url" >> "$output_file" || { echo "Download Failed: $source_url"; exit 1; }
        echo "Processed (Download): $source_url -> $output_file"
        echo >> "$output_file"
    done
}
copyfile() {
    local source_file="$1"
    local output_file="$2"
    cp "$source_file" "$output_file" || { echo "Copy Failed: $source_file"; exit 1; }
    echo "Processed (Copy): $source_file -> $output_file"
}

if [[ "$repository" == "Scripts" ]]; then
    echo "Execute in $repository Repository"
    rule_dirs=("Ruleset" "QuantumultX/Ruleset" "Stash/Ruleset" "Surge/Ruleset")
    for rule_path in "${rule_dirs[@]}"; do
        mkdir -p "$repository/$rule_path"
    done
    declare -A merge_rule=(
        ["$repository/Ruleset/AdBlockLite.list"]="AdBlockLite"
        ["$repository/Ruleset/Global.list"]="Global"
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
    for output_file in "${!merge_rule[@]}"; do
        declare -n ref="${merge_rule[$output_file]}"
        download "$output_file" "${ref[@]}"
    done
    declare -A alone_rule=(
        ["$repository/Ruleset/AdBlock.list"]="https://raw.githubusercontent.com/privacy-protection-tools/anti-AD/master/anti-ad-surge.txt"
        ["$repository/Ruleset/AdGuardBlock.list"]="https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/AdGuardSDNSFilter/AdGuardSDNSFilter.list"
        ["$repository/Ruleset/Advertising.list"]="https://raw.githubusercontent.com/Cats-Team/AdRules/main/adrules.list"
        ["$repository/Ruleset/Alibaba.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Alibaba.list"
        ["$repository/Ruleset/Amazon.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Amazon.list"
        ["$repository/Ruleset/AmazonIP.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/AmazonIp.list"
        ["$repository/Ruleset/Apple.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Apple.list"
        ["$repository/Ruleset/Baidu.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Baidu.list"
        ["$repository/Ruleset/ByteDance.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/ByteDance.list"
        ["$repository/Ruleset/BiliBili.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Bilibili.list"
        ["$repository/Ruleset/CNCIDR.list"]="https://raw.githubusercontent.com/Loyalsoldier/geoip/release/text/cn.txt"
        ["$repository/Ruleset/CNCIDR4.list"]="https://raw.githubusercontent.com/Hackl0us/GeoIP2-CN/release/CN-ip-cidr.txt"
        ["$repository/Ruleset/CNCIDR6.list"]="https://raw.githubusercontent.com/Masaiki/GeoIP2-CN/release/CN-ip-cidr.txt"
        ["$repository/Ruleset/China.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ChinaDomain.list"
        ["$repository/Ruleset/ChinaASN.list"]="https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/ChinaASN/ChinaASN_Resolve.list"
        ["$repository/Ruleset/ChinaIPBGP.list"]="https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/ChinaIPsBGP/ChinaIPsBGP.list"
        ["$repository/Ruleset/ChinaIPMax.list"]="https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/ChinaIPs/ChinaIPs.list"
        ["$repository/Ruleset/ChinaIPv4.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ChinaIp.list"
        ["$repository/Ruleset/ChinaIPv6.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ChinaIpV6.list"
        ["$repository/Ruleset/ChinaMax.list"]="https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/ChinaMax/ChinaMax.list"
        ["$repository/Ruleset/ChinaMediaMax.list"]="https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/ChinaMedia/ChinaMedia.list"
        ["$repository/Ruleset/DIRECT.list"]="https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/direct.txt"
        ["$repository/Ruleset/Easylist.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanEasyList.list"
        ["$repository/Ruleset/Facebook.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Facebook.list"
        ["$repository/Ruleset/Game.list"]="https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Game/Game.list"
        ["$repository/Ruleset/GlobalMax.list"]="https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Global/Global.list"
        ["$repository/Ruleset/GlobalMediaMax.list"]="https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/GlobalMedia/GlobalMedia.list"
        ["$repository/Ruleset/Google.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Google.list"
        ["$repository/Ruleset/GreatFire.list"]="https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/greatfire.txt"
        ["$repository/Ruleset/GreatFireWall.list"]="https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/gfw.txt"
        ["$repository/Ruleset/Microsoft.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Microsoft.list"
        ["$repository/Ruleset/Netflix.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Netflix.list"
        ["$repository/Ruleset/PROXY.list"]="https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/proxy.txt"
        ["$repository/Ruleset/Privacy.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanEasyPrivacy.list"
        ["$repository/Ruleset/Private.list"]="https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/private.txt"
        ["$repository/Ruleset/PrivateTracker.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/PrivateTracker.list"
        ["$repository/Ruleset/REJECT.list"]="https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/reject.txt"
        ["$repository/Ruleset/Tld-Not-CN.list"]="https://raw.githubusercontent.com/Loyalsoldier/surge-rules/release/ruleset/tld-not-cn.txt"
        ["$repository/Ruleset/USCIDR.list"]="https://raw.githubusercontent.com/Loyalsoldier/geoip/release/text/us.txt"
        ["$repository/Ruleset/WeChat.list"]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Wechat.list"
    )
    for output_file in "${!alone_rule[@]}"; do
        download "$output_file" "${alone_rule[$output_file]}"
    done
    declare -A copy_rule=(
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
    for target_rule in "${!copy_rule[@]}"; do
        source_file="$repository/Ruleset/${copy_rule[$target_rule]}"
        source_url="https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/${copy_rule[$target_rule]}"
        for platform in "${!formats[@]}"; do
            output_file="$repository/$platform/Ruleset/$target_rule.${formats[$platform]}"
            copyfile "$source_file" "$output_file"
          # download "$output_file" "$source_url"
        done
    done
    echo "$repository Repository: All Ruleset Processed!"

elif [[ "$repository" == "Matrix-io" ]]; then
    rm -rf Scripts # Delete local Scripts directory
    git clone -q https://github.com/Centralmatrix3/Scripts.git Scripts
    echo "Execute in $repository Repository"
    rule_dirs=("Clash" "Egern" "Loon" "QuantumultX" "Shadowrocket" "Sing-box" "Stash" "Surge")
    for rule_path in "${rule_dirs[@]}"; do
        mkdir -p "$repository/$rule_path/Ruleset"
    done
    declare -A copy_rule=(
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
    skip_rule() {
        local platform="$1" rule="$2"
        for skip in ${exclude[$platform]:-}; do
            [[ "$rule" == "$skip" ]] && return 0
        done
        return 1
    }
    for target_rule in "${!copy_rule[@]}"; do
        source_file="Scripts/Ruleset/${copy_rule[$target_rule]}"
        source_url="https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/${copy_rule[$target_rule]}"
        for platform in "${!formats[@]}"; do
            skip_rule "$platform" "$target_rule" && { echo "Exclude $target_rule for $platform"; continue; }
            output_file="$repository/$platform/Ruleset/$target_rule.${formats[$platform]}"
            copyfile "$source_file" "$output_file"
          # download "$output_file" "$source_url"
        done
    done
    echo "$repository Repository: All Ruleset Processed!"

else
    echo "Execute Repository: $repository"
    echo "Please Execute in Scripts Repository or Matrix-io Repository."
    exit 1
fi