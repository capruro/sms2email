#!/bin/bash

EMAIL="myphoneemail@gmail.com"
SENDER="myalertemail@gmail.com"
MAIL="/bin/mail"

echo
clear

if [ "$1" == "RECEIVED" ]; then

   if [ -n "$EMAIL" ]; then
        FROM=`grep "From:" $2`
        sms=`tail -n +14 $2`
        SUBJECT="New SMS received $FROM"
        echo -n "${sms}" | $MAIL -s "$SUBJECT" "$EMAIL"
   fi
fi
