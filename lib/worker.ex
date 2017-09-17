defmodule WORKER do
    

    def get_random_string() do
        random_number = :rand.uniform(10)
        random_string = :crypto.strong_rand_bytes(random_number) |> 
                        Base.url_encode64 |> 
                        binary_part(0, random_number)
    end

    def print_bitcoins(user_input, k, k_zeros, server_pid) do
        
        input = user_input <> get_random_string()
        hash = Base.encode16(:crypto.hash(:sha256, input))
        
        if String.slice(hash, 0..k-1) == k_zeros do
            send server_pid, { :response, Enum.join([input,hash], "\t") }
        end
        print_bitcoins(user_input, k, k_zeros, server_pid)
    end

    def print_bitcoins_new_machine(user_input, k, k_zeros, str, socket) do
        input = user_input <> get_random_string()
        hash = Base.encode16(:crypto.hash(:sha256, input))
        IO.puts "yes"
        
        if String.slice(hash, 0..k-1) == k_zeros do
            :gen_tcp.send(socket, Enum.join([input,hash], "\t"))
        end
        
        print_bitcoins_new_machine(user_input, k, k_zeros, str, socket)
    end

end