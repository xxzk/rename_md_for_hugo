#!/bin/bash

file_path=$(find ./content/ -mindepth 1 -type f -name '*.md' | cut -d '/' -f 5 --complement)

for i in ${file_path};
do

file_name=$(echo -n ${i} | cut -d '/' -f 4)
match_path=$(find ${i} -type f -name "${file_name}.md")
dir_path=$(echo -n "${match_path}" | cut -d '/' -f 5 --complement)

#echo ${file_name}
#echo ${match_path}
#echo ${dir_path}

# 如果同個目錄內有檔名與資料夾名稱不同的 .md 存在則 dir_path 會變空字串，就不執行 mv (rename)
[[ "${dir_path}" != '' ]] && mv ${match_path} "${dir_path}/index.md"

done