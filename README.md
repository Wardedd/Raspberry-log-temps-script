# Raspberry log temps script
Small script that logs Raspi 4 temps and other info.<br>
Uses bash and the pi's builtin vcgencmd tool<br>
Log values: date;is_throttled;frequency;temp;volt<br>
<br>
Note: is_throttled is a value containing several flags about the raspberry's "health",<br>
 check: https://www.raspberrypi.com/documentation//computers/os.html#vcgencmd
