login
username: kenkoknz1 

aoi key: 
io.adafruit.com 1883

the topic is controlled by feed, so create a feed then use that as the topic. 

feed name: username/feeds/*******

e.g I have set a feed at adafruit io receive temperature: "temp1temp"  the topic becomes  kenkoknz1/feeds/temp1temp

create a feed to turn sonof on/off: kenkoknz1/feeds/cmd

----------------
Case study: sonoff with espeasy mega, adafruit mqtt, ifttt and google assist 
ant

unit name: kksonoff1

controller setup:

subscribe: kenkoknz1/feeds/# ; this means the sonoff is listenning for this topic, to turn gpio12 on, we need the command: 

kenkoknz1/feeds/cmd with payload "gpio 12,1"

so to turn sonoff on

publish topic: /kksonoff1/cmd with message: gpio,12,1

i.e when the sonoff sees kenkoknz1/feeds/cmd with payload "gpio 12,1"  the sonoff will turn gpio12 on.


to turn gpio12 off; 

publish topic:  /kksonoff1/cmd with message: gpio,12,0

---------------------------

pulish: kenkoknz1/feeds/kk1/%sysname%/%tskname%/%valname%











------------------------------------------

connecting to espeasy:

You need to use the OpenHab MQTT protocol and edit the publish template and subscribe templates.

CONFIG PAGE
Name: <yoursensorname>
Protocol: OpenHAB MQTT
Locate Controller: Use Hostname
Controller hostname: io.adafruit.com
controller port: 1883
controller User: <adafruit username>
controller password: <adafruit AIO Key>

Devices
Edit the device
Note down the "Value Name" settings

TOOLS > ADVANCED PAGE
Subscribe Template:
<adafruit username>/feeds/#

Publish Template:
<adafruit username>/feeds/%sysname%%valname%

For me i have a DHT22 (reads both temperature and humidity) so in the device settings value 1 name = temp, and value 2 name = hum
So this creates two feeds, one for temp and one for humidity
And my sensor name is "sensor01"

So for me...
<adafruit username>/feeds/%sysname%%valname%
=
<adafruit username>/feeds/sensor01hum
<adafruit username>/feeds/sensor01temp

The bit after the feeds/... needs to be matched in adafruit.io
So in my example you need a feeds called "sensor01hum" and "sensor01temp"

Note: you could also use the name you have given to the device in the feed name.
%tskname%

<adafruit username>/feeds/%sysname%%tskname%valname%
could look like this...
<adafruit username>/feeds/sensor01dhttemp
