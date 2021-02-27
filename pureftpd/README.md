# Important Configurations

pure-ftpd uses files in `/etc/pure-ftpd/conf` for configuration. Need to have a file named `DontResolve` with `yes` in it to prevent domain name resolution. Otherwise, it may takes 20 seconds to connect to the ftp server if the resolution fails.
