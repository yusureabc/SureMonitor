# SureMonitor
Monitor the site for normal access, if abnormal, use the light alarm.


### How to use:
1. Open LAN Control in the Yeelight App.
2. Find out your device IP
3. Configure IP and url and color flow in the code
4. Run Script ( sh SureMonitor.sh & )

### Exit Script
ps auxf|grep 'SureMonitor.sh'|grep -v grep|awk '{print $2}'|xargs kill -9