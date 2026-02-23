# 开始游戏

tag @a[team=lobby] add player

# 更新 Bossbar
data modify storage bw:lobby bossbar_message set value {"text":"正在启动游戏中！"}
bossbar set lobby name [{"storage":"bw:lang","nbt":"lobby.map.choice.now","interpret": true}," | ",{"storage":"bw:lobby","nbt": "bossbar_message","interpret": true}]

# 消息提示
title @a actionbar {"storage":"bw:lang","nbt":"lobby.map.choice.change","interpret": true}

# 延迟开始
schedule function bw:game/start 1t replace