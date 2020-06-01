#!/bin/bash

EMAIL="marcello_f@icloud.com"
MAIL="/bin/mail"
SENDER="alert.holonet@gmail.com"


echo
clear

if [ "$1" == "RECEIVED" ]; then

   if [ -n "$EMAIL" ]; then
        FROM=`grep "From:" $2`
        sms=`tail -n +14 $2`
        SUBJECT="New SMS received $FROM"
        message="To: $EMAIL
From: $SENDER
${sms}"
        echo -n "$message" | $MAIL -s "$SUBJECT" "$EMAIL"
   fi
fi
