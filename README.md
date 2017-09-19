# Project1 : BIT COIN MINER

**Group members**

| Name                 | UFID     | Email ID                 |
| :------------------: | :------: | :----------------------: |
| Govind Rajan Chandra | 26113109 | cgovindrajan@ufl.edu     |
| Chaitanya Kulkarni   | 19160119 | chaitanyaakulkar@ufl.edu |

# Project Defination

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


Execution for k = 4
```
Govinds-MacBook-Pro:bitcoin_miner cgovindrajan$ time ./project1 4
chaitanyaakulkardQJ0-TyIZTBmtgMpAubawDquSuAqW3XwlpCLDnqujGqxvnpVsBJfaFHpbG-SSg8d	0000CF429631937FFAA4B7F42525F14D47C5C84E8185115202BBA90BFA87BD0A
chaitanyaakulkaroW4-Y3tnlb6U_JPuudp_a47NVkLJgp1Z9OFxcuL5vz8kVe7ig_r-sBpuLKvudD0j	0000A79753734F7373BEB0E6FE355B67A9CE202B76D48B09058C73031515C7F8
chaitanyaakulkarwZ5zQsVvZABK0o4kEY6LU4Vj1mQGQBXxTnBAcZizbFkVCmmcNT8jfkxznCKvCXHp	0000C11F7277CF3FF67C2C793EFF467C97CD7BF293DE24EDDD4E7C45A83E9A1D
chaitanyaakulkarUWwKaAkw87GT4N2k2l9vecoF3E9AM1QF-Q_aKbT__T20PayHu3JAMdqTvTBUMkry	0000336AD85347D4461DB42BE6FE813357E18F219F5B6CB9533D5C87027DEA50
chaitanyaakulkar1LmWJZUnlOjeGz58yHV9vAySsiQSJg20OVQG1jqOwYwgIzILvn1_5Ru8iN17i8cF	000002C3D3432656043E821769D577CED3E56FD747895615E4DB65A9E3A1C8B6
chaitanyaakulkars2m_QVN7D7S5rlAMSu4fo_sWx9uJJsIJp8q02uSRXQMYCBPy8el-A8a1ZUXmcKNr	0000623862BB0E3D051E1FE41E32BE81A9AC6A3B872DAA605BCA0C15EEDA1314
chaitanyaakulkarmaJtCm7lMJbWyCnRFaLONf7-hsKdQr-vemYN3bt7aLCX-MIo8HJAfHZ98vSJWpxP	0000F0D6C6CE1899351E52AC426CC0856A686400BD5F267432576A3F52B76427
chaitanyaakulkarEDQh642WXwJZ7SZn7NiKU5pfKbLTUAifDjksjph5sxDJo4P4EhJHAGhyIXklwxCw	00009120A64A9F676799B7D1412B20EA53ADE98BEC80AF94E18B39087FE09FA6
chaitanyaakulkarX1Bh0CAahBwss99b8_6nh99RzXhB49HeE92NIm_II_43TPZQ8rRh5IiYhvoWiMLE	0000845226216854A9EE79DEE216BC0BD70ED7311CFA3E19E863B6D8127D69DC
chaitanyaakulkar_ijIOPjwRIpLAvxtvsDCw7P5nWIJHaGrKRsUUBUt-AoLBJIecDz6AWVhDbsYY6IX	0000D26D2877EA7F447A639B54916E9484AA312EB2CF98AF675B1BC391EF8886
chaitanyaakulkarrE13nIYCvZxQ-smeLTrhdSG-n5JXIipnVHuZRzPKG6l3x3z4_fh_3WVHysMpNFS2	0000352E8577E61F7A3E8E1621C81FE066FE847472F28CF01FC40FDB97C8C4B9
chaitanyaakulkarj9JTYREKzssmNvTMQaVJkiretBq6aYT9ep6YDeOP-M0HIe6a-i2PjxU-wYHcs_Nk	0000DA9B679E03906956B948E5B19E87DCC78506B2734E217FD4766A915F2622
^@chaitanyaakulkardQIbtvneAy21fLCFg-FWkmiRygDjvVAms05ZoawVdwWjxlhBtVTExx63Caq5g-8N	0000949A1403682AB3C9DE8AFEF9833C9B96B701504C1013A18C165DB6F34A11
chaitanyaakulkarq3ZxOnx1A0Hn4w3lTAjy38hUy8LHn07prkxjDNwlpDFmvN-jIXpqflKx7VKTUz1X	00000135978EFD35A788F368429571AA8A5A22959A9BF66318E7B9BC37AEC5D5
^@chaitanyaakulkar5eagl_pmE4cQKjUlfaZpiDnJh6-veZpYHXRAMFcNJonu2CEGdPtnqaM9sGj7l8ip	00006177A5BB2192812CD382573DD3E6250D833401CABC8F862ECD1C2B767D9E
chaitanyaakulkar-IJjpvuvt-jGKKQUQXzNGRWIf5RIZpIFZm-LVNzW56DdKCix_xN9sznsbfutjE6f	0000F004720A355D395D74B7C380175B97CAFC314CBBE9A2A64B2C62384429BA
chaitanyaakulkarktLuckaka8ueY3o8Sw8or-8fiQ2NYav-l5nmFNUriOt3DKbsDc1P1ADNVf2kdMZ6	00002A2D8D36FEBE1F141B8EC3591072E57846C4DBB29D96C230B21ECFBE76DE
chaitanyaakulkaryqrhfMn7RgVLB-GMIk1FJadzepy7tdA5Ln94lje-oKx_1ccuNSX6qJkq6ABG9Ayb	00003A1E222FBD101CA89D5A2380F7E0E888680F6F21E89FD1DDE7A596E4EA66
```

Execution for k = 5
```
Govinds-MacBook-Pro:bitcoin_miner cgovindrajan$ time ./project1 5
chaitanyaakulkarF7D1Z2RjNNUKir9v2vOVZTuYZzcXWMNnv3zzUNdtBVliUiMa7_rC_9f1CTKr5-6q	00000CC8D3BE043DF2DB3C0AF9EEFB9A0174C1F475156CA1901FD5672CC59BF2
chaitanyaakulkaroQeG_3UppHG78hhegyx7WjtOEsYXRt1p_f71HWo0xmqjio3y1iSsq4DFHSeI1718	0000058BD9D151705C6DE61AD06851383C8EF88BD4426148185A6D94B4F3D543
chaitanyaakulkarfbobZhTpoZkDFatBZ71LErS6tiPX2jUBDVtrjUZwSAn3nMr9zf1zTJaOQn-lrJH_	0000036CA2E63338F92A37FB18673064E31493EA46DC7BDC95DF6A0F19AF3BA0
chaitanyaakulkarm6dFTsgqvogmknyvbiyk_dIBHRqXMsR-bm5vEwW2IiWoUdQ0cda-cPqFUt7EIz_O	000002AE9187C26EEA475149AF0D47F9D8C4D5946DA65F9C25A7A10DE3688D52
chaitanyaakulkar_8nGgYaSZ-Vntd5DqEhBQZ0DfkBbcurCOQ_7pH44uLnbMwboDpVBc2dFBIJcoZTJ	00000D678EE74232C80846F80E68AC805D7753E57A59C2A45FD8346486651DD0
chaitanyaakulkarwI3N4B2FSn4b5-zXJbRd5EAiMSLD3IoF67825NqqZkLZVU4f69yEp-_GzJz1yPtD	00000779C218B879A7349C41D5814C48039C4AC5DC5F776CD9DA086D245EEB69
chaitanyaakulkargVHB3pw2tc-pEOJbd_tZPpQ08AkWuuddEo47GQecduh9NGVDHNOMkMUMbPHz7g13	00000D256C51D7F35723D327198C549E29B2EBD0D8522B4ADB4AFD2398A8D8CE
chaitanyaakulkarGK4TqEMHbEpVnTe79YfP7-Fro5lCus989u-roU_vjiagww1lj2PgYYsD7aGIJxso	00000FFD1288437C614DC424AF0D53C70BC73D6172135116D22806840FDA1607
chaitanyaakulkark4v6K8k4TrUz2IrHQF1wL0Omk5ikqgwBQG9bBlLqUN7XCZeh0d129YPHpHVphBga	00000F15D0C0FDF050768E31FAD587595377FE7FBBE9E6E3F818DAE1BE34904F
^C

real	0m21.306s
user	1m19.911s
sys	0m2.626s
```


Ratio of CPU time to Real time in this case is = (user + sys) / real = ( 80 + 3 ) / 21 = ~ 4

Best Result for k = 8 on below configration :

``` Govinds-MacBook-Pro:bitcoin_miner cgovindrajan$ ./project1 8
chaitanyaakulkar4R9OMLlEOKP8imBsF0kkCse2ztQaPdtqbajM-ddF6tT20zS5c_i_E9CUBN4ow6H_	0000000061AB62CDAE64FCE62CCFC7A5C7E812E9A778E8EC3DC568FA7739133C
chaitanyaakulkar9qrbHtBkNV1Aa2aI8sYnrLJUwXsB7bEHqRzd877Tz-EHzC9V4jhtrQY6ScjTCXG4	00000000EE861F6C54662FC3B691559F6BF96C67C6C931ADF8060C89DCB5BAEF
```

Largest Number of Working Machine : 3 
