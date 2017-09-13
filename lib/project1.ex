defmodule Project1 do
    def get_k_zero_string(k, k_zero_string) do
        if k == 0 do
            k_zero_string
        else
            k_zero_string = k_zero_string <> "0"
            get_k_zero_string(k - 1, k_zero_string)
        end
    end

    def empty_loop do
        empty_loop()
    end

    def main(args) do
        {_, [str], _} = OptionParser.parse(args)

        k = elem(Integer.parse(str), 0)
        
        k_zero_string = get_k_zero_string(k, "")
        
        server_pid = spawn(SERVER, :listen, []) 
        spawn(WORKER, :print_bitcoins, ["chaitanyaakulkar", 0, k, k_zero_string, server_pid])
        spawn(WORKER, :print_bitcoins, ["chaitanyaakulkar", 0, k, k_zero_string, server_pid])
        spawn(WORKER, :print_bitcoins, ["chaitanyaakulkar", 0, k, k_zero_string, server_pid])
        spawn(WORKER, :print_bitcoins, ["chaitanyaakulkar", 0, k, k_zero_string, server_pid])

        empty_loop()
    end
end
