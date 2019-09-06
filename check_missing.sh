NUMBER_TILES=4
DATA=data/
NUMBER_F=`ls $DATA/*/*.txt -1 | wc -l`


if [ $NUMBER_F = 0 ]; then
    echo "There are no files in the data directory, someone must have transferred them to Ozstar" >> status.txt
    echo "NO_FILES" >> check_missing_status.txt
else
    for d in $DATA/*/ ; 
    do
        N=`ls $d -1 | wc -l`
        if [ $N -lt $NUMBER_TILES ]; then 
            TIME=$(basename $d);
            for i in "rf0XX" "rf0YY" "rf1XX" "rf1YY"; do 
                
                if [ ! -f $d/$i* ]; then
                    echo "$i"_"$TIME".txt" file not found" >> status.txt
                fi    
            
            done
        fi    
    done
    
    if [ $NUMBER_F != $(($NUMBER_TILES*48)) ]; then
        echo "Heeeelllllp! There are files missing in the data directory!" >> status.txt
        echo "I see only" $NUMBER_F "files instead of" $(($NUMBER_TILES*48))"." >> status.txt
        echo "MISSING_FILES" >> check_missing_status.txt
    else
        echo "There are no missing files in the data directory. All "$NUMBER_F" files are ready to be transferred to Ozstar" >> status.txt 
        echo "ALL_FILES" >> check_missing_status.txt 
    fi
fi    
