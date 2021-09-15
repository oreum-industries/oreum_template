#!/usr/bin/env bash
# hash_verbatim_files.sh

# loops over files in local directory `verbatim`
# creates an SHA1 hash of each
# write the hashes to a local file with today's date

# today=$(date +'%Y-%m-%d-%H%M%S')
# echo "${today}"

fn="hashes_of_verbatim_files.txt"
touch $fn
echo $(date) >> "${fn}"

for f in verbatim/*; do
    [ -e "$f" ] || continue
    echo "$f"
    openssl sha1 "$f" >> "$fn"
done

echo "" >> "${fn}"

