#/bin/bash
#Setting internal pulldown on true
gpio -g mode 26 down
#initialization of GPIO 4 (out=sending of data)
gpio -g mode 26 in
# setting the pin to low and this will close circuit if the open closer (NO)
gpio -g read 26
