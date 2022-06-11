# batcaplog

Battery capacity logger, that records battery capacity over time.

This is a very small bash script that does nothing else but write a line to a csv file `/var/log/batcaplog` each time it is run.

The prepared systemd units make sure that the script is run every day.

## Usage

Once installed, for the script to take effect, the timer unit needs to be enabled.

```
systemctl enable batcaplog.timer
```

You can check that it is enabled by running.

```
systemctl list-timer --all
```

If batcaplog.timer is on the list and it has a `NEXT` time, then it was successfully enabled.

## Install

The script and systemd units can be installed with the provided `Makefile`.

Make sure you run `make` as root.

```
make install
```

## Uninstall

The script and unit files can be uninstalled the same way they were installed.

```
make uninstall
```
