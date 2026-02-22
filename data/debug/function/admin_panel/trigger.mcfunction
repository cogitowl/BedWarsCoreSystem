# 管理员菜单

# 一共两个部分
# 第一部分: 反馈事项
# 第二部分: 快捷操作/调试

# 第二部分 (一):
# 系统：重置游戏 (开始游戏 测试游戏)/结束游戏 维护模式 
# 队伍：自动分配 平均分配 复活特定床/摧毁床
# 规则: 游戏规则是否由管理员来控制 重置规则 同步规则
# 追踪：伤害追踪 死亡信息 射线路径 
# 
# 第二部分 (二):
# 地图方面:
# 传送到地图本体 启用/禁用地图 恢复地图 导入地图
# 维护方面:
# 维护通知 维护模式 自动结束 环境监测 

# 如果正在专注于 地图编辑 则自动进入 地图编辑菜单
execute if score @s map_editor_focus = @s map_editor_focus run return run function debug:map_editor/panel/trigger

# 清理聊天
tellraw @s "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

# 维护项
execute unless score @s bug_tracker_focus = @s bug_tracker_focus run function debug:bug_tracker/printer/debug_panel/trigger
execute if score @s bug_tracker_focus = @s bug_tracker_focus run function debug:bug_tracker/management/trigger

# 标题
execute if score $debug_mode debug matches 1 run summon marker ~ ~ ~ {CustomName:[{"text":"游戏标记为维护模式","color":"yellow"}],Tags:["debug"]}
execute if score $working gaming matches 1 run summon marker ~ ~ ~ {CustomName:[{"text":"游戏正在进行中, 请谨慎操作","color":"yellow"}],Tags:["debug"]}

execute if entity @e[type=marker,tag=debug] run tellraw @s [{"text":"\n ❇  ","color":"aqua"},{"text":"控制面板"},{"text":" // ","color": "gray"},{"selector":"@e[type=marker,tag=debug]","separator":{"text":"\n"}}]
execute unless entity @e[type=marker,tag=debug] run tellraw @s [{"text":"\n ❇  ","color":"aqua"},{"text":"控制面板"},{"text":" // ","color": "gray"},{"text":"⬆ 维护项目 ⬇ 快捷操作","color":"white"}]

tellraw @s ""

## 收尾
kill @e[type=marker,tag=debug]

# 第一板块
## 系统
summon marker ~ ~ ~ {CustomName:{"text":"[重置游戏]","color":"white"},Tags:["debug1"]}
execute unless score $working gaming matches 1 run summon marker ~ ~ ~ {CustomName:{"text":"[开始游戏]","color":"white"},Tags:["debug2"]}
execute if score $working gaming matches 1 run summon marker ~ ~ ~ {CustomName:{"text":"[结束游戏]","color":"white"},Tags:["debug2"]}
execute if score $system_f3 debug matches 0 run summon marker ~ ~ ~ {CustomName:{"text":"[F3面板]","color":"gray"},Tags:["debug3"]}
execute if score $system_f3 debug matches 1 run summon marker ~ ~ ~ {CustomName:{"text":"[F3面板]","color":"white"},Tags:["debug3"]}
tellraw @s ["     系统  >>   ", \
    {"selector":"@e[type=marker,tag=debug1]","click_event":{"action":"run_command","command":"/function init"},"hover_event": {"action": "show_text","value": "将所有系统及模块进行初始化"}},"  ", \
    {"selector":"@e[type=marker,tag=debug2]","click_event":{"action":"run_command","command":"/function debug:admin_panel/buttom/system_game_state"},"hover_event": {"action": "show_text","value": "将所有非 debug 玩家强制参与游戏或者强制结束游戏"}},"  ", \
    {"selector":"@e[type=marker,tag=debug3]","click_event": {"action": "run_command","command": "/function debug:admin_panel/buttom/system_f3"},"hover_event": {"action": "show_text","value": "启用/禁用 原版调试界面"}}]
kill @e[type=marker,tag=debug1]
kill @e[type=marker,tag=debug2]
kill @e[type=marker,tag=debug3]

## 队伍：平均分配 复活床/摧毁床 高亮出生点
execute if score $team_auto_allocation debug matches 0 run summon marker ~ ~ ~ {CustomName:{"text":"[自动分配]","color":"white"},Tags:["debug1"]}
execute if score $team_auto_allocation debug matches 1 run summon marker ~ ~ ~ {CustomName:{"text":"[自动分配]","color":"gray"},Tags:["debug1"]}
tellraw @s ["     队伍  >>   ", \
    {"selector":"@e[type=marker,tag=debug1]","click_event": {"action": "run_command","command": "/function debug:admin_panel/buttom/team_auto_allocation"},"hover_event": {"action": "show_text","value": "允许/禁止 未参与玩家在游戏开始后自动加入游戏"}}]
kill @e[type=marker,tag=debug1]

## 导入/编辑系统: 地图编辑器、商店导入器
summon marker ~ ~ ~ {CustomName:{"text":"[新建地图]","color":"white"},Tags:["debug1"]}
summon marker ~ ~ ~ {CustomName:{"text":"[编辑地图]","color":"white"},Tags:["debug2"]}
summon marker ~ ~ ~ {CustomName:{"text":"[启用商店导入器]","color":"white"},Tags:["debug3"]}
tellraw @s ["     编辑  >>   ", \
    {"selector":"@e[type=marker,tag=debug1]","click_event": {"action": "run_command","command": "/function debug:map_editor/command/new_map"},"hover_event": {"action": "show_text","value": "点击此处开始导入一张全新地图!"}},"  ", \
    {"selector":"@e[type=marker,tag=debug2]","click_event": {"action": "suggest_command","command": "/scoreboard players set @s map_editor_focus <地图ID(纯数字)>"},"hover_event": {"action": "show_text","value": "编辑一个已经存在的地图"}},"  ", \
    {"selector":"@e[type=marker,tag=debug3]","click_event": {"action": "run_command","command": "/function debug:shop_import/init"},"hover_event": {"action": "show_text","value": "启用由 Thz922 贡献的箱子商店导入器"}}]
kill @e[type=marker,tag=debug1]
kill @e[type=marker,tag=debug2]
kill @e[type=marker,tag=debug3]

# 第二板块
## 玩家

### 保存玩家名称
data remove storage debug:panel_trigger player_show
execute as @a run function debug:admin_panel/buttom/player_show_sec

scoreboard players set $player_serial temp 0
execute store result score $player_transfer temp if entity @a
execute if score $player_transfer temp matches 1.. run tellraw @s ["\n","     玩家  >>  在下方列表中选择你想要操控的玩家 ",{"text": "[刷新列表]","click_event": {"action": "run_command","command": "/function debug"}}]
function debug:admin_panel/buttom/player_show_third

scoreboard players reset $player_serial temp
scoreboard players reset $player_transfer temp
data remove storage bw:basic temp.player

## 服务器维护
tellraw @s ""

execute if score $notification maintenance matches 0 run summon marker ~ ~ ~ {CustomName:{"text":"[维护通知]","color":"gray"},Tags:["debug1"]}
execute if score $notification maintenance matches 1 run summon marker ~ ~ ~ {CustomName:{"text":"[维护通知 启用]","color":"white"},Tags:["debug1"]}
execute if score $disable_player_vote maintenance matches 0 run summon marker ~ ~ ~ {CustomName:{"text":"[玩家投票]","color":"gray"},Tags:["debug2"]}
execute if score $disable_player_vote maintenance matches 1 run summon marker ~ ~ ~ {CustomName:{"text":"[玩家投票 禁用]","color":"white"},Tags:["debug2"]}
execute if score $disable_environment_check maintenance matches 0 run summon marker ~ ~ ~ {CustomName:{"text":"[环境检测]","color":"gray"},Tags:["debug3"]}
execute if score $disable_environment_check maintenance matches 1 run summon marker ~ ~ ~ {CustomName:{"text":"[环境检测 禁用]","color":"white"},Tags:["debug3"]}
execute if score $disable_auto_ending maintenance matches 0 run summon marker ~ ~ ~ {CustomName:{"text":"[自动结束]","color":"gray"},Tags:["debug4"]}
execute if score $disable_auto_ending maintenance matches 1 run summon marker ~ ~ ~ {CustomName:{"text":"[自动结束 禁用]","color":"white"},Tags:["debug4"]}
execute if score $disable_command_block maintenance matches 1 run summon marker ~ ~ ~ {CustomName:{"text":"[命令方块]","color":"gray"},Tags:["debug5"]}
execute if score $disable_command_block maintenance matches 0 run summon marker ~ ~ ~ {CustomName:{"text":"[命令方块 禁用]","color":"red"},Tags:["debug5"]}

tellraw @s ["     维护  >>   ", \
    {"selector":"@e[type=marker,tag=debug1]","click_event": {"action": "run_command","command": "/function debug:admin_panel/buttom/maintenance_notification"},"hover_event": {"action": "show_text","value": "玩家在载入服务器时是否通知维护事件"}},"  ", \
    {"selector":"@e[type=marker,tag=debug2]","click_event": {"action": "run_command","command": "/function debug:admin_panel/buttom/maintenance_disable_player_vote"},"hover_event": {"action": "show_text","value": "是否禁止玩家进行地图投票"}},"  ", \
    {"selector":"@e[type=marker,tag=debug3]","click_event": {"action": "run_command","command": "/function debug:admin_panel/buttom/maintenance_disable_environment_check"},"hover_event": {"action": "show_text","value": "是否停止游戏开始前的基础环境检测"}},"  \n                 ", \
    {"selector":"@e[type=marker,tag=debug4]","click_event": {"action": "run_command","command": "/function debug:admin_panel/buttom/maintenance_disable_auto_ending"},"hover_event": {"action": "show_text","value": "是否阻断游戏自动结束逻辑"}},"  ", \
    {"selector":"@e[type=marker,tag=debug5]","click_event": {"action": "run_command","command": "/function debug:admin_panel/buttom/maintenance_command_block"},"hover_event": {"action": "show_text","value": "是否禁用命令方块"}}]

execute if score $total bug_tracker_focus matches 1.. run tellraw @s "      ✎ 正在进行的维护项 >>"
execute if score $total bug_tracker_focus matches 1.. run function debug:bug_tracker/printer/lobby/trigger

kill @e[type=marker,tag=debug1]
kill @e[type=marker,tag=debug2]
kill @e[type=marker,tag=debug3]
kill @e[type=marker,tag=debug4]
kill @e[type=marker,tag=debug5]

## 地图
# summon marker ~ ~ ~ {CustomName:'{"text":"[导入地图]","color":"white"}',Tags:["debug1"]}
# tellraw @s ["     地图  >>   ", \
    # {"selector":"@e[type=marker,tag=debug1]","click_event": {"action": "run_command","value": "/function debug:importer/map/start"},"hover_event": {"action": "show_text","value": "导入新的地图"}},"  "]

# 末尾
tellraw @s ""

# 发送点击音效
function lib:sounds/hit