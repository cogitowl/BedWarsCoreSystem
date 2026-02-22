# 关于这个数据包
tellraw @s ["[BedWars / Server Datapack]"]
tellraw @s ["    作者: ","YaJn与他的朋友们"]
tellraw @s ["    漏洞问题反馈: ",{"text":"[打开漏洞问题反馈清单]","click_event": {"action": "run_command","command": "/trigger about set -57129"}}]

scoreboard players set @s about 0