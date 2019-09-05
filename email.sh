today=`date +'%Y-%m-%d-%H:%M'`
msg='Raspberry: Reference ['
end=']'
sub="${msg}${today}${end}"

mail -s "${sub}" achokshi@student.unimelb.edu.au < status.txt
