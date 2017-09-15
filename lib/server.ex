defmodule SERVER do
    def listen do
      receive do
        {:response, response} -> IO.puts response
      end
      listen()
    end
end