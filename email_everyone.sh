today=`date +'%Y-%m-%d-%H:%M'`
msg='ERROR! Raspberry: Reference ['
end=']'
sub="${msg}${today}${end}"

mail -s "${sub}" achokshi@student.unimelb.edu.au, jack.line@curtin.edu.au, nichole.barry@unimelb.edu.au< status.txt
