#!/bin/bash

# get README content
readme=$(cat README.md)
#split content into readme and list of implementations in description
desc_list="${readme#*'Existing fizzbuzz implementations:'}"
readme="${readme%$desc_list}"

# rebuild description list
desc_list=""
for dir in ./*/
do
    if [[ ! -f "$dir/README.md" ]]; then
        continue
    fi
    title=$(head -n 1 $dir/README.md)
    description=$(cat $dir/README.md | grep -zoP '(?<=## Description)(?s).*(?=## Instructions)')
    
    if [[ $desc_list != *"##$title"* ]]; then
        desc_list+="

##$title$description"
        continue
    fi
done
echo "$readme$desc_list" > README.md