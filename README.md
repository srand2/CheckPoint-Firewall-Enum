# CheckPoint-Firewall-Enum
simple bash script to obtain the firewall's hostname and ICA name.

Based on https://book.hacktricks.xyz/network-services-pentesting/pentesting-264-check-point-firewall-1

### How To
```
git clone https://github.com/srand2/CheckPoint-Firewall-Enum.git
cd CheckPoint-Firewall-Enum && chmod +x Checkpoint-Firewall-Enum.sh

 ./checkpoint-firewall-enum.sh ips.txt
```

### Why? 
I created this script after playing around with the ASN tool https://github.com/nitefood/asn in combination with mapcidr https://github.com/projectdiscovery/mapcidr from ProjectDiscovery.

**asn find net cidr for target domain**
```
asn example.com  
├NET 93.184.216.0/24 (EDGECAST-NETBLK-03)
```

**use mapcidr to create a list of all the ips in that cidr block**
```
echo "93.184.216.0/24 " | mapcidr | tee -a mapcidr-urls.txt
```

**asn shodan scan**
```
asn -s < mapcidr-urls.txt 
└ POR  264
```

**in my specific case there were many open 264 ports which leads me to this
**
```
./checkpoint-firewall-enum.sh ips.txt
```

