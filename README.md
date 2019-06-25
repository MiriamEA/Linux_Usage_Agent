

## 1. Introduction
The Host Agent is an internal programm that keeps track of hardware specifications and resource usage of all serves in the cluster. 
It allows the infrastructure team to monitor the resource usage (CPU, memory, ...).

## 2. Architecture
![Cluster](https://github.com/MiriamEA/Linux_Usage_Agent/blob/master/Cluster.jpg)
### 2.1. Tables
#### host_info table
The host_info table stores the hardware information of all servers in the cluster. It stores the name, the size of the L2 cache in kB, the total memory in kB, and the time the server was added to the database. It also stores the following cpu information: the number of CPUs, the architecture, the model, and the MHz. Each server is identified by a unique id.

#### host_usage tabel
The host_usage table stores the information on the resource usage of every server. More specifically it stores the time the information was taken, the size of free memory in mMB, the percentage of idel CPU, the percentage of CPU kernel used, the number of IO disks, and the size of available disk at the root in MB.

### 2.2. Scripts
The script init.sql is used to create the the database tables. The script host_info.sh creates an entry in the host_info table for the server it is run on. The script host_usage.sh creates an entry in the table host_usage every time it is run for the server it is run on.

## 3. Usage
### 3.1. Initiate database and tables
The database has to be created by hand (logging on the psql and running the create database command. Once the database is created the script init.sql can be run to create the two tables.
### 3.2. host_info.sh usage
The script host_info.sh needs to be run once on every server it can be monitored. When this script is run it expects five arguments to be passed: psql host, psql port, database name, psql user, and psql password.
It is run with the following command: ```bash host_info.sh psql_host psql_port, db_name, psql_user psql_password ```.
### 3.3. host_usage.sh usage
The script host_usag.sh needs to be run whenever you want to get the current information on the resource usage.. When this script is run it expects five arguments to be passed: psql host, psql port, database name, psql user, and psql password.
It is run with the following command: ``` bash host_usage.sh psql_host psql_port db_name psql_user psql_password ```.
### 3.4. crontab
crontab can be used to automate the executing of the script host_usage in regular intervals. Adding the following job to crontab will run the script once every minute and create a log-file: 
```* * * * * bash path/host_usage.sh psql_host psql_port db_name psql_user psql_password > /tmp/host_usage.log```

## 4. Improvements
