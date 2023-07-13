#!/bin/bash
for file in *.MR.txt;
do awk -F"\t" '{ print 
$6,"\t",$4,"\t",$3,"\t",$5,"\t",$7,"\t",$7-1.96*$8," - ", 
$7+1.96*$8,"\t",$9,"\t",$7,"\t",1.96*$8 }' "$file" >> "tmp"
sed -e '1s/0/lower.confidence.interval/' -e 
'1s/0/upper.confidence.interval/' -e '1s/0/ci/' "tmp" >> 
"$file.Results"
done

