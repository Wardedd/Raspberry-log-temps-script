# Raspberry log temps script
Small script that logs Raspi 4 temps and other info.<br>
Uses bash and the pi's builtin vcgencmd tool<br>
Log values: date;is_throttled;frequency;temp;volt<br>
<br>
Note: is_throttled is a value containing several flags about the raspberry's "health",<br>
 check: https://www.raspberrypi.com/documentation//computers/os.html#vcgencmd<br>

## Examples 
```script_rasp_log.sh``` prints the log output on screen<br>
```script_rasp_log.sh -f pippo.txt``` also write the output in pippo.txt<br>
```script_rasp_log.sh -f pippo.txt -n 0.2 ``` also logs in between intervals of 0.2 seconds<br>

Note: Default interval=2s<br>
      Min interval=0.1s, see "watch" command convention for interval info<br>