#!/bin/bash

# 规则目录:Matrix-io
mkdir -p Matrix-io/{Clash,Egern,Loon,QuantumultX,Shadowrocket,Sing-box,Stash,Surge}/Ruleset

# 规则名称:ABC
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ABC.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ABC.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ABC.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ABC.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/ABC.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ABC.list"

# 规则名称:AMAP
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/AMAP.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AMAP.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/AMAP.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AMAP.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/AMAP.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AMAP.list"

# 规则名称:Abema
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Abema.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Abema.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Abema.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Abema.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Abema.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Abema.list"

# 规则名称:AbemaTV
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/AbemaTV.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AbemaTV.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/AbemaTV.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AbemaTV.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/AbemaTV.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AbemaTV.list"

# 规则名称:AcFun
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/AcFun.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AcFun.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/AcFun.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AcFun.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/AcFun.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AcFun.list"

# 规则名称:AdBlock
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/AdBlock.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AdBlock.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/AdBlock.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AdBlock.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/AdBlock.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AdBlock.list"

# 规则名称:Adobe
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Adobe.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Adobe.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Adobe.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Adobe.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Adobe.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Adobe.list"

# 规则名称:Advertising
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Advertising.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Advertising.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Advertising.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Advertising.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Advertising.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Advertising.list"

# 规则名称:Aixcoder
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Aixcoder.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Aixcoder.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Aixcoder.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Aixcoder.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Aixcoder.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Aixcoder.list"

# 规则名称:Akamai
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Akamai.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Akamai.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Akamai.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Akamai.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Akamai.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Akamai.list"

# 规则名称:AliPay
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/AliPay.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AliPay.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/AliPay.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AliPay.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/AliPay.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AliPay.list"

# 规则名称:Alibaba
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Alibaba.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Alibaba.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Alibaba.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Alibaba.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Alibaba.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Alibaba.list"

# 规则名称:All4
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/All4.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/All4.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/All4.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/All4.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/All4.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/All4.list"

# 规则名称:Amazon
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Amazon.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Amazon.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Amazon.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Amazon.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Amazon.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Amazon.list"

# 规则名称:AmazonCN
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/AmazonCN.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AmazonCN.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/AmazonCN.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AmazonCN.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/AmazonCN.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AmazonCN.list"

# 规则名称:AmazonIP
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/AmazonIP.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AmazonIP.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/AmazonIP.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AmazonIP.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/AmazonIP.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AmazonIP.list"

# 规则名称:Anaconda
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Anaconda.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Anaconda.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Anaconda.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Anaconda.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Anaconda.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Anaconda.list"

# 规则名称:Android
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Android.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Android.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Android.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Android.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Android.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Android.list"

# 规则名称:Aparat
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Aparat.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Aparat.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Aparat.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Aparat.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Aparat.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Aparat.list"

# 规则名称:AppStore
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/AppStore.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AppStore.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/AppStore.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AppStore.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/AppStore.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AppStore.list"

# 规则名称:Apple
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Apple.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Apple.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Apple.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Apple.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Apple.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Apple.list"

# 规则名称:AppleTV
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/AppleTV.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AppleTV.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/AppleTV.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AppleTV.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/AppleTV.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/AppleTV.list"

# 规则名称:Azure
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Azure.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Azure.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Azure.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Azure.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Azure.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Azure.list"

# 规则名称:BBC
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/BBC.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/BBC.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/BBC.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/BBC.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/BBC.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/BBC.list"

# 规则名称:BOC
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/BOC.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/BOC.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/BOC.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/BOC.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/BOC.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/BOC.list"

# 规则名称:BOCOM
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/BOCOM.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/BOCOM.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/BOCOM.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/BOCOM.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/BOCOM.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/BOCOM.list"

# 规则名称:Baidu
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Baidu.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Baidu.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Baidu.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Baidu.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Baidu.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Baidu.list"

# 规则名称:BiliBili
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/BiliBili.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/BiliBili.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/BiliBili.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/BiliBili.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/BiliBili.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/BiliBili.list"

# 规则名称:BiliBiliIntl
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/BiliBiliIntl.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/BiliBiliIntl.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/BiliBiliIntl.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/BiliBiliIntl.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/BiliBiliIntl.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/BiliBiliIntl.list"

# 规则名称:Binance
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Binance.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Binance.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Binance.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Binance.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Binance.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Binance.list"

# 规则名称:Bitauto
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Bitauto.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Bitauto.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Bitauto.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Bitauto.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Bitauto.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Bitauto.list"

# 规则名称:Blizzard
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Blizzard.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Blizzard.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Blizzard.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Blizzard.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Blizzard.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Blizzard.list"

# 规则名称:Blued
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Blued.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Blued.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Blued.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Blued.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Blued.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Blued.list"

# 规则名称:Boylove
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Boylove.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Boylove.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Boylove.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Boylove.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Boylove.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Boylove.list"

# 规则名称:ByteDance
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ByteDance.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ByteDance.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ByteDance.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ByteDance.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/ByteDance.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ByteDance.list"

# 规则名称:CCB
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/CCB.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/CCB.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/CCB.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/CCB.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/CCB.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/CCB.list"

# 规则名称:CCTV
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/CCTV.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/CCTV.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/CCTV.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/CCTV.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/CCTV.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/CCTV.list"

# 规则名称:CNCIDR
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/CNCIDR.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/CNCIDR.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/CNCIDR.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/CNCIDR.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/CNCIDR.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/CNCIDR.list"

# 规则名称:CNCIDR4
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/CNCIDR4.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/CNCIDR4.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/CNCIDR4.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/CNCIDR4.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/CNCIDR4.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/CNCIDR4.list"

# 规则名称:CNCIDR6
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/CNCIDR6.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/CNCIDR6.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/CNCIDR6.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/CNCIDR6.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/CNCIDR6.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/CNCIDR6.list"

# 规则名称:CNKI
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/CNKI.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/CNKI.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/CNKI.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/CNKI.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/CNKI.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/CNKI.list"

# 规则名称:CSDN
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/CSDN.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/CSDN.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/CSDN.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/CSDN.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/CSDN.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/CSDN.list"

# 规则名称:CaiNiao
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/CaiNiao.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/CaiNiao.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/CaiNiao.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/CaiNiao.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/CaiNiao.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/CaiNiao.list"

# 规则名称:Canon
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Canon.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Canon.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Canon.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Canon.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Canon.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Canon.list"

# 规则名称:Canonical
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Canonical.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Canonical.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Canonical.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Canonical.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Canonical.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Canonical.list"

# 规则名称:China
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/China.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/China.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/China.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/China.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/China.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/China.list"

# 规则名称:ChinaASN
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ChinaASN.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaASN.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ChinaASN.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaASN.list"
done
# curl -L -o Matrix-io-repo/Sing-box/Ruleset/ChinaASN.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaASN.list"

# 规则名称:ChinaIPBGP
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ChinaIPBGP.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaIPBGP.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ChinaIPBGP.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaIPBGP.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/ChinaIPBGP.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaIPBGP.list"

# 规则名称:ChinaIPMax
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ChinaIPMax.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaIPMax.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ChinaIPMax.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaIPMax.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/ChinaIPMax.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaIPMax.list"

# 规则名称:ChinaIPv4
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ChinaIPv4.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaIPv4.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ChinaIPv4.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaIPv4.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/ChinaIPv4.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaIPv4.list"

# 规则名称:ChinaIPv6
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ChinaIPv6.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaIPv6.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ChinaIPv6.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaIPv6.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/ChinaIPv6.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaIPv6.list"

# 规则名称:ChinaMax
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ChinaMax.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaMax.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ChinaMax.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaMax.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/ChinaMax.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaMax.list"

# 规则名称:ChinaMedia
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ChinaMedia.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaMedia.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ChinaMedia.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaMedia.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/ChinaMedia.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaMedia.list"

# 规则名称:ChinaMobile
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ChinaMobile.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaMobile.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ChinaMobile.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaMobile.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/ChinaMobile.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaMobile.list"

# 规则名称:ChinaTelecom
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ChinaTelecom.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaTelecom.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ChinaTelecom.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaTelecom.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/ChinaTelecom.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaTelecom.list"

# 规则名称:ChinaUnicom
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ChinaUnicom.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaUnicom.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ChinaUnicom.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaUnicom.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/ChinaUnicom.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ChinaUnicom.list"

# 规则名称:Claude
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Claude.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Claude.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Claude.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Claude.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Claude.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Claude.list"

# 规则名称:Cloudcone
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Cloudcone.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Cloudcone.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Cloudcone.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Cloudcone.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Cloudcone.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Cloudcone.list"

# 规则名称:Cloudflare
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Cloudflare.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Cloudflare.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Cloudflare.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Cloudflare.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Cloudflare.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Cloudflare.list"

# 规则名称:Coinone
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Coinone.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Coinone.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Coinone.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Coinone.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Coinone.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Coinone.list"

# 规则名称:Collabora
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Collabora.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Collabora.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Collabora.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Collabora.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Collabora.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Collabora.list"

# 规则名称:Comodo
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Comodo.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Comodo.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Comodo.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Comodo.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Comodo.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Comodo.list"

# 规则名称:Coolapk
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Coolapk.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Coolapk.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Coolapk.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Coolapk.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Coolapk.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Coolapk.list"

# 规则名称:Copilot
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Copilot.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Copilot.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Copilot.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Copilot.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Copilot.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Copilot.list"

# 规则名称:Ctexcel
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Ctexcel.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Ctexcel.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Ctexcel.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Ctexcel.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Ctexcel.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Ctexcel.list"

# 规则名称:DAZN
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/DAZN.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/DAZN.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/DAZN.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/DAZN.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/DAZN.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/DAZN.list"

# 规则名称:DIRECT
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/DIRECT.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/DIRECT.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/DIRECT.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/DIRECT.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/DIRECT.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/DIRECT.list"

# 规则名称:DMM
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/DMM.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/DMM.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/DMM.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/DMM.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/DMM.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/DMM.list"

# 规则名称:DNSPod
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/DNSPod.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/DNSPod.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/DNSPod.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/DNSPod.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/DNSPod.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/DNSPod.list"

# 规则名称:Dcard
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Dcard.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Dcard.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Dcard.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Dcard.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Dcard.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Dcard.list"

# 规则名称:Deezer
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Deezer.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Deezer.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Deezer.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Deezer.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Deezer.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Deezer.list"

# 规则名称:Developer
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Developer.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Developer.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Developer.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Developer.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Developer.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Developer.list"

# 规则名称:Discord
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Discord.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Discord.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Discord.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Discord.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Discord.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Discord.list"

# 规则名称:Discovery
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Discovery.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Discovery.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Discovery.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Discovery.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Discovery.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Discovery.list"

# 规则名称:Discuz
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Discuz.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Discuz.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Discuz.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Discuz.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Discuz.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Discuz.list"

# 规则名称:Disney
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Disney.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Disney.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Disney.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Disney.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Disney.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Disney.list"

# 规则名称:Docker
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Docker.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Docker.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Docker.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Docker.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Docker.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Docker.list"

# 规则名称:Domob
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Domob.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Domob.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Domob.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Domob.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Domob.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Domob.list"

# 规则名称:DouBan
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/DouBan.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/DouBan.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/DouBan.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/DouBan.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/DouBan.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/DouBan.list"

# 规则名称:DouYin
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/DouYin.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/DouYin.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/DouYin.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/DouYin.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/DouYin.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/DouYin.list"

# 规则名称:DouYu
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/DouYu.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/DouYu.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/DouYu.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/DouYu.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/DouYu.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/DouYu.list"

# 规则名称:Dropbox
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Dropbox.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Dropbox.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Dropbox.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Dropbox.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Dropbox.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Dropbox.list"

# 规则名称:Dubox
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Dubox.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Dubox.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Dubox.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Dubox.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Dubox.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Dubox.list"

# 规则名称:Durex
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Durex.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Durex.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Durex.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Durex.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Durex.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Durex.list"

# 规则名称:Easylist
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Easylist.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Easylist.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Easylist.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Easylist.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Easylist.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Easylist.list"

# 规则名称:Eleme
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Eleme.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Eleme.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Eleme.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Eleme.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Eleme.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Eleme.list"

# 规则名称:EncoreTVB
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/EncoreTVB.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/EncoreTVB.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/EncoreTVB.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/EncoreTVB.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/EncoreTVB.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/EncoreTVB.list"

# 规则名称:Epic
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Epic.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Epic.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Epic.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Epic.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Epic.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Epic.list"

# 规则名称:Facebook
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Facebook.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Facebook.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Facebook.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Facebook.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Facebook.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Facebook.list"

# 规则名称:FanQienovel
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/FanQienovel.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/FanQienovel.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/FanQienovel.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/FanQienovel.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/FanQienovel.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/FanQienovel.list"

# 规则名称:Fandom
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Fandom.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Fandom.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Fandom.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Fandom.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Fandom.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Fandom.list"

# 规则名称:Fedora
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Fedora.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Fedora.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Fedora.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Fedora.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Fedora.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Fedora.list"

# 规则名称:Feizhu
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Feizhu.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Feizhu.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Feizhu.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Feizhu.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Feizhu.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Feizhu.list"

# 规则名称:Fox
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Fox.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Fox.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Fox.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Fox.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Fox.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Fox.list"

# 规则名称:FoxNow
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/FoxNow.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/FoxNow.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/FoxNow.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/FoxNow.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/FoxNow.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/FoxNow.list"

# 规则名称:FoxPlus
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/FoxPlus.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/FoxPlus.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/FoxPlus.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/FoxPlus.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/FoxPlus.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/FoxPlus.list"

# 规则名称:FuboTV
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/FuboTV.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/FuboTV.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/FuboTV.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/FuboTV.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/FuboTV.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/FuboTV.list"

# 规则名称:GEOIPCN
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/GEOIPCN.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GEOIPCN.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/GEOIPCN.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GEOIPCN.list"
done
# curl -L -o Matrix-io-repo/Sing-box/Ruleset/GEOIPCN.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GEOIPCN.list"

# 规则名称:Garena
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Garena.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Garena.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Garena.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Garena.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Garena.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Garena.list"

# 规则名称:Gemini
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Gemini.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Gemini.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Gemini.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Gemini.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Gemini.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Gemini.list"

# 规则名称:GitBook
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/GitBook.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GitBook.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/GitBook.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GitBook.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/GitBook.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GitBook.list"

# 规则名称:GitHub
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/GitHub.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GitHub.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/GitHub.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GitHub.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/GitHub.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GitHub.list"

# 规则名称:GitLab
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/GitLab.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GitLab.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/GitLab.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GitLab.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/GitLab.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GitLab.list"

# 规则名称:Global
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Global.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Global.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Global.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Global.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Global.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Global.list"

# 规则名称:GlobalMax
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/GlobalMax.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GlobalMax.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/GlobalMax.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GlobalMax.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/GlobalMax.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GlobalMax.list"

# 规则名称:GlobalMedia
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/GlobalMedia.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GlobalMedia.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/GlobalMedia.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GlobalMedia.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/GlobalMedia.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GlobalMedia.list"

# 规则名称:Google
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Google.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Google.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Google.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Google.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Google.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Google.list"

# 规则名称:GoogleCN
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/GoogleCN.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GoogleCN.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/GoogleCN.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GoogleCN.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/GoogleCN.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GoogleCN.list"

# 规则名称:GovernmentCN
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/GovernmentCN.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GovernmentCN.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/GovernmentCN.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GovernmentCN.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/GovernmentCN.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GovernmentCN.list"

# 规则名称:GreatFireWall
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/GreatFireWall.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GreatFireWall.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/GreatFireWall.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GreatFireWall.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/GreatFireWall.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/GreatFireWall.list"

# 规则名称:Gucci
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Gucci.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Gucci.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Gucci.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Gucci.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Gucci.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Gucci.list"

# 规则名称:HBO
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/HBO.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HBO.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/HBO.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HBO.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/HBO.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HBO.list"

# 规则名称:HBOAsia
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/HBOAsia.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HBOAsia.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/HBOAsia.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HBOAsia.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/HBOAsia.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HBOAsia.list"

# 规则名称:HKBN
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/HKBN.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HKBN.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/HKBN.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HKBN.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/HKBN.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HKBN.list"

# 规则名称:HKT
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/HKT.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HKT.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/HKT.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HKT.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/HKT.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HKT.list"

# 规则名称:HMTMedia
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/HMTMedia.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HMTMedia.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/HMTMedia.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HMTMedia.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/HMTMedia.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HMTMedia.list"

# 规则名称:HWTV
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/HWTV.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HWTV.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/HWTV.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HWTV.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/HWTV.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HWTV.list"

# 规则名称:HamiVideo
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/HamiVideo.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HamiVideo.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/HamiVideo.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HamiVideo.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/HamiVideo.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HamiVideo.list"

# 规则名称:Hema
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Hema.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Hema.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Hema.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Hema.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Hema.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Hema.list"

# 规则名称:Heroku
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Heroku.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Heroku.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Heroku.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Heroku.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Heroku.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Heroku.list"

# 规则名称:Hetzner
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Hetzner.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Hetzner.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Hetzner.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Hetzner.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Hetzner.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Hetzner.list"

# 规则名称:Hinet
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Hinet.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Hinet.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Hinet.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Hinet.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Hinet.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Hinet.list"

# 规则名称:HuYa
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/HuYa.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HuYa.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/HuYa.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HuYa.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/HuYa.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HuYa.list"

# 规则名称:Huawei
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Huawei.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Huawei.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Huawei.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Huawei.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Huawei.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Huawei.list"

# 规则名称:Hulu
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Hulu.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Hulu.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Hulu.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Hulu.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Hulu.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Hulu.list"

# 规则名称:HuluJP
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/HuluJP.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HuluJP.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/HuluJP.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HuluJP.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/HuluJP.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/HuluJP.list"

# 规则名称:Huobi
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Huobi.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Huobi.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Huobi.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Huobi.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Huobi.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Huobi.list"

# 规则名称:Hupu
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Hupu.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Hupu.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Hupu.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Hupu.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Hupu.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Hupu.list"

# 规则名称:IBM
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/IBM.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/IBM.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/IBM.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/IBM.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/IBM.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/IBM.list"

# 规则名称:ICBC
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ICBC.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ICBC.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ICBC.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ICBC.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/ICBC.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ICBC.list"

# 规则名称:ICloud
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ICloud.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ICloud.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ICloud.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ICloud.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/ICloud.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ICloud.list"

# 规则名称:IFLYTEK
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/IFLYTEK.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/IFLYTEK.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/IFLYTEK.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/IFLYTEK.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/IFLYTEK.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/IFLYTEK.list"

# 规则名称:IMDB
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/IMDB.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/IMDB.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/IMDB.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/IMDB.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/IMDB.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/IMDB.list"

# 规则名称:IQiYi
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/IQiYi.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/IQiYi.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/IQiYi.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/IQiYi.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/IQiYi.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/IQiYi.list"

# 规则名称:IQiYiIntl
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/IQiYiIntl.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/IQiYiIntl.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/IQiYiIntl.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/IQiYiIntl.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/IQiYiIntl.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/IQiYiIntl.list"

# 规则名称:ITV
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ITV.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ITV.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ITV.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ITV.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/ITV.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ITV.list"

# 规则名称:JOOX
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/JOOX.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/JOOX.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/JOOX.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/JOOX.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/JOOX.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/JOOX.list"

# 规则名称:Japonx
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Japonx.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Japonx.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Japonx.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Japonx.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Japonx.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Japonx.list"

# 规则名称:KKBOX
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/KKBOX.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/KKBOX.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/KKBOX.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/KKBOX.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/KKBOX.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/KKBOX.list"

# 规则名称:KKTV
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/KKTV.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/KKTV.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/KKTV.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/KKTV.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/KKTV.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/KKTV.list"

# 规则名称:KakaoTalk
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/KakaoTalk.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/KakaoTalk.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/KakaoTalk.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/KakaoTalk.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/KakaoTalk.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/KakaoTalk.list"

# 规则名称:Keep
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Keep.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Keep.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Keep.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Keep.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Keep.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Keep.list"

# 规则名称:Kugou
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Kugou.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Kugou.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Kugou.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Kugou.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Kugou.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Kugou.list"

# 规则名称:Kuwo
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Kuwo.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Kuwo.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Kuwo.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Kuwo.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Kuwo.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Kuwo.list"

# 规则名称:LAN
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/LAN.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/LAN.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/LAN.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/LAN.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/LAN.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/LAN.list"

# 规则名称:LZY
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/LZY.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/LZY.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/LZY.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/LZY.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/LZY.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/LZY.list"

# 规则名称:Landian
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Landian.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Landian.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Landian.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Landian.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Landian.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Landian.list"

# 规则名称:Lanzou
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Lanzou.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Lanzou.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Lanzou.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Lanzou.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Lanzou.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Lanzou.list"

# 规则名称:Lenovo
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Lenovo.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Lenovo.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Lenovo.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Lenovo.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Lenovo.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Lenovo.list"

# 规则名称:LeTV
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/LeTV.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/LeTV.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/LeTV.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/LeTV.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/LeTV.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/LeTV.list"

# 规则名称:LiTV
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/LiTV.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/LiTV.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/LiTV.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/LiTV.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/LiTV.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/LiTV.list"

# 规则名称:Line
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Line.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Line.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Line.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Line.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Line.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Line.list"

# 规则名称:LineTV
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/LineTV.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/LineTV.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/LineTV.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/LineTV.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/LineTV.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/LineTV.list"

# 规则名称:Linkedin
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Linkedin.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Linkedin.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Linkedin.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Linkedin.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Linkedin.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Linkedin.list"

# 规则名称:MGTV
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/MGTV.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/MGTV.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/MGTV.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/MGTV.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/MGTV.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/MGTV.list"

# 规则名称:MIUI
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/MIUI.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/MIUI.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/MIUI.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/MIUI.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/MIUI.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/MIUI.list"

# 规则名称:Maocloud
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Maocloud.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Maocloud.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Maocloud.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Maocloud.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Maocloud.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Maocloud.list"

# 规则名称:Matrix
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Matrix.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Matrix.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Matrix.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Matrix.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Matrix.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Matrix.list"

# 规则名称:MeiTuan
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/MeiTuan.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/MeiTuan.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/MeiTuan.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/MeiTuan.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/MeiTuan.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/MeiTuan.list"

# 规则名称:Meizu
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Meizu.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Meizu.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Meizu.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Meizu.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Meizu.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Meizu.list"

# 规则名称:Metart
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Metart.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Metart.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Metart.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Metart.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Metart.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Metart.list"

# 规则名称:MiGu
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/MiGu.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/MiGu.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/MiGu.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/MiGu.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/MiGu.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/MiGu.list"

# 规则名称:Microsoft
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Microsoft.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Microsoft.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Microsoft.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Microsoft.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Microsoft.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Microsoft.list"

# 规则名称:Mozilla
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Mozilla.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Mozilla.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Mozilla.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Mozilla.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Mozilla.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Mozilla.list"

# 规则名称:My5
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/My5.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/My5.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/My5.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/My5.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/My5.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/My5.list"

# 规则名称:MyTVSuper
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/MyTVSuper.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/MyTVSuper.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/MyTVSuper.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/MyTVSuper.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/MyTVSuper.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/MyTVSuper.list"

# 规则名称:NGAA
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/NGAA.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NGAA.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/NGAA.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NGAA.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/NGAA.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NGAA.list"

# 规则名称:NVIDIA
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/NVIDIA.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NVIDIA.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/NVIDIA.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NVIDIA.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/NVIDIA.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NVIDIA.list"

# 规则名称:NaSDDNS
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/NaSDDNS.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NaSDDNS.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/NaSDDNS.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NaSDDNS.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/NaSDDNS.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NaSDDNS.list"

# 规则名称:Naver
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Naver.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Naver.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Naver.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Naver.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Naver.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Naver.list"

# 规则名称:NaverTV
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/NaverTV.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NaverTV.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/NaverTV.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NaverTV.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/NaverTV.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NaverTV.list"

# 规则名称:NetEase
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/NetEase.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NetEase.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/NetEase.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NetEase.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/NetEase.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NetEase.list"

# 规则名称:NetEaseMusic
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/NetEaseMusic.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NetEaseMusic.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/NetEaseMusic.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NetEaseMusic.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/NetEaseMusic.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NetEaseMusic.list"

# 规则名称:Netflix
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Netflix.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Netflix.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Netflix.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Netflix.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Netflix.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Netflix.list"

# 规则名称:NetflixIP
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/NetflixIP.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NetflixIP.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/NetflixIP.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NetflixIP.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/NetflixIP.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NetflixIP.list"

# 规则名称:Nexon
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Nexon.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Nexon.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Nexon.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Nexon.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Nexon.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Nexon.list"

# 规则名称:Niconico
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Niconico.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Niconico.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Niconico.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Niconico.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Niconico.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Niconico.list"

# 规则名称:Nintendo
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Nintendo.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Nintendo.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Nintendo.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Nintendo.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Nintendo.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Nintendo.list"

# 规则名称:NivodTV
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/NivodTV.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NivodTV.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/NivodTV.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NivodTV.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/NivodTV.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NivodTV.list"

# 规则名称:Notion
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Notion.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Notion.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Notion.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Notion.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Notion.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Notion.list"

# 规则名称:NowE
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/NowE.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NowE.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/NowE.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NowE.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/NowE.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/NowE.list"

# 规则名称:OKX
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/OKX.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/OKX.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/OKX.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/OKX.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/OKX.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/OKX.list"

# 规则名称:OPPO
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/OPPO.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/OPPO.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/OPPO.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/OPPO.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/OPPO.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/OPPO.list"

# 规则名称:Olevod
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Olevod.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Olevod.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Olevod.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Olevod.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Olevod.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Olevod.list"

# 规则名称:Onedrive
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Onedrive.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Onedrive.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Onedrive.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Onedrive.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Onedrive.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Onedrive.list"

# 规则名称:OpenAI
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/OpenAI.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/OpenAI.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/OpenAI.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/OpenAI.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/OpenAI.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/OpenAI.list"

# 规则名称:Opera
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Opera.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Opera.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Opera.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Opera.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Opera.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Opera.list"

# 规则名称:Oracle
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Oracle.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Oracle.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Oracle.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Oracle.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Oracle.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Oracle.list"

# 规则名称:Oreilly
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Oreilly.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Oreilly.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Oreilly.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Oreilly.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Oreilly.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Oreilly.list"

# 规则名称:PDD
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/PDD.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PDD.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/PDD.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PDD.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/PDD.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PDD.list"

# 规则名称:PPTV
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/PPTV.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PPTV.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/PPTV.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PPTV.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/PPTV.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PPTV.list"

# 规则名称:PPX
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/PPX.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PPX.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/PPX.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PPX.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/PPX.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PPX.list"

# 规则名称:PROXY
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/PROXY.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PROXY.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/PROXY.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PROXY.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/PROXY.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PROXY.list"

# 规则名称:Pandora
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Pandora.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Pandora.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Pandora.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Pandora.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Pandora.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Pandora.list"

# 规则名称:PandoraTV
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/PandoraTV.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PandoraTV.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/PandoraTV.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PandoraTV.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/PandoraTV.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PandoraTV.list"

# 规则名称:Paramount
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Paramount.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Paramount.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Paramount.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Paramount.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Paramount.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Paramount.list"

# 规则名称:Patreon
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Patreon.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Patreon.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Patreon.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Patreon.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Patreon.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Patreon.list"

# 规则名称:PayPal
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/PayPal.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PayPal.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/PayPal.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PayPal.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/PayPal.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PayPal.list"

# 规则名称:Peacock
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Peacock.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Peacock.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Peacock.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Peacock.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Peacock.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Peacock.list"

# 规则名称:Picsee
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Picsee.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Picsee.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Picsee.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Picsee.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Picsee.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Picsee.list"

# 规则名称:PikPak
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/PikPak.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PikPak.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/PikPak.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PikPak.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/PikPak.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PikPak.list"

# 规则名称:Pinterest
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Pinterest.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Pinterest.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Pinterest.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Pinterest.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Pinterest.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Pinterest.list"

# 规则名称:Pixiv
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Pixiv.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Pixiv.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Pixiv.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Pixiv.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Pixiv.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Pixiv.list"

# 规则名称:Pixnet
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Pixnet.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Pixnet.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Pixnet.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Pixnet.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Pixnet.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Pixnet.list"

# 规则名称:PornHub
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/PornHub.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PornHub.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/PornHub.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PornHub.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/PornHub.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PornHub.list"

# 规则名称:PrimeVideo
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/PrimeVideo.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PrimeVideo.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/PrimeVideo.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PrimeVideo.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/PrimeVideo.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/PrimeVideo.list"

# 规则名称:Privacy
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Privacy.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Privacy.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Privacy.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Privacy.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Privacy.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Privacy.list"

# 规则名称:Protonmail
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Protonmail.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Protonmail.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Protonmail.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Protonmail.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Protonmail.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Protonmail.list"

# 规则名称:Python
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Python.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Python.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Python.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Python.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Python.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Python.list"

# 规则名称:QQ
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/QQ.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/QQ.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/QQ.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/QQ.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/QQ.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/QQ.list"

# 规则名称:QQMusic
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/QQMusic.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/QQMusic.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/QQMusic.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/QQMusic.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/QQMusic.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/QQMusic.list"

# 规则名称:Qcloud
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Qcloud.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Qcloud.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Qcloud.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Qcloud.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Qcloud.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Qcloud.list"

# 规则名称:Qobuz
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Qobuz.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Qobuz.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Qobuz.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Qobuz.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Qobuz.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Qobuz.list"

# 规则名称:Qualcomm
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Qualcomm.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Qualcomm.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Qualcomm.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Qualcomm.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Qualcomm.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Qualcomm.list"

# 规则名称:Quark
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Quark.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Quark.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Quark.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Quark.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Quark.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Quark.list"

# 规则名称:Quora
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Quora.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Quora.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Quora.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Quora.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Quora.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Quora.list"

# 规则名称:REJECT
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/REJECT.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/REJECT.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/REJECT.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/REJECT.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/REJECT.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/REJECT.list"

# 规则名称:RTHK
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/RTHK.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/RTHK.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/RTHK.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/RTHK.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/RTHK.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/RTHK.list"

# 规则名称:Rakuten
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Rakuten.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Rakuten.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Rakuten.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Rakuten.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Rakuten.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Rakuten.list"

# 规则名称:Razer
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Razer.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Razer.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Razer.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Razer.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Razer.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Razer.list"

# 规则名称:Reabble
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Reabble.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Reabble.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Reabble.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Reabble.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Reabble.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Reabble.list"

# 规则名称:Realclear
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Realclear.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Realclear.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Realclear.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Realclear.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Realclear.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Realclear.list"

# 规则名称:RedBook
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/RedBook.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/RedBook.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/RedBook.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/RedBook.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/RedBook.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/RedBook.list"

# 规则名称:RedHat
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/RedHat.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/RedHat.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/RedHat.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/RedHat.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/RedHat.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/RedHat.list"

# 规则名称:Reddit
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Reddit.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Reddit.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Reddit.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Reddit.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Reddit.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Reddit.list"

# 规则名称:Redtube
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Redtube.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Redtube.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Redtube.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Redtube.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Redtube.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Redtube.list"

# 规则名称:Ruanmei
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Ruanmei.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Ruanmei.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Ruanmei.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Ruanmei.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Ruanmei.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Ruanmei.list"

# 规则名称:SINA
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/SINA.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/SINA.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/SINA.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/SINA.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/SINA.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/SINA.list"

# 规则名称:SMZDM
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/SMZDM.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/SMZDM.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/SMZDM.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/SMZDM.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/SMZDM.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/SMZDM.list"

# 规则名称:STUN
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/STUN.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/STUN.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/STUN.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/STUN.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/STUN.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/STUN.list"

# 规则名称:Scholar
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Scholar.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Scholar.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Scholar.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Scholar.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Scholar.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Scholar.list"

# 规则名称:Seasun
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Seasun.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Seasun.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Seasun.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Seasun.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Seasun.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Seasun.list"

# 规则名称:Secom
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Secom.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Secom.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Secom.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Secom.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Secom.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Secom.list"

# 规则名称:Shopee
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Shopee.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Shopee.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Shopee.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Shopee.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Shopee.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Shopee.list"

# 规则名称:Shopify
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Shopify.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Shopify.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Shopify.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Shopify.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Shopify.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Shopify.list"

# 规则名称:Slack
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Slack.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Slack.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Slack.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Slack.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Slack.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Slack.list"

# 规则名称:Snapp
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Snapp.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Snapp.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Snapp.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Snapp.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Snapp.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Snapp.list"

# 规则名称:Sogou
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Sogou.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Sogou.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Sogou.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Sogou.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Sogou.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Sogou.list"

# 规则名称:SohuVideo
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/SohuVideo.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/SohuVideo.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/SohuVideo.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/SohuVideo.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/SohuVideo.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/SohuVideo.list"

# 规则名称:SoundCloud
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/SoundCloud.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/SoundCloud.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/SoundCloud.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/SoundCloud.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/SoundCloud.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/SoundCloud.list"

# 规则名称:Spark
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Spark.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Spark.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Spark.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Spark.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Spark.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Spark.list"

# 规则名称:Speedtest
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Speedtest.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Speedtest.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Speedtest.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Speedtest.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Speedtest.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Speedtest.list"

# 规则名称:Spotify
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Spotify.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Spotify.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Spotify.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Spotify.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Spotify.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Spotify.list"

# 规则名称:Steam
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Steam.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Steam.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Steam.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Steam.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Steam.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Steam.list"

# 规则名称:SteamCN
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/SteamCN.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/SteamCN.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/SteamCN.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/SteamCN.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/SteamCN.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/SteamCN.list"

# 规则名称:Streaming
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Streaming.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Streaming.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Streaming.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Streaming.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Streaming.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Streaming.list"

# 规则名称:StreamingCN
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/StreamingCN.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/StreamingCN.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/StreamingCN.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/StreamingCN.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/StreamingCN.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/StreamingCN.list"

# 规则名称:StreamingHK
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/StreamingHK.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/StreamingHK.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/StreamingHK.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/StreamingHK.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/StreamingHK.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/StreamingHK.list"

# 规则名称:StreamingJP
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/StreamingJP.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/StreamingJP.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/StreamingJP.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/StreamingJP.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/StreamingJP.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/StreamingJP.list"

# 规则名称:StreamingSE
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/StreamingSE.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/StreamingSE.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/StreamingSE.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/StreamingSE.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/StreamingSE.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/StreamingSE.list"

# 规则名称:StreamingUS
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/StreamingUS.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/StreamingUS.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/StreamingUS.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/StreamingUS.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/StreamingUS.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/StreamingUS.list"

# 规则名称:Sumkoo
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Sumkoo.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Sumkoo.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Sumkoo.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Sumkoo.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Sumkoo.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Sumkoo.list"

# 规则名称:Supercell
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Supercell.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Supercell.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Supercell.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Supercell.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Supercell.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Supercell.list"

# 规则名称:TCL
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/TCL.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TCL.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/TCL.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TCL.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/TCL.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TCL.list"

# 规则名称:TIDAL
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/TIDAL.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TIDAL.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/TIDAL.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TIDAL.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/TIDAL.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TIDAL.list"

# 规则名称:TVB
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/TVB.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TVB.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/TVB.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TVB.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/TVB.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TVB.list"

# 规则名称:TVer
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/TVer.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TVer.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/TVer.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TVer.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/TVer.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TVer.list"

# 规则名称:TaiwanGood
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/TaiwanGood.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TaiwanGood.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/TaiwanGood.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TaiwanGood.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/TaiwanGood.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TaiwanGood.list"

# 规则名称:TapTap
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/TapTap.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TapTap.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/TapTap.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TapTap.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/TapTap.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TapTap.list"

# 规则名称:TeamViewer
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/TeamViewer.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TeamViewer.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/TeamViewer.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TeamViewer.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/TeamViewer.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TeamViewer.list"

# 规则名称:Telegram
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Telegram.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Telegram.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Telegram.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Telegram.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Telegram.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Telegram.list"

# 规则名称:Telekom
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Telekom.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Telekom.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Telekom.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Telekom.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Telekom.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Telekom.list"

# 规则名称:Tencent
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Tencent.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Tencent.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Tencent.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Tencent.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Tencent.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Tencent.list"

# 规则名称:TencentVideo
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/TencentVideo.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TencentVideo.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/TencentVideo.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TencentVideo.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/TencentVideo.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TencentVideo.list"

# 规则名称:Tendcloud
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Tendcloud.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Tendcloud.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Tendcloud.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Tendcloud.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Tendcloud.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Tendcloud.list"

# 规则名称:TeraBox
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/TeraBox.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TeraBox.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/TeraBox.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TeraBox.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/TeraBox.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TeraBox.list"

# 规则名称:Termux
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Termux.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Termux.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Termux.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Termux.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Termux.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Termux.list"

# 规则名称:TikTok
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/TikTok.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TikTok.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/TikTok.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TikTok.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/TikTok.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TikTok.list"

# 规则名称:Tld-CN
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Tld-CN.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Tld-CN.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Tld-CN.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Tld-CN.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Tld-CN.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Tld-CN.list"

# 规则名称:Tld-Not-CN
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Tld-Not-CN.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Tld-Not-CN.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Tld-Not-CN.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Tld-Not-CN.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Tld-Not-CN.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Tld-Not-CN.list"

# 规则名称:Tonec
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Tonec.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Tonec.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Tonec.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Tonec.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Tonec.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Tonec.list"

# 规则名称:TouTiao
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/TouTiao.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TouTiao.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/TouTiao.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TouTiao.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/TouTiao.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/TouTiao.list"

# 规则名称:Tumblr
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Tumblr.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Tumblr.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Tumblr.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Tumblr.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Tumblr.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Tumblr.list"

# 规则名称:Twitch
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Twitch.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Twitch.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Twitch.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Twitch.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Twitch.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Twitch.list"

# 规则名称:Twitter
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Twitter.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Twitter.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Twitter.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Twitter.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Twitter.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Twitter.list"

# 规则名称:Ucloud
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Ucloud.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Ucloud.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Ucloud.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Ucloud.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Ucloud.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Ucloud.list"

# 规则名称:Unbreak
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Unbreak.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Unbreak.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Unbreak.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Unbreak.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Unbreak.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Unbreak.list"

# 规则名称:V2ray
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/V2ray.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/V2ray.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/V2ray.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/V2ray.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/V2ray.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/V2ray.list"

# 规则名称:VISA
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/VISA.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/VISA.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/VISA.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/VISA.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/VISA.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/VISA.list"

# 规则名称:VIVO
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/VIVO.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/VIVO.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/VIVO.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/VIVO.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/VIVO.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/VIVO.list"

# 规则名称:Vancl
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Vancl.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Vancl.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Vancl.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Vancl.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Vancl.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Vancl.list"

# 规则名称:Vercel
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Vercel.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Vercel.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Vercel.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Vercel.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Vercel.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Vercel.list"

# 规则名称:Verizon
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Verizon.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Verizon.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Verizon.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Verizon.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Verizon.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Verizon.list"

# 规则名称:ViuTV
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ViuTV.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ViuTV.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/ViuTV.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ViuTV.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/ViuTV.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ViuTV.list"

# 规则名称:WeChat
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/WeChat.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/WeChat.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/WeChat.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/WeChat.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/WeChat.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/WeChat.list"

# 规则名称:WeTV
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/WeTV.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/WeTV.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/WeTV.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/WeTV.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/WeTV.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/WeTV.list"

# 规则名称:Webex
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Webex.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Webex.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Webex.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Webex.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Webex.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Webex.list"

# 规则名称:WeiBo
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/WeiBo.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/WeiBo.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/WeiBo.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/WeiBo.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/WeiBo.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/WeiBo.list"

# 规则名称:WhatsApp
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/WhatsApp.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/WhatsApp.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/WhatsApp.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/WhatsApp.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/WhatsApp.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/WhatsApp.list"

# 规则名称:Wikimedia
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Wikimedia.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Wikimedia.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Wikimedia.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Wikimedia.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Wikimedia.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Wikimedia.list"

# 规则名称:Wikipedia
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Wikipedia.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Wikipedia.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Wikipedia.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Wikipedia.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Wikipedia.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Wikipedia.list"

# 规则名称:XianYu
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/XianYu.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/XianYu.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/XianYu.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/XianYu.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/XianYu.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/XianYu.list"

# 规则名称:Xiaomi
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Xiaomi.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Xiaomi.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Xiaomi.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Xiaomi.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Xiaomi.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Xiaomi.list"

# 规则名称:Ximalaya
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Ximalaya.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Ximalaya.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Ximalaya.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Ximalaya.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Ximalaya.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Ximalaya.list"

# 规则名称:Xunlei
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Xunlei.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Xunlei.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Xunlei.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Xunlei.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Xunlei.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Xunlei.list"

# 规则名称:YYeTs
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/YYeTs.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/YYeTs.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/YYeTs.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/YYeTs.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/YYeTs.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/YYeTs.list"

# 规则名称:Yahoo
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Yahoo.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Yahoo.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Yahoo.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Yahoo.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Yahoo.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Yahoo.list"

# 规则名称:Yandex
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Yandex.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Yandex.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Yandex.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Yandex.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Yandex.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Yandex.list"

# 规则名称:YouTube
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/YouTube.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/YouTube.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/YouTube.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/YouTube.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/YouTube.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/YouTube.list"

# 规则名称:Youku
for dir in Clash Egern Stash; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Youku.yaml "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Youku.list"
done
for dir in Loon QuantumultX Shadowrocket Surge; do
    curl -L -o Matrix-io-repo/$dir/Ruleset/Youku.list "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Youku.list"
done
curl -L -o Matrix-io-repo/Sing-box/Ruleset/Youku.json "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/Youku.list"