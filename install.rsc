/tool fetch url="https://raw.githubusercontent.com/polinomad/mikrotik_blocklist_based_on_ipsum/refs/heads/main/ipsum_blacklist.rsc"
/import file-name=ipsum_blacklist.rsc
/file remove ipsum_blacklist.rsc

/system scheduler
add interval=7d name="ipsum_blacklist_timer" start-date=Jan/01/2025 start-time=03:00:00 on-event=ipsum_blacklist_script

/system script
add name="ipsum_blacklist_script" source={/tool fetch url="https://raw.githubusercontent.com/polinomad/mikrotik_blocklist_based_on_ipsum/refs/heads/main/ipsum_blacklist.rsc" mode=https;
/ip firewall address-list remove [find where list="ipsum_blacklist"]; /import file-name=ipsum_blacklist.rsc; /file remove ipsum_blacklist.rsc}
