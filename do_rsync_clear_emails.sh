MISSING_STATUS=`cat check_missing_status.txt`

if [ $MISSING_STATUS = ALL_FILES ]; then

    at 06:05 < do_rsync.sh
    echo "echo \"All data in the data directory has been tranferred to Ozstar\" >> status.txt" | at 06:19
    at 06:20 < clear_data.sh
    echo "echo \"All data in the data data directory has been cleared. Ready for a new day of data!\" >> status.txt" | at 06:21
    echo "echo \" \" >> status.txt" | at 06:21
    echo "echo \"See you tomorrow!\" >> status.txt" | at 06:21
    echo "echo \"Cheers, \" >> status.txt" | at 06:21
    echo "echo \" \" >> status.txt" | at 06:21
    echo "echo \"Reference Pi \:\) \" >> status.txt" | at 06:21

    at 06:25 < email_aman.sh

elif [ $MISSING_STATUS = MISSING_FILES ]; then
    
    at 06:05 < do_rsync.sh
    echo "echo \"All data in the data directory has been tranferred to Ozstar \" >> status.txt" | at 06:19
    echo "echo \"Did not clear data. Please ssh in and see whether something went wrong yesterday!\" >> status.txt" | at 06:21
    echo "echo \" \" >> status.txt" | at 06:21
    echo "echo \"See you tomorrow!\" >> status.txt" | at 06:21
    echo "echo \"Cheers, \" >> status.txt" | at 06:21
    echo "echo \" \" >> status.txt" | at 06:21
    echo "echo \"Reference Pi \:\) \" >> status.txt" | at 06:21

    at 06:25 < email_everyone.sh

else

    echo "There are no files in the data directory. No rsync or clear_data required." >> status.txt
    echo "echo \" \" >> status.txt" | at 06:21
    echo "echo \"See you tomorrow!\" >> status.txt" | at 06:21
    echo "echo \"Cheers, \" >> status.txt" | at 06:21
    echo "echo \" \" >> status.txt" | at 06:21
    echo "echo \"Reference Pi \:\) \" >> status.txt" | at 06:21


    at 06:25 < email_aman.sh

fi

rm check_missing_status.txt
