for i in $(cat all-sample-IDs.txt)
do
    grep -m 1 "${i}" hmp_manifest_52abb72a95.tsv | cut -f 4 | sed 's/^.*\/SRS/SRS/' | cut -f 1 -d "."

done > all-SRS-IDs.txt
