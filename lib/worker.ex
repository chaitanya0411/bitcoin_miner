defmodule WORKER do
    
    def print_bitcoins(user_input, i, k, k_zeros, server_pid) do
        input = user_input <> Integer.to_string(i)
        hash = Base.encode16(:crypto.hash(:sha256, input))
  
        if String.slice(hash, 0..k-1) == k_zeros do
            send server_pid, { :ok, Enum.join([input,hash], "\t") }
        end
        print_bitcoins(user_input, i + 1, k, k_zeros, server_pid)
    end
  
  end
  