outpinhaut =6 
outpinbas=7 
outpingauche=0  
outpindroit=3 
delay=100000
finboucle=1000
i=10
gpio.mode(outpinhaut,gpio.OUTPUT) 
gpio.mode(outpinbas,gpio.OUTPUT)
gpio.mode(outpingauche,gpio.OUTPUT) 
gpio.mode(outpindroit,gpio.OUTPUT) 
gpio.write(outpindroit,gpio.LOW)
	gpio.write(outpingauche,gpio.LOW)
	gpio.write(outpinhaut,gpio.LOW)
	gpio.write(outpinbas,gpio.LOW)

function jeu()
for i=1,i do 
		gpio.write(outpinhaut,gpio.HIGH)
		tmr.delay(delay)
		gpio.write(outpinhaut,gpio.LOW)
		gpio.write(outpindroit,gpio.HIGH)
		tmr.delay(delay)
		gpio.write(outpindroit,gpio.LOW)
		gpio.write(outpinbas,gpio.HIGH)
		tmr.delay(delay)
		gpio.write(outpinbas,gpio.LOW)
		gpio.write(outpingauche,gpio.HIGH)
		tmr.delay(delay)
		gpio.write(outpingauche,gpio.LOW)
		tmr.delay(finboucle)
end
tmr.delay(1000)
end

jeu()
