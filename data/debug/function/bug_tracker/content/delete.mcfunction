# 删除一个维护事项
# 传入 事项id

# 从列表中清除

## 维护事项总列表
$data remove storage debug:bug_tracker/content detail[{"id":$(id)}]

## 正在进行的维护项
$execute if data storage debug:bug_tracker/focus content[{"id":$(id)}] run scoreboard players remove $total bug_tracker_focus 1
$execute if data storage debug:bug_tracker/focus content[{"id":$(id)}] run data remove storage debug:bug_tracker/focus content[{"id":$(id)}]

execute if score $total bug_tracker_focus matches -2147483648..-1 run scoreboard players set $total bug_tracker_focus 0

# 清理在线玩家的专注状态
$scoreboard players reset @a[scores={bug_tracker_focus=$(id)}] bug_tracker_focus

# 清理 Bossbar
$bossbar remove bug_tracker:$(id)

# 重弹菜单
function debug