# This needs to run at 5:45AM everyday.
# Will create an at queue of 30 minute jobs from 6AM - 6AM 

echo "touch status.txt" | at 05:40
echo "printf \"Good morning Aman, Jack, Nichole!\n \nIt is 5:40AM and I've woken up to schedule a new day of jobs. \n \" >> status.txt" | at 05:40
at 05:45 < make_night_schedule.sh 

# At 6:10AM, check to see if there are 24*2*4 files in ./data/*/*
# if there are, source do_rsync.sh then source clear_data.sh

echo "echo \"It is 6:10AM. Starting to check for missing data files from the last 24 hours.\" >> status.txt" | at 06:10
at 06:10 < check_missing.sh

# Else, source do_rsync.sh 
# At 6:15AM send emails. If files are missing, send mails to Jack & Nichole, otherwise, only to me

at 6:15 < email.sh
echo "rm status.txt" | at 06:20
