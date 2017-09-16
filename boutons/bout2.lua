cmd="test" 
conn= net.createConnection(net.TCP, 0)
conn:on("receive", function(conn, pl) print("Commade acheminé") end)
conn:connect(8080,"192.168.0.57")
conn:send("GET /commandes/" .. cmd .. " HTTP/1.1\r\nConnection: close\r\nAccept: */*\r\n\r\n")
tmr.delay(100)


