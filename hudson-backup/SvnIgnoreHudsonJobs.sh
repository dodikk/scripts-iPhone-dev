cd ~/.hudson/jobs

for JOB_DIR in $( ls -1 ); do

svn propset svn:ignore -F ./IgnoreHudsonJob.txt "$JOB_DIR"

done

