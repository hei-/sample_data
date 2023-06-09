#!/bin/bash

CURRENT_DIR=$(cd $(dirname $0); pwd)
PARENT_DIR=$(cd $(dirname $0);cd ..; pwd)

year=2006
month=1

# download
wget --no-check-certificate "https://transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_${year}_${month}.zip"
unzip On_Time_*_${year}_${month}.zip

# gen data
arr=( "11" "10001" "100001" )

for n in "${arr[@]}"
do
    rm  ${PARENT_DIR}/data/ontime_${year}_${n}.csv
    head -n${n} On_Time_*_${year}_${month}.csv >> ${PARENT_DIR}/data/ontime_${year}_${n}.csv
done

du -sh ${PARENT_DIR}/data/ontime_${year}_*

# clean
rm On_Time_*_${year}_${month}.*
rm readme.html  