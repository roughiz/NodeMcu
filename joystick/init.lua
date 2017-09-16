wifi.setmode(wifi.STATION)
wifi.sta.config("Yobadi","ZakLauIly162530@@@@")
print(wifi.sta.getip())
tmr.alarm(0, 2000, 1, function()
   if wifi.sta.getip() == nil then
      print("Connecting to router...\n")
   else
      ip, nm, gw=wifi.sta.getip()
      print("IP Info: \nIP Address: ",ip)
      print("Netmask: ",nm)
      print("Gateway Addr: ",gw,'\n')
      tmr.stop(0)
   end
end)
--dofile("main.lua")
