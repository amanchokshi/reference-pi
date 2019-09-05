NUMBER_TILES=4
DATA=data/
NUMBER_F=`ls $DATA/*/*.txt -1 | wc -l`

echo "Total files in" $DATA "directory is" $NUMBER_F

for d in $DATA/*/ ; 
do
    N=`ls $d -1 | wc -l`
    if [ $N -lt $NUMBER_TILES ]; then 
        TIME=$(basename $d);
        for i in "rf0XX" "rf0YY" "rf1XX" "rf1YY"; do 
            
            if [ ! -f $d/$i* ]; then
                echo "$i"_"$TIME".txt" file not found"
            fi    
        
        done
    fi    
done
