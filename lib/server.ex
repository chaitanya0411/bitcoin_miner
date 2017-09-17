defmodule Server do

    def get_server_port, do: 19992
    def get_print_server_port, do: 19033
    
    
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
        spawn fn -> serve(client, Integer.to_string(k)) end
        accept(k, socket)
    end

    def serve(client, k) do
        :gen_tcp.send(client, k)
    end

    def main(args) do
        {_, [str], _} = OptionParser.parse(args)

        if str =~ "." do
            # connect, get server pid, k
            # spawn worker for mining
            
            ip_char_list = String.to_charlist(str)
            { :ok, socket } = 
                :gen_tcp.connect(ip_char_list, get_server_port(), [{:active, false}])
            {:ok, resp} = :gen_tcp.recv(socket, 0)

            k = String.to_integer(to_string resp)
            
            { :ok, socket1 } = :gen_tcp.connect(ip_char_list, get_print_server_port(), [{:active, false}])
            spawn(WORKER, :print_bitcoins_new_machine, 
                  ["chaitanyaakulkar", k, get_k_zero_string(k, ""), str, socket1])
            empty_loop()
        else
            k = elem(Integer.parse(str), 0)
            
            k_zero_string = get_k_zero_string(k, "")
            
            server_pid = spawn(PRINT_SERVER, :listen, [])
            
            #spawn(WORKER, :print_bitcoins, ["chaitanyaakulkar", k, k_zero_string, server_pid])
            #spawn(WORKER, :print_bitcoins, ["chaitanyaakulkar", k, k_zero_string, server_pid])
            #spawn(WORKER, :print_bitcoins, ["chaitanyaakulkar", k, k_zero_string, server_pid])
            #spawn(WORKER, :print_bitcoins, ["chaitanyaakulkar", k, k_zero_string, server_pid])

            {:ok, socket1} = :gen_tcp.listen(get_print_server_port(),
                                            [{:active, false}])
            spawn(PRINT_SERVER, :accept, [socket1])

            {:ok, socket} = :gen_tcp.listen(get_server_port(),
                                            [{:active, false}])
            accept(k, socket)
        end
    end
end
