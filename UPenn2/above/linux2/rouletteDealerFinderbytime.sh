ls -l | grep  $1 | grep "$2" $1_Dealer_schedule | awk '{print $1. $2, $5, $6}'
