pinbas=2 
pinhaut=1 
pingauche=5  
pindroit=4  
pressed=false 
pressedbouton=0
port=1339
gpio.mode(pinbas, gpio.INT, gpio.PULLUP) 
gpio.mode(pinhaut, gpio.INT, gpio.PULLUP)
gpio.mode(pingauche, gpio.INT, gpio.PULLUP) 
gpio.mode(pindroit, gpio.INT, gpio.PULLUP)
function sendCmd(cmd)
	conn= net.createConnection(net.TCP, 0)
	conn:on("receive", function(conn, pl) 
	end)
	conn:connect(port,ipserveur)
	conn:send("GET /commandes/" .. cmd .. " HTTP/1.1\r\nConnection: close\r\nAccept: */*\r\n\r\n")
	tmr.delay(30)
end
function initialize()
	gpio.write(outpindroit,gpio.LOW)
	gpio.write(outpingauche,gpio.LOW)
	gpio.write(outpinhaut,gpio.LOW)
	gpio.write(outpinbas,gpio.LOW)
end
function allumer(pin)
	gpio.write(pin,gpio.HIGH)           -- Led ON - Motion detected 
end
function eteindre(pin)
	gpio.write(pin,gpio.LOW)   -- Led OFF 
end
function presser1()
	    if pressed == false
		then
	        print("Bouton 1 presser: ")                       -- print status     
		pressed = true 
		pressedbouton=1
		sendCmd("AVANT")
		allumer(outpinhaut)
		gpio.trig(pinhaut,"up",relacher1)            -- change trigger on falling edge 
	    end                
end 
function relacher1()
       if pressedbouton == 1 then
         pressed = false 
         print("Bouton 1 Relacher: ")  
         sendCmd("STABLE")
         eteindre(outpinhaut)
	 	 tmr.delay(20)
         gpio.trig(pinhaut,"down",presser1)  -- trigger on rising edge 
       end
end 
function presser2()
	    if pressed == false
		then
                print("Bouton 2 presser: ")                       -- print status 
		pressed = true 
		pressedbouton=2
		sendCmd("ARRIERE")
		allumer(outpinbas)
		gpio.trig(pinbas,"up",relacher2)            -- change trigger on falling edge 
	    end    
end 
function relacher2()
	if pressedbouton == 2 then
       	  pressed = false 
          print("Bouton 2 Relacher: ") 
          sendCmd("STABLE") 
          eteindre(outpinbas)
	  	  tmr.delay(20)
          gpio.trig(pinbas,"down",presser2)  -- trigger on rising edge 
	end
end 
function presser3()
	    if pressed == false
		then
                print("Bouton 3 presser: ")                       -- print status   
		pressed = true 
		pressedbouton=3
		sendCmd("GAUCHE")
		allumer(outpingauche)
		gpio.trig(pingauche,"up",relacher3)            -- change trigger on falling edge 
	    end          
            
end 
function relacher3()
	if pressedbouton == 3 then
          pressed = false 
          print("Bouton 3 Relacher: ")  
          sendCmd("STABLE")
          eteindre(outpingauche)
	      tmr.delay(20)
          gpio.trig(pingauche,"down",presser3)  -- trigger on rising edge 
	end
end 
function presser4()            
	    if pressed == false
		then
		print("Bouton 4 presser: ")                       -- print status 
		pressed = true
		pressedbouton=4
		sendCmd("DROIT") 
		allumer(outpindroit)
		gpio.trig(pindroit,"up",relacher4)            -- change trigger on falling edge 
	    end    
end 
function relacher4()
	if pressedbouton == 4 then
          pressed = false 
          print("Bouton 4 Relacher: ")  
          sendCmd("STABLE")
          eteindre(outpindroit)
	      tmr.delay(20)
          gpio.trig(pindroit,"down",presser4)  -- trigger on rising edge 
	end
end 
initialize()
gpio.trig(pinhaut,"down",presser1)
gpio.trig(pinbas,"down",presser2)
gpio.trig(pingauche,"down",presser3)
gpio.trig(pindroit,"down",presser4)