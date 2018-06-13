#!/bin/sh
case $(date +%H) in
  19|20|21|22|23|00|01|02|03|04|05|06) figlet Good night, Linus\! -f future.flf|lolcat;;
  07|08|09|10|11)  figlet Good morning, Linus\! -f future.flf|lolcat;;
  12|13)  figlet Good noon, Linus\! -f future.flf|lolcat;;
  14|15|16|17|18)  figlet Good afternoon, Linus\! -f future.flf|lolcat;;
esac
 echo "$(date)"|lolcat
 #task|lolcat
# fortune|lolcat
exit 0;
