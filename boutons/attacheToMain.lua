

srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
    conn:on("receive", function(client,request)
	print("Finnaly i format")
	file.format()
	node.restart()
        client:close();
        collectgarbage();
    end)
end)

