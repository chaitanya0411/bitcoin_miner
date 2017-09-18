# Project1

Date: September,18 2017
READ ME file for COP 5615 : Distributed Operating Systems :Project 1

Group members:
| Name | UFID | Email ID |
| --- | --- | --- |
| Govind Rajan Chandra | 26113109 | cgovindrajan@ufl.edu |
| Chaitanya Kulkarni |            | chaitanyaakulkar@ufl.edu |

# PROJECT DEFINITION

- Goal of the Project is to mine and print bitcons using SHA-256 algorithm [condition : hash value should be prefixed with k zeros].
- The projects uses elixir and actor worker modules to build bitcoin miner which can run on multi-core machines.
- Project should capablity to add more workers  to bit.coin mining capabilities
- The bitcoins are mined using the SHA-256 algorithm and the input string with the corresponding SHA-256 hash is printed.
- The performace of the system is measured using the ratio of the CPU time to Real time

# Implementation Details

- Work Unit :
For generating the strings, we have used the random string function with a length of 64 bytes. We used the 64 byte because it will give us a higher probability of getting the bitcoins. In our actor worker model, we have designed the system in such a way that for each iteration the workers are assigned a specific task from the actor and this process continues as the workers start to complete their assigned tasks and it goes on untill the required number of bitcoins are generated.

- The test result for K=4 :

- Result for K = 5 :

Ratio of CPU time to Real time in this case is = (user + sys) / real = 

- From our distributed bitcoin miner system, we were able to mine a bitcoin with leading zero's counting to 7. i.e. for k = 7 we were able to mine a bitcoin.

- We were able to run our code with 4 machines each having four cores and getting the CPU utilization of atleast 350%.

# Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `project1` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:project1, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/project1](https://hexdocs.pm/project1).

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `project1` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:project1, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/project1](https://hexdocs.pm/project1).

