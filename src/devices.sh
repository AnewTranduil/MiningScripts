#!/bin/sh

## overclocks setup for the GTX 1660 super 
gtx1660super2fan()
{
gpu_id=${1:-0}
pl=${2:-70}
fan1=$(($gpu_id * 2))
fan2=$(($fan1 + 1))
# Set the gpu power mode to the max performance
nvidia-settings -a "[gpu:$gpu_id]/GPUPowerMizerMode=1"
# Set the gpu clock offset from the default value
nvidia-settings -a "[gpu:$gpu_id]/GPUGraphicsClockOffsetAllPerformanceLevels=-150"
# Set the gpu memory offset from the default value
nvidia-settings -a "[gpu:$gpu_id]/GPUMemoryTransferRateOffsetAllPerformanceLevels=2100"
# Enable custom control over Fan speed
nvidia-settings -a "[gpu:$gpu_id]/GPUFanControlState=1"
# Set Fan speed
nvidia-settings -a "[fan:$fan1]/GPUTargetFanSpeed=70" -a "[fan:$fan2]/GPUTargetFanSpeed=70"
# Set the power limit the outcome temprature
# nvidia-smi 0 = gtx1660 super/
sudo -n nvidia-smi -i $gpu_id --persistence-mode=1
sudo -n nvidia-smi -i $gpu_id --power-limit=$pl
}

Gtx1660super1fan() 
{
gpu_id=${1:-0}
pl=${2:-70}
fan=${3:-0}
# Set the gpu power mode to the max performance
nvidia-settings -a "[gpu:$gpu_id]/GPUPowerMizerMode=1"
# Set the gpu clock offset from the default value
nvidia-settings -a "[gpu:$gpu_id]/GPUGraphicsClockOffsetAllPerformanceLevels=-150"
# Set the gpu memory offset from the default value
nvidia-settings -a "[gpu:$gpu_id]/GPUMemoryTransferRateOffsetAllPerformanceLevels=2100"
# Enable custom control over Fan speed
nvidia-settings -a "[gpu:$gpu_id]/GPUFanControlState=1"
# Set Fan speed
nvidia-settings -a "[fan:$fan]/GPUTargetFanSpeed=70"
# Set the power limit the outcome temprature
# nvidia-smi 0 = gtx1660 super/
sudo -n nvidia-smi -i $gpu_id --persistence-mode=1
sudo -n nvidia-smi -i $gpu_id --power-limit=$pl
}
