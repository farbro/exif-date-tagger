#!/bin/bash

target=${1:-.}
tagFormat="+${2:-%Y-%m %f}"
name=$(basename "$(readlink -f "${target}")")

min=$(date +%s)

#Retrieve first photo
IFS=$'\n'
for filename in $(find $target ! -path $target -type f)  ; do
  dateTaken=$(exiftool -CreateDate -S -s -d "%Y-%m-%d %H:%M:%S" "$filename")
  epoch="$(date -d "$dateTaken" +%s)"
  re='^[0-9]+$' 
  [[ $epoch =~ $re ]] && (( "$epoch" < "$min" )) && min=$epoch && hastag=true

done

#move directory
if [[ $hastag = true ]] ; then 
  to=$(date -d @$min ${tagFormat//\%f/$name})
  mv "$target" "$to"
  printf ""$target" -> "$to"\n"
fi

 # mv files
