today=`date +'%Y-%m-%d-%H:%M'`
msg='ERROR! Raspberry: Reference ['
end=']'
sub="${msg}${today}${end}"

mail -s "${sub}" achokshi@student.unimelb.edu.au, amanchokshi.iisc@gmail.com < status.txt
