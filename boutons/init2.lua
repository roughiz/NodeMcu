pingauche=5  
pindroit=3  
pinbas=2 
pinhaut=1 
outpin =6
pressed=false
gpio.mode(pingauche, gpio.INT, gpio.PULLUP)
gpio.mode(pindroit, gpio.INT, gpio.PULLUP)
gpio.mode(pinhaut, gpio.INT, gpio.PULLUP)
gpio.mode(pinbas, gpio.INT, gpio.PULLUP)
gpio.mode(outpin,gpio.OUTPUT)

function presser(bouton)
      if pressed == false
         then
	    pressed = true
            print("Bouton presser: ",bouton)                       -- print status
	    gpio.write(outpin,gpio.HIGH)           -- Led ON - Motion detected
      	    tmr.delay(10)                                      -- time delay for switch debounce                      
            gpio.trig(bouton,"up",relacher(bouton))            -- change trigger on falling edge
            return pressed
	 else
	    print("Un bouton est déja pressé !")
         end 
end
 
function relacher(bouton)
       pressed = false
       print("Bouton Relacher: ",bouton) 
       gpio.write(outpin,gpio.LOW)   -- Led OFF 
       tmr.delay(10)
       --gpio.trig(inpin,"down",pressed)  -- trigger on rising edge
      return pressed
end


gpio.trig(pinbas,"down",presser(pinbas))
gpio.trig(pinhaut,"down",presser(pinhaut))
gpio.trig(pingauche,"down",presser(pingauche))
gpio.trig(pindroit,"up",presser(pindroit))


