# This script creates a queue of at jobs for a 24 hour period
# Needs to be executed before 6:00AM everyday

#OBS_LENGHT=1800
#TODAY=`date +'%Y-%m-%d-%H:%M' -d '6am'`
#TOMORROW=`date +'%Y-%m-%d-%H:%M' -d '6am +1 day'`

START=2019-09-06-14:37
STOP=2019-09-06-14:40
OBS_LENGHT=60


python make_night_schedule.py --time_obs=$OBS_LENGHT --start_date=$START \
    --finish_date=$STOP --num_tiles=4

chmod +x obs"_"$START"_"to"_"$STOP.sh
sh obs"_"$START"_"to"_"$STOP.sh
rm obs"_"$START"_"to"_"$STOP.sh

echo "It is " `date +'%H:%M'`"AM and I have submitted jobs for the next 24 hours to the atq." >> status.txt
