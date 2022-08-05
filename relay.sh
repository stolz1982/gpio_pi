#/bin/bash
#initialization of GPIO 4 (out=sending of data)
gpio -g mode 4 out
# setting the pin to low and this will close circuit if the open closer (NO)
gpio -g write 4 0
sleep 3
gpio -g write 4 1
