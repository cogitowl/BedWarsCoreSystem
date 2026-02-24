# 每 20 Tick 执行一次
schedule function bw:global/clock/20tick 20t replace

# 状态执行
execute if score $working gaming matches 0 run function bw:lobby/tick20
execute if score $working gaming matches 1 run function bw:game/tick/20tick
execute if score $working gaming matches 2 run function bw:game_end/tick20
execute if score $working gaming matches 3 run function bw:game_start/tick20

# 暴力的挂机检测
#! 需要重置
execute as @a[team=!debug] run tag @s add afk_check
tag @a[predicate=lib:sneaking] remove afk_check
tag @a[predicate=lib:sprinting] remove afk_check
tag @a[predicate=lib:swimming] remove afk_check
execute as @a unless score @s afk_time matches -1 run scoreboard players set @s[tag=!afk_check] afk_time 0
execute as @a unless score @s afk_time matches -1 run scoreboard players add @s[tag=afk_check] afk_time 1

tag @a[tag=afk_check] remove afk_check

# 禁止捡起箭（在落地 10 秒后清理）
execute as @e[type=arrow,tag=!projectile_checked] run function bw:global/event/arrow_nbt

# music controller
function bw:global/music/tick20

# 提示系统
function bw:global/tip/tick20

# 笨蛋检查器
execute unless entity @e[type=marker,tag=entity_loss] run save-off
execute unless entity @e[type=!player,tag=entity_loss] run tellraw @a ["",{"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n ☢  灾难性系统错误（全部实体丢失）","color":"aqua"},"\n",{"text": "     全局系统已丢失必要运作实体。为了保护游戏安全，系统已阻断自动保存。","color": "gray"},"\n\n",{"text": "      ☀ 如果您是玩家 >>\n"},{"text": "         请携带此提示的完整截图，在交流群与我们的服务器管理员取得联系。"},"\n\n",{"text": "      ☁ 如果您是汐之恒服务器管理员 >>\n"},{"text": "         请发送 "},{"text": "!!MCDR server kill","click_event": {"action": "suggest_command","command": "!!MCDR server kill"},"hover_event": {"action": "show_text","value": "单击自动填入 !!MCDR server kill "}}," 强制杀死子服进程。","\n"]