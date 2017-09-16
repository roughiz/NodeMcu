pingauche=5  
pindroit=3  
pinbas=2 
pinhaut=1 
gpio.mode(pingauche, gpio.INPUT, gpio.PULLUP)
gpio.mode(pindroit, gpio.INPUT, gpio.PULLUP)
gpio.mode(pinhaut, gpio.INPUT, gpio.PULLUP)
gpio.mode(pinbas, gpio.INPUT, gpio.PULLUP)
i=0
while( i  <= 6 )
   do
        haut = gpio.read(pinhaut)
	bas = gpio.read(pinbas)
	droit = gpio.read(pindroit)
	gauche = gpio.read(pingauche) 
	print("Gauche: ",gauche)
	print("Droit: ",droit)
	print("Haut: ",haut)
	print("Bas: ",bas)
	tmr.delay(7000000)
	i = i+1
	
   end


