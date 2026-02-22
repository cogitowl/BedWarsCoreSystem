# 更改当前正在专注的维护事项
# 传入维护事项id 

# 数据控制
$scoreboard players set @s bug_tracker_focus $(id)

# 添加当前维护事项到 全局维护列表中

## 获取名称
$data modify storage debug:bug_tracker/focus change.name set from storage debug:bug_tracker/content detail[{"id":$(id)}].name
$data modify storage debug:bug_tracker/focus change.id set value $(id)

$execute unless data storage debug:bug_tracker/focus content[{"id":$(id)}] run scoreboard players add $total bug_tracker_focus 1
$execute unless data storage debug:bug_tracker/focus content[{"id":$(id)}] run data modify storage debug:bug_tracker/focus content append from storage debug:bug_tracker/focus change

# 更新 Bossbar
$bossbar set bug_tracker:$(id) players @a[scores={bug_tracker_focus=$(id)}]

# 重弹菜单
function debug