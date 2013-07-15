#!/usr/bin/env bash
while read sum path; do
    dir=${path%-*}
    file=${path%%.tar*}
    file=${file##*-}
    mkdir $dir
    echo "checksum=$sum" > $dir/$file.opm
    url=$(grep $path wget-list)
    echo "sources=( $url )" > $dir/base.opm
done < md5sums
