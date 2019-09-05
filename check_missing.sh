DATA=data2/
NUMBER=`ls $DATA/*/*.txt -1 | wc -l`

echo "Total files in" $DATA "directory is" $NUMBER

for d in $DATA/*/ ; 
do
    N=`ls $d -1 | wc -l`
    if [ $N -lt 4 ]; then 
        TIME=$(basename $d);
        for i in "rf0XX" "rf0YY" "rf1XX" "rf1YY"; do 
            #echo "$i";
            if [ ! -f $d/$i* ]; then
                echo "$i"_"$TIME File not found"
            fi    
        done
        #ls $d -1;
    fi    
done
