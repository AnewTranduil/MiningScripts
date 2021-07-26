#!/bin/sh
echo "Start of the configurate script"
echo "User name is [$USER]"
echo "$(env)"
sleep 15
#nvidia=settongs gpu:0 = rtx3070 / gpu:1 gtx 1660
# Set the gpu power mode to the max performance
nvidia-settings -a '[gpu:0]/GPUPowerMizerMode=1'
# nvidia-settings -a '[gpu:1]/GPUPowerMizerMode=1'
# Set the gpu clock offset from the default value
nvidia-settings -a '[gpu:0]/GPUGraphicsClockOffset[4]=-500'
nvidia-settings -a '[gpu:0]/GPUGraphicsClockOffset[3]=-500'
nvidia-settings -a '[gpu:0]/GPUGraphicsClockOffset[2]=-500'
# nvidia-settings -a '[gpu:1]/GPUGraphicsClockOffset[4]=-400'
# nvidia-settings -a '[gpu:1]/GPUGraphicsClockOffset[3]=-400'
# nvidia-settings -a '[gpu:1]/GPUGraphicsClockOffset[2]=-400'
# Set the gpu memory offset from the default value
nvidia-settings -a '[gpu:0]/GPUMemoryTransferRateOffset[4]=2500'
nvidia-settings -a '[gpu:0]/GPUMemoryTransferRateOffset[3]=2500'
nvidia-settings -a '[gpu:0]/GPUMemoryTransferRateOffset[2]=2500'
# nvidia-settings -a '[gpu:1]/GPUMemoryTransferRateOffset[4]=1500'
# nvidia-settings -a '[gpu:1]/GPUMemoryTransferRateOffset[3]=1500'
# nvidia-settings -a '[gpu:1]/GPUMemoryTransferRateOffset[2]=1500'
# Enable custom control over Fan speed
nvidia-settings -a '[gpu:0]/GPUFanControlState=1'
# nvidia-settings -a '[gpu:1]/GPUFanControlState=1' 
# Set Fan speed
nvidia-settings -a '[fan:0]/GPUTargetFanSpeed=75' -a '[fan:1]/GPUTargetFanSpeed=75'
# nvidia-settings -a '[fan:2]/GPUTargetFanSpeed=75' -a '[fan:3]/GPUTargetFanSpeed=75'
# Set the power limit the outcome temprature
# nvidia-smi 0 = gtx1660 super/ 1 = rtx3070
#sudo -n nvidia-smi -i 0 --persistence-mode=1
#sudo -n nvidia-smi -i 0 --power-limit=90
sudo -n nvidia-smi -i 0 --persistence-mode=1
sudo -n nvidia-smi -i 0 --power-limit=120
