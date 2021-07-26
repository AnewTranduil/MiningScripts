#!/bin/bash

export DISPLAY=:1
export XAUTHORITY=~/.Xauthority

setFanSpeed() {
        eval "nvidia-settings -a [gpu:$2]/GPUFanControlState=1 -a [fan:$2]/GPUTargetFanSpeed=$1" > /dev/null
        echo "Updating fans speed to $1 on GPU $2"
}

cleanup() {
        eval "nvidia-settings -a [gpu:0]/GPUFanControlState=0"
        eval "nvidia-settings -a [gpu:1]/GPUFanControlState=0"
        eval "nvidia-settings -a [gpu:2]/GPUFanControlState=0"
        eval "nvidia-settings -a [gpu:3]/GPUFanControlState=0"
        eval "nvidia-settings -a [gpu:4]/GPUFanControlState=0"
        exit
}

declare -i gpuTemp

# Set cleanup function (clean up and exit when interrupted)
trap cleanup 1 2 3 15 20

checkGpu(){
        #echo "Checking GPU $1"
        gpuTemp=$(nvidia-settings -q gpucoretemp | grep '^  Attribute' | grep "gpu:$1" | \
                head -n 1 | perl -pe 's/^.*?(\d+)\.\s*$/\1/;')
        echo "Current GPU $1 temperature: $gpuTemp"

        # Set GPU fan speed
        if   [ $gpuTemp -ge 70 ]; then
                setFanSpeed 100 $1
        elif [ $gpuTemp -ge 65 ]; then
                setFanSpeed 90 $1
        elif [ $gpuTemp -ge 60 ]; then
                setFanSpeed 75 $1
        elif [ $gpuTemp -ge 55 ]; then
                setFanSpeed 60 $1
        elif [ $gpuTemp -ge 50 ]; then
                setFanSpeed 50 $1
        else
                setFanSpeed 40 $1
        fi

}

while : # Loop
do
        checkGpu 0
        checkGpu 1
        checkGpu 2
        checkGpu 3
        checkGpu 4
        # Interval
        sleep 5
done
