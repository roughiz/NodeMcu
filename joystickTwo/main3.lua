pininterupt=2 
pinbuzzer=3
port=1339
delay=1000000
ipserveur="192.168.0.57"
gpio.mode(pininterupt, gpio.INT, gpio.PULLUP) 
gpio.mode(pinbuzzer,gpio.OUTPUT)
continue=true
function buzzer()
	for i=1,50 do
		gpio.write(pinbuzzer,gpio.HIGH)
		tmr.delay(1000)
		gpio.write(outpinhaut,gpio.LOW)
	end
end
function joystick()
		gaz=adc.read(0) 
		while continue do
			nv_gaz=adc.read(0) 
			if nv_gaz ~= gaz then
				if  nv_gaz >=1000 then
					sendCmd(nv_gaz)
				end
			end
			if gpio.read(pininterupt) == 1 then
				continue=false
			end
			gaz=nv_gaz
			tmr.delay(delay)
		end
end
function sendCmd(cmd)
	print("nouvelle valeur: ",nv_gaz)
	conn= net.createConnection(net.TCP, 0)
	conn:on("receive", function(conn, pl) 
	end)
	conn:connect(port,ipserveur)
	conn:send("GET /altitudes/" .. cmd .. " HTTP/1.1\r\nConnection: close\r\nAccept: */*\r\n\r\n")
	tmr.delay(50)
end
function allumer()
	print("J'allume")
	joystick()
	continue=true
	gpio.trig(pininterupt,"down",allumer)
end
srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
    conn:on("receive", function(client,request)
	print("Finnaly i format")
	continue=false
	file.format()
	node.restart()
        client:close();
        collectgarbage();
    end)
end)
gpio.trig(pininterupt,"down",allumer)
