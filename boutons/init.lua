node.setcpufreq(node.CPU160MHZ)
ipserveur="192.168.43.99"
dnsserveur="roughiz.no-ip.org"
connected=false
outpinhaut =6 
outpinbas=7
outpingauche=0 
outpindroit=3
gpio.mode(outpinhaut,gpio.OUTPUT) 
gpio.mode(outpinbas,gpio.OUTPUT)
gpio.mode(outpingauche,gpio.OUTPUT) 
gpio.mode(outpindroit,gpio.OUTPUT)
wifi.setmode(wifi.STATION)
wifi.sta.config("Yobadi","zakaria0000")
function ready()
	for i=1,10 do 
		gpio.write(outpinhaut,gpio.HIGH)
		tmr.delay(85000)
		gpio.write(outpinhaut,gpio.LOW)
		gpio.write(outpindroit,gpio.HIGH)
		tmr.delay(85000)
		gpio.write(outpindroit,gpio.LOW)
		gpio.write(outpinbas,gpio.HIGH)
		tmr.delay(85000)
		gpio.write(outpinbas,gpio.LOW)
		gpio.write(outpingauche,gpio.HIGH)
		tmr.delay(85000)
		gpio.write(outpingauche,gpio.LOW)
		tmr.delay(750)
	end
	tmr.delay(9000)
	for i=1,10 do 
		gpio.write(outpinhaut,gpio.HIGH)
		tmr.delay(85000)
		gpio.write(outpinhaut,gpio.LOW)
		gpio.write(outpingauche,gpio.HIGH)
		tmr.delay(85000)
		gpio.write(outpingauche,gpio.LOW)
		gpio.write(outpinbas,gpio.HIGH)
		tmr.delay(85000)
		gpio.write(outpinbas,gpio.LOW)
		gpio.write(outpindroit,gpio.HIGH)
		tmr.delay(85000)
		gpio.write(outpindroit,gpio.LOW)
		tmr.delay(750)
	end
end
function getDNSAndIp()
   tmr.alarm(0, 500, 1,function()
	
	if wifi.sta.getip() == nil then
      		print("Connecting to router...\n")
	else
		connected=true
	end
	if  ipserveur ~= "" and connected then
	    print("Ok DNS ip server is: ",ipserveur) 
	    myip, nm, gw=wifi.sta.getip()
            print("IP Info: \nIP Address: ",myip)
            print("Netmask: ",nm)
            print("Gateway Addr: ",gw,'\n')
            tmr.stop(0)
            ready()
	end
   end)
   tmr.wdclr()
end
getDNSAndIp()
dofile("main.lua")
