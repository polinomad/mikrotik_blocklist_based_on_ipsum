import requests
from datetime import datetime

# URL for downloading IP addresses
url = "https://raw.githubusercontent.com/stamparm/ipsum/refs/heads/master/levels/3.txt"

# Downloading and splitting IP addresses
response = requests.get(url)
ips = response.text.split("\n")

# Sorting IP addresses in ascending order based on the value of the first octet
ips = [ip for ip in ips if ip.strip()]  # Removing empty lines
ips.sort(key=lambda ip: int(ip.split('.')[0]))

# Adding date and time
now = datetime.now()
date_str = f"#Generated on: {now.strftime('%Y-%m-%d %H:%M:%S')}\n"

# Initialization
output = date_str + ":local ips { \\\n"

# Adding IP addresses to the output
for i in range(len(ips)):
    ip = ips[i].strip()
    if ip:
        if i < len(ips) - 1:
            output += f"{{ \"{ip}\" }};\\\n"
        else:
            output += f"{{ \"{ip}\" }};\n"


output += "};\n:foreach ip in=$ips do={\n\t/ip firewall address-list add list=blacklist address=$ip\n}"

# Replace with your preferred save location
with open("blacklist.rsc", "w") as file:
    file.write(output)

print(output)
