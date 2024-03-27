# Host a Domain from a Local or Cloud Linux Server

The Overte packages can help you get your own domain up and running quickly.

## Installation

You can run these same commands on an existing Overte domain to upgrade it if the original domain was installed using the package. Packages are currently available for the following distributions:

## Server:

### Debian 12

```bash
wget https://public.overte.org/build/overte/release/2023.11.1/overte-server_2023.11.1-debian-12-1_amd64.deb
sudo apt-get update && sudo apt-get install ./overte-server_2023.11.1-debian-12-1_amd64.deb
```

### Debian 11

```bash
wget https://public.overte.org/build/overte/release/2023.11.1/overte-server_2023.11.1-debian-11-1_amd64.deb
sudo apt-get update && sudo apt-get install ./overte-server_2023.11.1-debian-11-1_amd64.deb
```

### Ubuntu 22.04

```bash
wget https://public.overte.org/build/overte/release/2023.11.1/overte-server_2023.11.1-ubuntu-22.04-1_amd64.deb
sudo apt-get update && sudo apt-get install ./overte-server_2023.11.1-ubuntu-22.04-1_amd64.deb
```
### Ubuntu 20.04

```bash
wget https://public.overte.org/build/overte/release/2023.11.1/overte-server_2023.11.1-ubuntu-20.04-1_amd64.deb
sudo apt-get update && sudo apt-get install ./overte-server_2023.11.1-ubuntu-20.04-1_amd64.deb
```

### Fedora 38

```bash
wget https://public.overte.org/build/overte/release/2023.11.1/overte-server-2023.11.1-1.fc38.x86_64.rpm
sudo yum update && sudo rpm -i ./overte-server-2023.11.1-1.fc38.x86_64.rpm
```

### Fedora 37

```bash
wget https://public.overte.org/build/overte/release/2023.11.1/overte-server-2023.11.1-1.fc37.x86_64.rpm
sudo yum update && sudo rpm -i ./overte-server-2023.11.1-1.fc37.x86_64.rpm
```

### Rocky Linux 9

```bash
wget https://public.overte.org/build/overte/release/2023.11.1/overte-server-2023.11.1-1.el9.x86_64.rpm
sudo yum update && sudo rpm -i ./overte-server-2023.11.1-1.el9.x86_64.rpm
```

## aarch64 server:

### Debian 12

```bash
wget https://public.overte.org/build/overte/release/2023.11.1/overte-server_2023.11.1-debian-12-1_arm64.deb
sudo apt-get update && sudo apt-get install ./overte-server_2023.11.1-debian-12-1_arm64.deb
```

### Debian 11

```bash
wget https://public.overte.org/build/overte/release/2023.11.1/overte-server_2023.11.1-debian-11-1_arm64.deb
sudo apt-get update && sudo apt-get install ./overte-server_2023.11.1-debian-11-1_arm64.deb
```

### Ubuntu 22.04

```bash
wget https://public.overte.org/build/overte/release/2023.11.1/overte-server_2023.11.1-ubuntu-22.04-1_arm64.deb
sudo apt-get update && sudo apt-get install ./overte-server_2023.11.1-ubuntu-22.04-1_arm64.deb
```

### Fedora 38

```bash
wget https://public.overte.org/build/overte/release/2023.11.1/overte-server-2023.11.1-1.fc38.aarch64.rpm
sudo yum update && sudo rpm -i ./overte-server-2023.11.1-1.fc38.aarch64.rpm
```

### Fedora 37

```bash
wget https://public.overte.org/build/overte/release/2023.11.1/overte-server-2023.11.1-1.fc37.aarch64.rpm
sudo yum update && sudo rpm -i ./overte-server-2023.11.1-1.fc37.aarch64.rpm
```

### Unlisted Distribution

If you do not see your distribution listed here, you may compile your own server from source using the [Overte builder](https://github.com/overte-org/overte-builder).

## Configuration

The installation packages will create a domain at the default port location and configure a service to keep it running on that machine.

For the list of network ports that you will need to open and manage, see [here](../configure-settings/network-settings).

Connect a web browser to the server at port 40100. (If you are on the machine that the server is running on, this would be http://localhost:40100) Complete the initial setup wizard and you should have a functioning domain.

## Files and Server Configuration

The program files are installed in /opt/overte:
 - **/opt/overte** contains the executables
 - **/opt/overte/lib** contains libraries required for operation
 - **/opt/overte/plugins** is currently used for audio codecs
 - **/opt/overte/resources** is required for the administrative website

The executables in this folder (with the exception of <code>new-server</code>) cannot be launched from the command prompt without first setting <code>LD_LIBRARY_PATH=/opt/overte/lib</code>.

The file <code>/etc/opt/overte/default.conf</code> contains any environment variables necessary to running the domain.

All content is stored under <code>/var/lib/overte/default</code>. All files underneath <code>/var/lib/overte</code> are owned by the user <code>overte</code>, which is also the user that runs all domain-related processes.

## Services

The installation packages setup the following systemd services to manage the Overte domain:
- **overte-domain-server@default.service**: Manages the core domain server
- **overte-assignment-client@default.service**: Spawns and manages the assignment clients
- **overte-server@default.target**: Controls startup and shutdown of the above services

The <code>overte-server@default.target</code> service is the only one that is set to auto-start. Starting or stopping it will bring the other two services down.

The first two services log a large amount of data to their service journal. Checking their logs (via <code>systemctl status</code>) is a good way to ensure they are operating properly.

## Multiple Domains

The installation package is configured to permit multiple domains to run on a single server at different port numbers. New servers can be created using the following command:

```sh
/opt/overte/new-server <name> <base-port>
```

where <code>name</code> is a word used to name and manage the domain and <code>base-port</code> must be the the first of a range of four contiguous port numbers not overlapping with any other use on the system.

Assuming you created a new server with the name **my-server-two**, this would setup the following:
 - Environment variables in <code>/etc/opt/overte/**my-server-two**.conf</code>
 - Content stored in <code>/var/lib/overte/**my-server-two**</code>
 - Services launched as <code>overte-domain-server@**my-server-two**.service</code>, <code>overte-assignment-client@**my-server-two**.service</code>, and <code>overte-server@**my-server-two**.target</code>

## Deleting a Overte Server

Uninstall the package.

```sh
# Ubuntu/Debian
# Note: 'apt-get purge' will remove configuration files as well. Use 'apt-get remove' to keep them.
sudo apt-get purge overte-server
# Fedora/Rock Linux
sudo yum remove overte-server
```

### Deleting a Domain from a Multiple Domain Installation

Find the name of the domain that you want to remove.

```sh
sudo ls ~overte
```

Pick the name of the domain that you want to remove from the list and then stop it.

```sh
sudo systemctl stop overte-server@<INSERT NAME HERE>.target
```

Disable the service for the domain.

```sh
sudo systemctl disable overte-server@<INSERT NAME HERE>.target
```

Remove the associated environment variables.

```sh
sudo rm /etc/opt/overte/<INSERT NAME HERE>.conf
```

Remove all data and configurations.

```sh
sudo rm -rf ~overte/<INSERT NAME HERE>
sudo rm -rf /var/lib/overte/<INSERT NAME HERE>
```

## Legacy Services

There are a number of tweaks that are made to the default configuration to simplify storage and the ability to run multiple domains on one server. In case you would like to remove this logic and run the servers closer to how a Overte server compiled from source would run, this is provided as an option.
 - Systemd services named <code>overte-domain-server.service</code>, <code>overte-assignment-client.service</code>, and <code>overte-server.target</code> *(without the @name)* have simplified configuration
 - No file is provided to specify environment variables for the server
 - Content would be stored in <code>/var/lib/overte/.local</code>
