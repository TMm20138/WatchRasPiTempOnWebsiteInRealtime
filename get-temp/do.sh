watch -n 2 ./temp.sh & watch -n 2 ./get25temp.sh & watch -n 2 ./get26temp.sh & node ../main.js
#cleab up => pgrep -f ./*temp*.sh |xargs kill