pininterupt=2 
port=1339
delay=200
gpio.mode(pininterupt, gpio.INT, gpio.PULLUP) 
function playoff()
    beep(buzzerPin, "cS", 100)
    beep(buzzerPin, "eS", 100)
    beep(buzzerPin, "aS", 100)
    tmr.delay(10000)
end
function playon()
    beep(buzzerPin, "aS", 100)
    tmr.delay(1000)
end
function playerror()
	beep(buzzerPin,"cS", 500)
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
function sendCmd(cmd)
	conn= net.createConnection(net.TCP, 0)
	conn:on("receive", function(conn, pl) 
	end)
	conn:connect(port,ipserveur)
	conn:send("GET /altitudes/" .. cmd .. " HTTP/1.1\r\nConnection: close\r\nAccept: */*\r\n\r\n")
	tmr.delay(50)
end
function allumer()
	playon()
	joystick()
	gpio.trig(pininterupt,"down",allumer)
end
--on estime que le gaz est de 0 à 150, on prend donc la plage [124---1024]
function joystick()
	gaz=adc.read(0)
	while gaz >= 50 do
		playerror()
		gaz=adc.read(0)
	end
	gaz=0
	tmr.alarm(0,delay, 1, function() 
		nv_gaz=adc.read(0) -124
--		if nv_gaz >= 0 and nv_gaz ~= gaz and nv_gaz % 6 == 0 then  (le calcule se fait coté serveur)
		if nv_gaz >= 0 and nv_gaz ~= gaz then
			sendCmd(nv_gaz)
			gaz=nv_gaz 
		elseif nv_gaz < 0 then
			if gaz ~= -1 then
				sendCmd(0)
			end
			gaz=-1
		end
		if gpio.read(pininterupt) == 1 then
			tmr.stop(0) 
			playoff()
			tmr.wdclr()
			collectgarbage();
		end
	end)
end
gpio.trig(pininterupt,"down",allumer)
