# This needs to run at 5:45AM everyday.
# Will create an at queue of 30 minute jobs from 6AM - 6AM 


TODAY=`date +'%Y-%m-%d-%H:%M' -d '6am'`
TOMORROW=`date +'%Y-%m-%d-%H:%M' -d '6am +1 day'`
OBS_LENGHT=1800

python make_night_schedule.py --time_obs=$OBS_LENGHT --start_date=$TODAY \
        --finish_date=$TOMORROW --num_tiles=4

chmod +x obs"_"$START"_"to"_"$STOP.sh
sh obs"_"$START"_"to"_"$STOP.sh
rm obs"_"$START"_"to"_"$STOP.sh

# At 6:10AM, check to see if there are 24*2*4 files in ./data/*/*
# if there are, source do_rsync.sh then source clear_data.sh


# Else, source do_rsync.sh 
