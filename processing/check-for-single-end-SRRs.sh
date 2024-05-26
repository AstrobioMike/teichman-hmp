for i in $(cut -f 2 ${1})
do
    library=$(grep -w "${i}" all-bioproject-metadata.tsv | cut -f 12)
    if [ "${library}" == "SINGLE" ]; then
        grep -v "${i}" ${1} > temp.tsv && mv temp.tsv ${1}
        log_file=$(echo ${1} | cut -f 1 -d "." | sed 's/$/-removed.txt/')
        printf "${i}\n" >> ${log_file}
    fi

done
