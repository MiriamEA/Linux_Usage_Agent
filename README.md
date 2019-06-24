
## Introduction
The Host Agent is an internal programm that keeps track of hardware specifications and resource usage of all serves in the cluster. 
It allows the infrastructure team to monitor the resource usage (CPU, memory, ...).

## Architecture
![Cluster](https://github.com/MiriamEA/Linux_Usage_Agent/blob/master/Cluster.jpg)
### Tables
#### host_info table
The host_info table stores the hardware information of all servers in the cluster. It stores the name, the size of the L2 cache in kB, the total memory in kB, and the time the server was added to the database. It also stores the following cpu information: the number of CPUs, the architecture, the model, and the MHz. Each server is identified by a unique id.

#### host_usage tabel
The host_usage table stores the information on the resource usage of every server. More specifically it stores the time the information was taken, the size of free memory in mMB, the percentage of idel CPU, the percentage of CPU kernel used, the number of IO disks, and the size of available disk at the root in MB.

### Scripts
The script init.sql is used to create the the database tables. The script host_info.sh creates an entry in the host_info table for the server it is run on. The script host_usage.sh creates an entry in the table host_usage every time it is run for the server it is run on.

## Usage
### Initiate database and tables
### host_info.sh usage
### host_usage.sh usage
### crontab

## Improvements
