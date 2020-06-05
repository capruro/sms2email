# Personal smstools configuration setup
Configuration for:<br />
<br />
usb_modeswitch  used to switch the 3G usb dongle (ZTE Vodafone in my case) from storage mode to modem mode<br />
smstools        used for receive sms and forward it to mail<br />
postfix         MTA used to forward email using a 3rd mail account<br />


# Installation

## Postfix setup

I followed this guide to Install and Configure Postfix as SMTP Server on Ubuntu <br />
https://kifarunix.com/configure-postfix-to-use-gmail-smtp-on-ubuntu-18-04/ <br />



## usb_modeswitch

`apt install -y usb_modeswitch` <br />
<br />
```
root@ubuntu:~# lsusb
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 004: ID 19d2:0063 ZTE WCDMA Technologies MSM K3565-Z HSDPA
Bus 001 Device 002: ID 2109:3431 VIA Labs, Inc. Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```
 <br />
19d2:2000 Storage mode <br />
 <br />
19d2:0063 Modem mode <br />
 <br />
To switch put the file zte_vodafone in the config folder and run as root: <br />
`usb_modeswitch -c /etc/usb_modeswitch.d/zte_vodafone` <br />
 <br />
once usb is in the correct state you can start smstools <br />
 <br />
Known issue: usb_modeswitch doesn't work after reboot so i applied some work around <br />

## smstools

`apt install -y smstools` <br />
 <br />
replace the smsd configuration and start the program <br />
 <br />
`systemctl start smstools` <br />