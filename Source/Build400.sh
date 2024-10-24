#!/bin/bash

# 创建规则目录: Matrix-io
mkdir -p Matrix-io/{Clash,Egern,Loon,QuantumultX,Shadowrocket,Sing-box,Stash,Surge}/Ruleset

# 规则名称: ABC
for dir in Clash Egern Loon QuantumultX Shadowrocket Sing-box Stash Surge; do
    if [[ $dir == "Clash" || $dir == "Egern" || $dir == "Stash" ]]; then
        file_ext="ABC.yaml"
    elif [[ $dir == "Sing-box" ]]; then
        file_ext="ABC.json"
    else
        file_ext="ABC.list"
    fi
    curl -L -o Matrix-io/$dir/Ruleset/$file_ext "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/ABC.list"
done

# 规则名称: BBC
for dir in Clash Egern Loon QuantumultX Shadowrocket Sing-box Stash Surge; do
    if [[ $dir == "Clash" || $dir == "Egern" || $dir == "Stash" ]]; then
        file_ext="BBC.yaml"
    elif [[ $dir == "Sing-box" ]]; then
        file_ext="BBC.json"
    else
        file_ext="BBC.list"
    fi
    curl -L -o Matrix-io/$dir/Ruleset/$file_ext "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/BBC.list"
done

# 规则名称: CCB
for dir in Clash Egern Loon QuantumultX Shadowrocket Sing-box Stash Surge; do
    if [[ $dir == "Clash" || $dir == "Egern" || $dir == "Stash" ]]; then
        file_ext="CCB.yaml"
    elif [[ $dir == "Sing-box" ]]; then
        file_ext="CCB.json"
    else
        file_ext="CCB.list"
    fi
    curl -L -o Matrix-io/$dir/Ruleset/$file_ext "https://raw.githubusercontent.com/Centralmatrix3/Scripts/master/Ruleset/CCB.list"
done