require Logger
defmodule Server do
    
    def get_k_zero_string(k, k_zero_string) do
        if k == 0 do
            k_zero_string
        else
            k_zero_string = k_zero_string <> "0"
            get_k_zero_string(k - 1, k_zero_string)
        end
    end

    def empty_loop() do
        empty_loop()
    end

    def accept(k, socket) do
        
        {:ok, client} = :gen_tcp.accept(socket)
        spawn fn -> serve(client, k) end
        accept(k, socket)
    end

    def serve(client, k) do
        IO.puts "sent"
        :gen_tcp.send(client, to_string k)
    end

    def main(args) do
        {_, [str], _} = OptionParser.parse(args)

        if str =~ "." do
            # connect, get server pid, k
            # spawn worker for mining
            
            #might break
            { :ok, socket } = :gen_tcp.connect({127,0,0,1}, 19927, [{:active, false}])
            {:ok, resp} = :gen_tcp.recv(socket, 0)

            IO.puts resp
            
            #k =  (resp)
            #change k
            { :ok, socket1 } = :gen_tcp.connect({127,0,0,1}, 19093, [{:active, false}])
            spawn(WORKER, :print_bitcoins_new_machine, 
                  ["chaitanyaakulkar", 1, get_k_zero_string(1, ""), str, socket1])
            empty_loop()
        else   
            k = elem(Integer.parse(str), 0)
            
            k_zero_string = get_k_zero_string(k, "")
            
            server_pid = spawn(PRINT_SERVER, :listen, [])
            
            spawn(WORKER, :print_bitcoins, ["chaitanyaakulkar", k, k_zero_string, server_pid])
            spawn(WORKER, :print_bitcoins, ["chaitanyaakulkar", k, k_zero_string, server_pid])
            spawn(WORKER, :print_bitcoins, ["chaitanyaakulkar", k, k_zero_string, server_pid])
            spawn(WORKER, :print_bitcoins, ["chaitanyaakulkar", k, k_zero_string, server_pid])

            Logger.info "Accepting connections on port 8789"
            {:ok, socket1} = :gen_tcp.listen(19093,
                                            [{:active, false}])
            spawn(PRINT_SERVER, :accept, [socket1])

            Logger.info "Accepting connections on port 7384"

            {:ok, socket} = :gen_tcp.listen(19927,
                                            [{:active, false}])
            accept(k, socket)
        end
    end
end
