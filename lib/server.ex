require Logger
defmodule PRINT_SERVER do
    def listen do
        receive do
            {:response, response} -> IO.puts response
        end
        listen()
    end

    def accept(socket) do
        loop_acceptor(socket)
    end

    def loop_acceptor(socket) do
        {:ok, client} = :gen_tcp.accept(socket)
        {:ok, print_message} = :gen_tcp.recv(client, 0)
        IO.puts print_message
        loop_acceptor(socket)
    end
end