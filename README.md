# dhcp-cni
## Overview

The DHCP CNI plugin can get the IP address allocated by a DHCP server that is already running on your network.
Since the DHCP lease period must be periodically updated during the life of the container, a separate daemon is required to start.
The same plugin binary can also be run in the daemon mode.

## Operation
To use the dhcp IPAM plugin, first launch the dhcp daemon:

```
# Make sure the unix socket has been removed
$ rm -f /run/cni/dhcp.sock
$ ./dhcp daemon
```
