# Project1 : BIT COIN MINER

**Group members**

| Name                 | UFID     | Email ID                 |
| :------------------: | :------: | :----------------------: |
| Govind Rajan Chandra | 26113109 | cgovindrajan@ufl.edu     |
| Chaitanya Kulkarni   |          | chaitanyaakulkar@ufl.edu |

# PROJECT DEFINITION

- Goal of the project is to mine and print bitcons using SHA-256 algorithm [condition : hash value should be prefixed with k zeros].
- The projects uses elixir and actor worker modules to build bitcoin miner which can run on multi-core machines.
- Project should capablity to add more workers  to bit.coin mining capabilities
- The bitcoins are mined using the SHA-256 algorithm and the input string with the corresponding SHA-256 hash is printed.
- The performace of the system is measured using the ratio of the CPU time to Real time

# Execution Steps

> Compile

```
mix clean
mix escript.build
```
 
> Initialize server and start mining 

``` 
./project1 <k>
```
  
> Add Workers in mininig process

``` 
./project1 <IP_ADDRESS OF SERVER>
```
 
 **Note : Mined Bit Coins and corresponing hash value will be printed only on server.**

# Implementation Details

- Components:
- Server
> Responsible to intialize all connections, send value of K to worker on request and spawn worker for mining.
- Worker
> Request **k** from server and start mining bit coins with k 0 prefixed and send found bit coins to Print Server.
- Print Server 
> Responsible to print bitcoins reciveed from workers.

- Work Unit :

We tried below combination to generate bitcoins with max k value.

Combinations with string generations
- Generate Hash on numeric sequence.
- Generate Hash on random string with random length of 0-10.
- Generate Hash on random string with length of 32 bytes.
- Generate Hash on random string with 64 bytes.

Combinations with system configration
- Generate bitcoins on single machine(4 cores) with 4 spwan workers.
- Generate bitcoins on single machine(4 cores) with 4 spwan workers, Print server and server.
- Generate bitcoins on configration with : one machine(4 cores) with 4 spwan workers, Print server and server and  one machine(8-core) with 8 worker process.
- Generate bitcoins on configration with : one machine(4 cores) with 4 spwan workers, Print server and server, one machine(8-core) with 8 worker process, one machine(4-core) 6 worker process.

Best Result for k = 8 on above configration :

``` Govinds-MacBook-Pro:bitcoin_miner cgovindrajan$ ./project1 8
chaitanyaakulkar4R9OMLlEOKP8imBsF0kkCse2ztQaPdtqbajM-ddF6tT20zS5c_i_E9CUBN4ow6H_	0000000061AB62CDAE64FCE62CCFC7A5C7E812E9A778E8EC3DC568FA7739133C
chaitanyaakulkar9qrbHtBkNV1Aa2aI8sYnrLJUwXsB7bEHqRzd877Tz-EHzC9V4jhtrQY6ScjTCXG4	00000000EE861F6C54662FC3B691559F6BF96C67C6C931ADF8060C89DCB5BAEF
```

Ratio of CPU time to Real time in this case is = (user + sys) / real = 

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

