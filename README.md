# mikrotik-blocklist-based-on-ipsum

This list is inspired by the [ipsum](https://github.com/stamparm/ipsum?tab=readme-ov-file) found on GitHub, specifically the Level 3 filtering list. Since the list is only available in raw format in a txt file, I thought I would create a Python script that queries it weekly and converts it into a format that can be processed by the router. The automated script then downloads and installs it on my router.
The script was primarily created for myself, but I thought I'd publish it so that others can benefit from it too.


The weekly update and the Level 3 list are perfectly suitable for me. Level 3 has enough feedback to ensure that false positive IP addresses are minimized.
Of course, anyone who finds this unsuitable can download the Python script and modify it to their liking.

I would rather recommend this instead of the filter list, unless using the filter list is specifically the goal.
```
/ip firewall raw add action=drop chain=prerouting src-address-list=ipsum_blacklist
```
This is beneficial because:
- The raw table rules + (prerouting) take effect at the earliest point, even before packets are processed by any other firewall or routing rules. Thus, CPU load is minimized.
- Dropping unwanted traffic at an early stage can increase network security, as malicious packets cannot reach deeper levels of defense.


## Install
1. Download `install.rsc` and upload it to your device
2. In the Mikrotik terminal run:  `/import install.rsc `
3. Finish
