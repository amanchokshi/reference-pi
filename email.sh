today=`date +'%Y-%m-%d-%H:%M'`
msg='Status: Reference ['
end=']'
sub="${msg}${today}${end}"

mail -s "${sub}" achokshi@student.unimelb.edu.au < status.txt
