#!/bin/bash

# 创建一个目录用于存放下载的zip文件和解压后的内容
mkdir -p downloaded_zips

# 读取in.txt文件中的每个URL
while IFS= read -r url; do
    # 提取文件名
    filename=$(basename "$url")
    
    # 下载文件
    curl -L -o "downloaded_zips/$filename" "$url"
    
    # 解压文件
    unzip -o "downloaded_zips/$filename" -d "downloaded_zips"
    
    # 删除下载的zip文件，如果不需要保留
    rm "downloaded_zips/$filename"
    
    echo "Downloaded and extracted: $filename"
done < output.txt

echo "All files have been downloaded and extracted."
