/tool fetch url="https://raw.githubusercontent.com/polinomad/mikrotik_blocklist_based_on_ipsum/refs/heads/main/blacklist.rsc"
/import file-name=ipsum_blacklist.rsc

/system scheduler
add interval=7d name="blacklist_down_timer" start-date=Jan/01/2025 start-time=03:00:00 on-event=ipsum_blacklist_down
add interval=7d name="blacklist_update_timer" start-date=Jan/01/2025 start-time=03:05:00 on-event=ipsum_blacklist_update

/system script
add name="ipsum_blacklist_down" source={/tool fetch url="https://raw.githubusercontent.com/polinomad/mikrotik_blocklist_based_on_ipsum/refs/heads/main/blacklist.rsc" mode=https}
add name="ipsum_blacklist_update" source {/ip firewall address-list remove [find where list="ipsum_blacklist"]; /import file-name=ipsum_blacklist.rsc; /file remove ipsum_blacklist.rsc}
