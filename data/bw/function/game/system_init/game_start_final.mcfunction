# 游戏开始文件

# 检测环境 
scoreboard players set $env_check temp 1
execute unless score $disable_environment_check maintenance matches 1 store result score $env_check temp run function bw:game/system_init/env_check
execute if score $env_check temp matches 2.. run function bw:game/system_init/env_check_fail
execute if score $env_check temp matches 2.. run return 1
execute if score $env_check temp matches 1.. run scoreboard players reset $env_check temp

# （地图接口）游戏开始
setblock 6 50 -32 minecraft:redstone_block

# 测试局设定
# execute if score $testing gaming matches 1 run scoreboard players set $countdown gaming -1

# 初始化随机事件（5秒后）
schedule function bw:game/mutation/trigger/game_start 5s replace

# 发送提示
tellraw @a {"storage":"bw:lang","nbt":"game.start","interpret": true}
title @a[tag=playing] title {"text":"游戏开始！",color:green}
title @a[tag=playing] subtitle [{"text":"",color:aqua},{"selector":"@s"}," 祝你好运！"]