#!/bin/sh
ping -c5 1.1.1.1
if [ $? -eq 0 ]; then
    echo "Internet ok le $(date)" > /root/checkinternet.txt
else
    reboot
fi

