# multiping
A simple bash script to perform pings multiple pings from a remote host to another remote host in parallel

# What it does
multiping is a very simple bash script which gets as input a list of hosts in the format of <from_host>,<to_host>,<packets> and ssh in each of from_host and pings to_host with the number of packets specified in the file. Then it prints out the average latency and packet loss for each pair of hosts.
Note that the script connects to the hosts in parallel

#Example

Create a file named ping_hosts.csv and enter
```
grvgw1,grvgw2,5
grvgw2,grvgw1,5
```

Of course you need to adjust the host names to your needs, the format of the file is

<from_host>,<to_host>,<packets>

Now execute the script with the created file as parameter, it should ouput something like this
```
multiping.sh ping_hosts.csv
time,from,to,packet_loss,avg_latency
2023-02-01T17:19:26Z,grvgw1,grvgw2,0,1.719
2023-02-01T17:19:27Z,grvgw2,grvgw1,0,6.162
```
