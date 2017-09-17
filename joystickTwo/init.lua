wifi.setmode(wifi.STATION)
wifi.sta.autoconnect(1)
wifi.sta.config("Yobadi","")
ipserveur=""
dnsserveur="roughiz.no-ip.org"
connected=false
buzzerPin = 5
gpio.mode(buzzerPin, gpio.OUTPUT)
tones = {}
tones["aS"] = 880
tones["cS"] = 523
tones["eS"] = 659
function getDNSAndIp()
     tmr.alarm(0, 500, 1,function()
	if ipserveur == "" then
		print("DNS .. waiting") 
     		net.dns.resolve(dnsserveur, function(sk, ip)
   		 if (ip ~= nil) then 
	    		ipserveur=ip
    	 	 end
        	end)
	end  
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
            playwifi()
	end
     end)
tmr.wdclr()
end
function beep(pin, tone, duration)
    local freq = tones[tone]
    pwm.setup(pin, freq, 512)
    pwm.start(pin)
    -- delay in uSeconds
    tmr.delay(duration * 1000)
    pwm.stop(pin)
    --20ms pause
    tmr.wdclr()
    tmr.delay(20000)
end
function playwifi()
    beep(buzzerPin, "aS", 1000)
    beep(buzzerPin, "aS", 1000)
    beep(buzzerPin, "aS", 1000)
end
getDNSAndIp()
dofile("main.lua")
