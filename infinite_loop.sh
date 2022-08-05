#!/bin/bash
#Setting internal pulldown on true
gpio -g mode 26 down

#initialization of GPIO 26 (in=receveing of data)
gpio -g mode 26 in

#initialization of GPIO 4 (out=sending of data)
gpio -g mode 4 out

#setting the pin to high and this will open circuit if the open closer (NO) has been used
#just to ensure that circuit is open after startup
gpio -g write 4 1



function lighton {
/usr/bin/gpio -g write 4 0
echo "Turned the light on"
}

function lightoff {
/usr/bin/gpio -g write 4 1
echo "Turned the light off"
}

button=0
buttonold=0

while :
do
	button=$(/usr/bin/gpio -g read 26)
	
	if [[ $button -ne $buttonold ]] 
	then
		
		if [[ $button -eq 0 ]] 
		then
			lightoff
		else
			lighton
		fi
	fi
	
	buttonold=$button
	
done
