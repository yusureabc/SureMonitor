#! /bin/bash
# Author Yusure
# Blog http://yusure.cn

# Notice: Please open LAN Control #
# Device(Bulb) IP address and port #
IP="192.168.10.42"
PORT="55443"

# The url that needs to be monitored #
WEB_URL[0]='http://yusure.cn/test/0.php'
WEB_URL[1]='http://yusure.cn/test/1.php'
WEB_URL[2]='http://yusure.cn/test/2.php'
WEB_URL[3]='http://yusure.cn/test/3.php'
WEB_URL[4]='http://yusure.cn/test/4.php'

# Color Settings ( If your bulb not supported color, please use "White" ) #
COLOR[0]=White
COLOR[1]=Red
COLOR[2]=Green
COLOR[3]=Blue
COLOR[4]=Yellow

# Color Flow #
# API Document: http://www.yeelight.com/download/Yeelight_Inter-Operation_Spec.pdf #
White="{\"id\":1,\"method\":\"start_cf\",\"params\":[\"cf\", 6, 0,\"600,2,4000,70,400,2,4000,1\"]}"
Red="{\"id\":1,\"method\":\"start_cf\",\"params\":[\"cf\", 6, 0,\"600,1,16723245,70, 400,1,16723245,1\"]}"
Green="{\"id\":1,\"method\":\"start_cf\",\"params\":[\"cf\", 6, 0,\"600,1,9699131,70, 400,1,9699131,1\"]}"
Blue="{\"id\":1,\"method\":\"start_cf\",\"params\":[\"cf\", 6, 0,\"600,1,7792639,70, 400,1,7792639,1\"]}"
Yellow="{\"id\":1,\"method\":\"start_cf\",\"params\":[\"cf\", 6, 0,\"600,1,16771675,70, 400,1,16771675,1\"]}"
Purple="{\"id\":1,\"method\":\"start_cf\",\"params\":[\"cf\", 6, 0,\"600,1,11903999,70, 400,1,11903999,1\"]}"

while true
do
    for i in `seq 0 $((${#WEB_URL[*]}-1))`
    do
        http_code=`curl -o /dev/null -s -m 10 --connect-timeout 10 -w %{http_code} ${WEB_URL[${i}]}`
        if [ ${http_code} != "200" ]
        then
            # Get ColorFlow #
            ColorFlow=`eval echo '$'${COLOR[$i]}`
            echo ${ColorFlow} | telnet ${IP} ${PORT}
            # Waiting... #
            sleep 3
        fi
    done
done