# Host a Domain from a Local or Cloud Linux Server

The Overte packages can help you get your own domain up and running quickly.

## Installation

If you are setting up Linux just for an Overte server, **Debian is recommended** as it is popular among Overte developers.

### Debian, Ubuntu and derivates

Download the latest package for your distribution from [public.overte.org](https://public.overte.org/index.html#build/overte/release/).
You can copy the link to the relevant package and download it directly to your remote server using <code>wget</code>. E.g.:
```bash
wget https://public.overte.org/build/overte/release/VERSION/overte-server_REST-OF-PACKAGE-NAME_amd64.deb
```
Pay attention to the amd64 and arm64 in the file name; You want **amd64** unless you are installing to a Raspberry Pi or another ARM machine.
If you are not sure which version of Debian or Ubuntu you are using, run `cat /etc/os-release`.

To actually install the package run the following command(s), replacing `overte-server_REST-OF-PACKAGE-NAME_amd64.deb` with the file name of whatever package you are trying to install:
```bash
sudo su  # This may or may not be needed.
apt update && apt install ./overte-server_REST-OF-PACKAGE-NAME_amd64.deb
```

Keep in mind that *apt* might print the following notice, which is **safe to ignore**: `Notice: Download is performed unsandboxed as root as file 'overte-server.deb' couldn't be accessed by user '_apt'. - pkgAcquire::Run (13: Permission denied)`

You can run these same commands on an existing Overte domain to upgrade it if the original domain was installed using the package.


### Fedora

Our Fedora packages aren't as well tested and used as for example Debian/Ubuntu packages; Please report any issues you are running into on our [GitHub issue tracker](https://github.com/overte-org/overte/issues) or on Matrix or Discord.

Download the latest package for your distribution from [public.overte.org](https://public.overte.org/index.html#build/overte/release/).
You can copy the link to the relevant package and download it directly to your remote server using <code>wget</code>. E.g.:
```bash
wget https://public.overte.org/build/overte/release/VERSION/overte-server-REST-OF-PACKAGE-NAME.x86_64.rpm
```
Pay attention to the x86_64 and aarch64 in the file name; You want **x86_64** unless you are installing to a Raspberry Pi or another ARM machine.
If you are not sure which version of Fedora you are using, run `cat /etc/os-release`.

To actually install the package run the following command(s), replacing `overte-server_REST-OF-PACKAGE-NAME_x86_64.rpm` with the file name of whatever package you are trying to install:
```bash
sudo su  # This may or may not be needed.
yum update && rpm -i ./overte-server_REST-OF-PACKAGE-NAME_x86_64.rpm
```

You can run these same commands on an existing Overte domain to upgrade it if the original domain was installed using the package.


### Docker

If you do not see your distribution listed here, you may try our Docker images, available for both amd64 and aarch64.

Go to whichever folder you want the Overte server to save its logs and files to, and run the following to start the container:
```bash
docker run -d --name overte-server -p 40100-40102:40100-40102 -p 40100-40102:40100-40102/udp -p 48000-48006:48000-48006/udp -v $(pwd)/logs:/var/log -v $(pwd)/data:/root/.local/share/Overte --restart unless-stopped overte/overte-server:latest
```
Keep in mind that the ports currently cannot be changed using Overte's Docker image. Doing so will cause connectivity issues for some people (but may work fine for others).

The container restarts automatically when the host machine is restarted.

Since the ports cannot be changed without modifying the container, it isn't currently feasible to run multiple Overte servers on one machine using Docker.


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
# Fedora/Rocky Linux
sudo yum remove overte-server
# Docker
docker container rm overte-server
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
