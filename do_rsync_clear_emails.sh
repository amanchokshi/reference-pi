MISSING_STATUS=`cat check_missing_status.txt`

if [ $MISSING_STATUS = ALL_FILES ]; then

    at 06:07 < do_rsync.sh
    echo "echo /"All data in the data directory has been tranferred to Ozstar /" >> status.txt" | at 06:15
    at 06:15 < clear_data.sh
    echo "echo /"All data in the data data directory has been cleared. Ready for a new day of data!/" >> status.txt" | at 06:16
    at 06:20 < email_aman.sh

elif [ $MISSING_STATUS = MISSING_FILES ]; then
    
    at 06:07 < do_rsync.sh
    echo "echo /"All data in the data directory has been tranferred to Ozstar /" >> status.txt" | at 06:15
    echo "echo /"Did not clear data. Please ssh in and see whether something went wrong yesterday! /" >> status.txt" | at 06:16
    at 06:20 < email_everyone.sh

else

    echo "There are no files in the data directory. No rsync or clear_data required." >> status.txt
    at 06:20 < email_aman.sh

fi

rm check_missing_status.txt
