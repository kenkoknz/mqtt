login

key

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
