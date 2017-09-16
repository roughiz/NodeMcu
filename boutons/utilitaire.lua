function getDNS(dnsserveur)

     net.dns.resolve(dnsserveur, function(sk, ip)
   	 if (ip == nil) then 
	    print("DNS fail!") 
    	else 
	    print("Write DNS ip server: ",ip) 
	    return ip
    	end
     end)  
end


function ready(outpinhaut,outpindroit, outpinbas, outpingauche)
	for i=1,50 do 
		gpio.write(outpinhaut,gpio.HIGH)
		tmr.delay(10)
		gpio.write(outpinhaut,gpio.LOW)
		gpio.write(outpindroit,gpio.HIGH)
		tmr.delay(10)
		gpio.write(outpindroit,gpio.LOW)
		gpio.write(outpinbas,gpio.HIGH)
		tmr.delay(10)
		gpio.write(outpinbas,gpio.LOW)
		gpio.write(outpingauche,gpio.HIGH)
		tmr.delay(10)
		gpio.write(outpingauche,gpio.LOW)
	end
	tmr.delay(20)
	for i=1,50 do 
		gpio.write(outpinhaut,gpio.HIGH)
		tmr.delay(10)
		gpio.write(outpinhaut,gpio.LOW)
		gpio.write(outpingauche,gpio.HIGH)
		tmr.delay(10)
		gpio.write(outpingauche,gpio.LOW)
		gpio.write(outpinbas,gpio.HIGH)
		tmr.delay(10)
		gpio.write(outpinbas,gpio.LOW)
		gpio.write(outpindroit,gpio.HIGH)
		tmr.delay(10)
		gpio.write(outpindroit,gpio.LOW)
	end
end
