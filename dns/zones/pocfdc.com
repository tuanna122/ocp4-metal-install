$TTL    604800
@       IN      SOA     vm-bastion.lab.pocfdc.com. contact.lab.pocfdc.com (
                  1     ; Serial
             604800     ; Refresh
              86400     ; Retry
            2419200     ; Expire
             604800     ; Minimum
)
        IN      NS      vm-bastion

vm-bastion.lab.pocfdc.com.          IN      A       172.16.40.120

; Temp Bootstrap Node
vm-bootstrap.lab.pocfdc.com.        IN      A      172.16.40.126

; Control Plane Nodes
vm-master01.lab.pocfdc.com.         IN      A      172.16.40.121
vm-master02.lab.pocfdc.com.         IN      A      172.16.40.122
vm-master03.lab.pocfdc.com.         IN      A      172.16.40.123

; Worker Nodes
vm-worker01.lab.pocfdc.com.        IN      A      172.16.40.124
vm-worker02.lab.pocfdc.com.        IN      A      172.16.40.125

; OpenShift Internal - Load balancer
api.lab.pocfdc.com.        IN    A    172.16.40.120
api-int.lab.pocfdc.com.    IN    A    172.16.40.120
*.apps.lab.pocfdc.com.     IN    A    172.16.40.120

; ETCD Cluster
etcd-0.lab.pocfdc.com.    IN    A     172.16.40.121
etcd-1.lab.pocfdc.com.    IN    A     172.16.40.122
etcd-2.lab.pocfdc.com.    IN    A     172.16.40.123

; OpenShift Internal SRV records (cluster name = lab)
_etcd-server-ssl._tcp.lab.pocfdc.com.    86400     IN    SRV     0    10    2380    etcd-0.lab
_etcd-server-ssl._tcp.lab.pocfdc.com.    86400     IN    SRV     0    10    2380    etcd-1.lab
_etcd-server-ssl._tcp.lab.pocfdc.com.    86400     IN    SRV     0    10    2380    etcd-2.lab

oauth-openshift.apps.lab.pocfdc.com.     IN     A     172.16.40.120
console-openshift-console.apps.lab.pocfdc.com.     IN     A     172.16.40.120
