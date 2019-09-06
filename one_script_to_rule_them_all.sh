# This needs to run at 5:30AM everyday.

# Creates and begins populating the status.txt file, which will be the body of the email.
echo "touch status.txt" | at 05:40
echo "printf \"Good morning Aman, Jack, Nichole!\n \nIt is 5:40AM and I've woken up to schedule a new day of jobs. \n \" >> status.txt" | at 05:40

# Creates a queue of at jobs from 6AM-6AM.
# Adds  line to status.txt, confirming that jobs for the next day are in the queue.
at 05:45 < make_night_schedule.sh 

# At 6:05AM, check to see if there are 24*2*4 files in ./data/*/*.
# If there are, source do_rsync.sh then source clear_data.sh. Send email to Aman.
# If there are files missing, source do_rsync, but don't clear data. Send email to Aman, Jack, Nichole.
# Emails are sent at 6:20AM

echo "echo \"It is 6:02AM. Starting to check for missing data files from the last 24 hours.\" >> status.txt" | at 06:02
at 06:03 < check_missing.sh
at 06:04 < do_rsync_clear_emails.sh

# Clean up and get ready for next day
echo "rm status.txt" | at 06:25
