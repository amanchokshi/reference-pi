START=2019-09-04-12:19
STOP=2019-09-04-12:20
OBS_LENGHT=60

python make_night_schedule.py --time_obs=$OBS_LENGHT --start_date=$START \
    --finish_date=$STOP --num_tiles=4

chmod +x obs"_"$START"_"to"_"$STOP.sh
sh obs"_"$START"_"to"_"$STOP.sh
rm obs"_"$START"_"to"_"$STOP.sh

