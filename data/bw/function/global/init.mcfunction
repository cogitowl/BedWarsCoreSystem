# 全局初始化

# 笨蛋检测器
kill @e[type=marker,tag=entity_loss]
summon marker 0 0 0 {"Tags":["entity_loss"]}

# 世界边界
worldborder center 0 0
worldborder set 29999984

# 强加载
forceload remove all
forceload add 85 85 -85 -85 

# 游戏规则
gamerule elytra_movement_check true
gamerule advance_weather false 

# 计分板
#scoreboard objectives remove debug
scoreboard objectives add debug dummy "调试"
execute unless score $system_f3 debug matches 0..1 run scoreboard players set $system_f3 debug 1
execute unless score $team_auto_allocation debug matches 0..1 run scoreboard players set $team_auto_allocation debug 0
execute unless score $rule_res_cd debug matches 0..1 run scoreboard players set $rule_res_cd debug 0

#scoreboard objectives remove maintenance
scoreboard objectives add maintenance dummy "维护"
execute unless score $notification maintenance matches 0..1 run scoreboard players set $notification maintenance 0
execute unless score $disable_player_vote maintenance matches 0..1 run scoreboard players set $disable_player_vote maintenance 0
execute unless score $disable_auto_ending maintenance matches 0..1 run scoreboard players set $disable_auto_ending maintenance 0
execute unless score $disable_environment_check maintenance matches 0..1 run scoreboard players set $disable_environment_check maintenance 0
execute unless score $disable_command_block maintenance matches 0..1 store result score $disable_command_block maintenance run gamerule command_blocks_work

scoreboard objectives remove const
scoreboard objectives add const dummy "数字常数"
scoreboard players set $-1 const -1
scoreboard players set $0 const 0
scoreboard players set $1 const 1
scoreboard players set $2 const 2
scoreboard players set $3 const 3
scoreboard players set $4 const 4
scoreboard players set $5 const 5
scoreboard players set $10 const 10
scoreboard players set $20 const 20
scoreboard players set $60 const 60
scoreboard players set $100 const 100
scoreboard players set $101 const 101
scoreboard players set $102 const 102
scoreboard players set $103 const 103
scoreboard players set $104 const 104
scoreboard players set $105 const 105
scoreboard players set $201 const 201
scoreboard players set $202 const 202
scoreboard players set $203 const 203
scoreboard players set $301 const 301
scoreboard players set $302 const 302
scoreboard players set $303 const 303
scoreboard players set $559 const 559
scoreboard players set $1000 const 1000
scoreboard players set $32768 const 32768
scoreboard players set $10000 const 10000
scoreboard players set $100000 const 100000


#scoreboard objectives remove command_config
scoreboard objectives add command_config dummy "指令配置"

scoreboard objectives remove music_next
scoreboard objectives add music_next dummy "音乐 下一场景"

scoreboard objectives remove music_time
scoreboard objectives add music_time dummy "音乐 间隔时间"

scoreboard objectives remove music_id
scoreboard objectives add music_id dummy "音乐 ID"

scoreboard objectives remove temp
scoreboard objectives remove temp2
scoreboard objectives add temp dummy "缓存"
scoreboard objectives add temp2 dummy "缓存2"

#scoreboard objectives remove round_exp
scoreboard objectives add round_exp dummy "局游戏经验"

#scoreboard objectives remove exp
scoreboard objectives add exp dummy "游戏经验"

#scoreboard objectives remove exp_point
scoreboard objectives add exp_point dummy "游戏经验点"

#scoreboard objectives remove round_coin
scoreboard objectives add round_coin dummy "局游戏货币"

#scoreboard objectives remove coin
scoreboard objectives add coin dummy "游戏货币"

scoreboard objectives remove food
scoreboard objectives add food food "饱食"

scoreboard objectives remove leave_game
scoreboard objectives add leave_game custom:leave_game "退出游戏"

scoreboard objectives remove afk_time
scoreboard objectives add afk_time dummy "离开时间"

scoreboard objectives remove death
scoreboard objectives add death deathCount "死亡接口"

scoreboard objectives remove kill_player
scoreboard objectives add kill_player playerKillCount "击杀玩家总数"

scoreboard objectives remove health
scoreboard objectives add health health "❤"

scoreboard objectives remove UUID
scoreboard objectives add UUID dummy "统一标识符"

scoreboard objectives remove damage_type
scoreboard objectives add damage_type dummy "伤害种类"

scoreboard objectives remove damage_source
scoreboard objectives add damage_source dummy "伤害来源"

scoreboard objectives remove hate_time
scoreboard objectives add hate_time dummy "仇恨时间"

scoreboard objectives remove gamerule
scoreboard objectives add gamerule dummy "游戏设定"

scoreboard objectives remove fireball_life
scoreboard objectives add fireball_life dummy "火球时间"

scoreboard objectives remove player_count
scoreboard objectives add player_count dummy "玩家人数"

scoreboard objectives remove map
scoreboard objectives add map dummy "地图"
#execute as @e[type=marker,tag=map] store result score @s map run data get entity @s data.map.id

scoreboard objectives add config dummy "配置"
execute unless score #init config matches 1 run function debug:config_reset
function debug:config_sync

scoreboard objectives remove is_input_valid
scoreboard objectives add is_input_valid dummy "输入项是否有效"

#scoreboard objectives remove energy
scoreboard objectives add energy dummy "精力值"

#scoreboard objectives remove energy_clock
scoreboard objectives add energy_clock dummy "精力值 时钟"

scoreboard objectives remove tps
scoreboard objectives add tps dummy "TPS"

scoreboard objectives remove about
scoreboard objectives add about trigger "关于这个数据包"

# 初始化 真实时间获取
function bw:global/clock/real_time/init

# 初始化全局模块
function bw:global/tip/init

# 初始化 游戏启动 模式
function bw:game_start/init

# 初始化 游戏结束 模式
function bw:game_end/init

# 开始 tps 运算
schedule function bw:global/clock/tps_check/start 10s

# 重置地图复制系统
function bw:global/map/init