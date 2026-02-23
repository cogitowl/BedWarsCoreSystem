

# 锁定地图
$execute unless data storage bw:map maps[{"id":$(id)d}].map_editor.lock run function debug:map_editor/operation/lock with storage debug:map_editor/panel data.$(uuid)

# 补全数据
$execute if data storage bw:map maps[{"id":$(id)d}].spawner run data modify storage bw:map maps[{"id":$(id)d}].map_editor.resource.status.done set value true

# 清理聊天
tellraw @s "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

# 标题
$tellraw @s [{"text":"\n 🏕  ","color":"aqua"},{"text":"正在编辑地图 "},$(map_name),{"text":" (","color": "gray"},{"text": "$(id)","color": "gray"},{"text":") ","color": "gray"}," ",{"text":"🔒 已锁定","hover_event": {"action": "show_text","value": "当前地图已经锁定\n系统自动跳过恢复地图任务、玩家无法选中地图"},"color":"gray"}]
tellraw @s ""

# 第一板块: 信息
tellraw @s ["     说明  >>   "]
tellraw @s ["          当前页面的操作将",{"text":"实时","bold": true},"写入到地图数据中"]
tellraw @s ["          这意味着这里的",{"text":"所有"},"操作都是",{"text":"不可逆转的","bold":true}]
tellraw @s ["          并且会",{"text":"立刻影响","bold": true},"地图的自动恢复,玩家游玩"]
tellraw @s ["          请在操作前 ",{"text":"再三确认","bold": true},", ",{"text":"点我备份","click_event": {"action": "suggest_command","command": "!!pb make 地图修改前备份"},"underlined": true}]
tellraw @s ["          如果需要覆写, 请先使用 Shift + 左键 清除数据"]
tellraw @s ""
tellraw @s ["     信息  >>"]
tellraw @s ["          简介 //"]
$tellraw @s ["            ",$(desc)]
tellraw @s ["          资源点 //"]
$tellraw @s ["            ","铜 ",{"storage":"bw:map","nbt": "maps[{'id':$(id)d}].spawner.number.copper"}," | 铁 ",{"storage":"bw:map","nbt": "maps[{'id':$(id)d}].spawner.number.iron"}," | 钻 ",{"storage":"bw:map","nbt": "maps[{'id':$(id)d}].spawner.number.diamond"}]
tellraw @s ""
# 第二板块: 操作

## 数据
$execute if data storage bw:map maps[{"id":$(id)d}].id run summon marker ~ ~ ~ {CustomName:{"text":"[ID]","color":"green"},Tags:["debug1"]}
$execute unless data storage bw:map maps[{"id":$(id)d}].id run summon marker ~ ~ ~ {CustomName:{"text":"[ID]","color":"red"},Tags:["debug1"]}

$execute if data storage bw:map maps[{"id":$(id)d}].name run summon marker ~ ~ ~ {CustomName:{"text":"[名称]","color":"green"},Tags:["debug2"]}
$execute unless data storage bw:map maps[{"id":$(id)d}].name run summon marker ~ ~ ~ {CustomName:{"text":"[名称]","color":"red"},Tags:["debug2"]}

$execute if data storage bw:map maps[{"id":$(id)d}].desc run summon marker ~ ~ ~ {CustomName:{"text":"[简介]","color":"green"},Tags:["debug3"]}
$execute unless data storage bw:map maps[{"id":$(id)d}].desc run summon marker ~ ~ ~ {CustomName:{"text":"[简介]","color":"red"},Tags:["debug3"]}

$execute if data storage bw:map maps[{"id":$(id)d}].border.min run summon marker ~ ~ ~ {CustomName:{"text":"[最小边界]","color":"green"},Tags:["debug4"]}
$execute unless data storage bw:map maps[{"id":$(id)d}].border.min run summon marker ~ ~ ~ {CustomName:{"text":"[最小边界]","color":"red"},Tags:["debug4"]}

$execute if data storage bw:map maps[{"id":$(id)d}].border.max run summon marker ~ ~ ~ {CustomName:{"text":"[最大边界]","color":"green"},Tags:["debug5"]}
$execute unless data storage bw:map maps[{"id":$(id)d}].border.max run summon marker ~ ~ ~ {CustomName:{"text":"[最大边界]","color":"red"},Tags:["debug5"]}

$execute unless data storage bw:map maps[{"id":$(id)d}].center run summon marker ~ ~ ~ {CustomName:{"text":"[资源点、床 禁用]","color":"gray"},Tags:["debug6"]}
$execute unless entity @e[type=marker,tag=debug6] if data storage bw:map maps[{"id":$(id)d}].map_editor.resource.status.placing run summon marker ~ ~ ~ {CustomName:{"text":"[资源点 正在放置]","color":"gray"},Tags:["debug6"]}
$execute unless entity @e[type=marker,tag=debug6] if data storage bw:map maps[{"id":$(id)d}].map_editor.resource.status.done run summon marker ~ ~ ~ {CustomName:{"text":"[资源点]","color":"green"},Tags:["debug6"]}
execute unless entity @e[type=marker,tag=debug6] run summon marker ~ ~ ~ {CustomName:{"text":"[资源点]","color":"red"},Tags:["debug6"]}

$execute unless data storage bw:map maps[{"id":$(id)d}].team run summon marker ~ ~ ~ {CustomName:{"text":"[队伍]","color":"red"},Tags:["debug7"]}
$execute if data storage bw:map maps[{"id":$(id)d}].team run summon marker ~ ~ ~ {CustomName:{"text":"[队伍]","color":"green"},Tags:["debug7"]}


$execute if data storage bw:map maps[{"id":$(id)d}].center run summon marker ~ ~ ~ {CustomName:{"text":"[中心点]","color":"green"},Tags:["debug8"]}
$execute unless data storage bw:map maps[{"id":$(id)d}].center run summon marker ~ ~ ~ {CustomName:{"text":"[中心点]","color":"red"},Tags:["debug8"]}
$execute if data storage bw:map maps[{"id":$(id)d}].visit run summon marker ~ ~ ~ {CustomName:{"text":"[参观点]","color":"green"},Tags:["debug9"]}
$execute unless data storage bw:map maps[{"id":$(id)d}].visit run summon marker ~ ~ ~ {CustomName:{"text":"[参观点]","color":"red"},Tags:["debug9"]}

$execute unless data storage bw:map maps[{"id":$(id)d}].additional.special_map.on run summon marker ~ ~ ~ {CustomName:{"text":"[特殊玩法]","color":"gray"},Tags:["debug10"]}
$execute if data storage bw:map maps[{"id":$(id)d}].additional.special_map.on run summon marker ~ ~ ~ {CustomName:{"text":"[特殊玩法 启用]","color":"aqua"},Tags:["debug10"]}

summon marker ~ ~ ~ {CustomName:{"text":"[自动恢复]","color":"white"},Tags:["debug11"]}

$tellraw @s ["     数据  >>   ", \
    {"selector":"@e[type=marker,tag=debug1]","click_event": {"action": "suggest_command","command": "/function debug:map_editor/operation/id {'id':$(id),'aim_id':<请将此处更改为ID(纯数字)>}"},"hover_event": {"action": "show_text","value": "为当前编辑的地图重新设定 ID"}},"  ", \
    {"selector":"@e[type=marker,tag=debug2]","click_event": {"action": "suggest_command","command": "/function debug:map_editor/operation/name {'id':$(id),'name':'<请将此处更改为名称(json文本格式)>'}"},"hover_event": {"action": "show_text","value": "为当前编辑的地图设定地图名称"}},"  ", \
    {"selector":"@e[type=marker,tag=debug3]","click_event": {"action": "suggest_command","command": "/function debug:map_editor/operation/desc {'id':$(id),'desc':'<请将此处更改为介绍(json文本格式)>'}"},"hover_event": {"action": "show_text","value": "为当前编辑的地图设定地图简介"}},"  ", \
    {"selector":"@e[type=marker,tag=debug4]","click_event": {"action": "suggest_command","command": "/function debug:map_editor/operation/border_min {'id':$(id),'min':'<请将此处更改为想要的半径(纯数字)>'}"},"hover_event": {"action": "show_text","value": "为地图设定最小边界\n即边界收缩到的最小范围"}},"  ", \
    {"selector":"@e[type=marker,tag=debug5]","click_event": {"action": "suggest_command","command": "/function debug:map_editor/operation/border_max {'id':$(id),'max':'<请将此处更改为想要的半径(纯数字)>'}"},"hover_event": {"action": "show_text","value": "为地图设定最大边界\n这将成为边界未收缩时的默认半径\n同时会影响到地图恢复系统的选区"}},"  \n                 ", \
    {"selector":"@e[type=marker,tag=debug6]","click_event": {"action": "run_command","command": "/function debug:map_editor/panel/buttom/data_resource {'id':$(id)}"},"hover_event": {"action": "show_text","value": "获取用于设定资源点的道具"}},"  ", \
    {"selector":"@e[type=marker,tag=debug7]","click_event": {"action": "run_command","command": "/function debug:map_editor/panel/buttom/data_team {'id':$(id)}"},"hover_event": {"action": "show_text","value": "获取用于设定床的道具"}},"  ", \
    {"selector":"@e[type=marker,tag=debug8]","click_event": {"action": "run_command","command": "/function debug:map_editor/panel/buttom/data_map_center"},"hover_event": {"action": "show_text","value": "获取用于中心点的道具"}},"  ", \
    {"selector":"@e[type=marker,tag=debug9]","click_event": {"action": "run_command","command": "/function debug:map_editor/operation/visit with storage debug:map_editor/panel data.$(uuid)"},"hover_event": {"action": "show_text","value": "设定玩家参观地图时的初始位置"}},"  \n                 ", \
    {"selector":"@e[type=marker,tag=debug10]","click_event": {"action": "run_command","command": "/function debug:map_editor/panel/buttom/data_special_map {'id':$(id)}"},"hover_event": {"action": "show_text","value": "决定这个地图是否归属于特殊地图, 这会让当前正在编辑的地图设定为负数id, 并且不会被随机地图选取到"}},"  ", \
    {"selector":"@e[type=marker,tag=debug11]","hover_event": {"action": "show_text","value": "决定这个地图的是否会自我恢复\n如果关闭, 玩家可能会传入虚空中\n暂时不支持停用自我复制功能"}}]

kill @e[type=marker,tag=debug1]
kill @e[type=marker,tag=debug2]
kill @e[type=marker,tag=debug3]
kill @e[type=marker,tag=debug4]
kill @e[type=marker,tag=debug5]
kill @e[type=marker,tag=debug6]
kill @e[type=marker,tag=debug7]
kill @e[type=marker,tag=debug8]
kill @e[type=marker,tag=debug9]
kill @e[type=marker,tag=debug10]
kill @e[type=marker,tag=debug11]

## 结构
$execute unless data storage bw:map maps[{"id":$(id)d}].center run summon marker ~ ~ ~ {CustomName:{"text":"[指令区域 无法定位中心点]","color":"red"},Tags:["debug1"]}
$execute unless entity @e[type=marker,tag=debug1] unless data storage bw:map maps[{"id":$(id)d}].command_area_name run summon marker ~ ~ ~ {CustomName:{"text":"[指令区域 初始化]","color":"white"},Tags:["debug1"]}
$execute unless entity @e[type=marker,tag=debug1] if data storage bw:map maps[{"id":$(id)d}].command_area_name run summon marker ~ ~ ~ {CustomName:{"text":"[指令区域 传送]","color":"white"},Tags:["debug1"]}

# execute if score $system_f3 debug matches 0 run summon marker ~ ~ ~ {CustomName:{"text":"[合作平台 初始化]","color":"white"},Tags:["debug2"]}
# execute if score $system_f3 debug matches 1 run summon marker ~ ~ ~ {CustomName:{"text":"[合作平台 传送]","color":"gray"},Tags:["debug2"]}
# execute if score $system_f3 debug matches 2 run summon marker ~ ~ ~ {CustomName:{"text":"[合作平台 禁用]","color":"gray"},Tags:["debug2"]}

$tellraw @s ["     结构  >>   ", \
    {"selector":"@e[type=marker,tag=debug1]","click_event":{"action":"run_command","command":"/function debug:map_editor/panel/buttom/stru_command_area_trigger {'id':$(id)}"},"hover_event": {"action": "show_text","value": "初始化/传送 指令区域"}}]
# tellraw @s ["     结构  >>   ", \
#     {"selector":"@e[type=marker,tag=debug1]","click_event":{"action":"run_command","command":"/function init"},"hover_event": {"action": "show_text","value": "初始化/传送 指令区域\n如果显示为禁用, 则需要优先放置地图中心点"}},"  ", \
#     {"selector":"@e[type=marker,tag=debug2]","click_event":{"action":"run_command","command":"/function debug:admin_panel/buttom/system_game_state"},"hover_event": {"action": "show_text","value": "初始化/传送 合作平台\n如果显示为禁用, 则需要优先放置地图中心点"}}]
kill @e[type=marker,tag=debug1]
kill @e[type=marker,tag=debug2]

## 操作
summon marker ~ ~ ~ {CustomName:{"text":"[完成编辑]","color":"white"},Tags:["debug1"]}
summon marker ~ ~ ~ {CustomName:{"text":"[删除地图]","color":"white"},Tags:["debug2"]}
summon marker ~ ~ ~ {CustomName:{"text":"[锁定地图]","color":"white"},Tags:["debug3"]}

execute if score $system_f3 debug matches 0 run summon marker ~ ~ ~ {CustomName:{"text":"[维护事项 添加]","color":"white"},Tags:["debug4"]}
execute if score $system_f3 debug matches 1 run summon marker ~ ~ ~ {CustomName:{"text":"[维护事项]","color":"gray"},Tags:["debug4"]}

summon marker ~ ~ ~ {CustomName:{"text":"[邀请合作]","color":"white"},Tags:["debug5"]}
summon marker ~ ~ ~ {CustomName:{"text":"[切换地图]","color":"white"},Tags:["debug6"]}

$tellraw @s ["     操作  >>   ", \
    {"selector":"@e[type=marker,tag=debug1]","click_event":{"action":"run_command","command":"/function debug:map_editor/command/quit_editor with storage debug:map_editor/panel data.$(uuid)"},"hover_event": {"action": "show_text","value": "退出编辑模式"}},"  ", \
    {"selector":"@e[type=marker,tag=debug2]","click_event":{"action":"run_command","command":"/function debug:map_editor/command/delete_map with storage debug:map_editor/panel data.$(uuid)"},"hover_event": {"action": "show_text","value": "删除地图"}},"  ", \
    {"selector":"@e[type=marker,tag=debug3]","click_event": {"action": "run_command","command": "/say 1"},"hover_event": {"action": "show_text","value": "正在编辑的地图无法解锁！"}},"  \n                 ", \
    {"selector":"@e[type=marker,tag=debug4]","click_event": {"action": "run_command","command": "/say hello world"},"hover_event": {"action": "show_text","value": "为地图导入工作生成专用维护事项\n暂时不支持"}},"  ", \
    {"selector":"@e[type=marker,tag=debug5]","click_event": {"action": "run_command","command": "/say hello world"},"hover_event": {"action": "show_text","value": "向其他管理员发送地图导入邀请\n暂时不支持"}},"  ", \
    {"selector":"@e[type=marker,tag=debug6]","click_event": {"action": "suggest_command","command": "/scoreboard players set @s map_editor_focus <地图ID(纯数字)>"},"hover_event": {"action": "show_text","value": "切换当前正在编辑的地图"}}]
kill @e[type=marker,tag=debug1]
kill @e[type=marker,tag=debug2]
kill @e[type=marker,tag=debug3]
kill @e[type=marker,tag=debug4]
kill @e[type=marker,tag=debug5]
kill @e[type=marker,tag=debug6]


# execute unless score $working gaming matches 1 run summon marker ~ ~ ~ {CustomName:{"text":"[开始游戏]","color":"white"},Tags:["debug2"]}
# execute if score $working gaming matches 1 run summon marker ~ ~ ~ {CustomName:{"text":"[结束游戏]","color":"white"},Tags:["debug2"]}

# 末尾
tellraw @s ""

# 发送点击音效
function lib:sounds/hit