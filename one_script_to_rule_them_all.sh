# This needs to run at 5:45AM everyday.
# Will create an at queue of 30 minute jobs from 6AM - 6AM 

echo "touch status.txt" | at 21:28
echo "This is the beginning of the status file" >> status.txt
#at 05:45 < make_night_schedule.sh 

# At 6:10AM, check to see if there are 24*2*4 files in ./data/*/*
# if there are, source do_rsync.sh then source clear_data.sh


# Else, source do_rsync.sh 
# At 6:15AM send emails. If files are missing, send mails to Jack & Nichole, otherwise, only to me
