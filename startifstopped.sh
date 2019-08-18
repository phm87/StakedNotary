#!/bin/bash

while true; do
    echo "Check that it is still running"
    date
    echo "komodod : 2 instances launched ?"
    SERVICE="komodod"
    tester=$(pgrep -c "$SERVICE")
    if [[ $tester == "2" ]];
    then
        echo "$SERVICE is running 2 times: OK"
    else
        echo "$SERVICE stopped"
        cd ~/StakedNotary
        ./start.sh
        # cd ~/
        # sleep 100
        # ./startNN
    fi

    echo "iguana : 1 instance launched ?"
    pgrep -af iguana | grep -v "$0" > /dev/null 2>&1
    outcomek=$(echo $?)
    if [[ $outcomek != 0 ]]; then
        echo "Starting iguana"
        cd ~/StakedNotary
        ./start.sh
        # cd ~/
        # sleep 100
        # ./startNN
    fi

    sleep 20
done
exec bash
