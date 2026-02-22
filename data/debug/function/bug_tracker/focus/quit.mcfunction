# 更改当前正在专注的维护事项
# 传入维护事项id 

scoreboard players reset @s bug_tracker_focus

$execute if data storage debug:bug_tracker/focus content[{"id":$(id)}] unless entity @e[scores={bug_tracker_focus=$(id)}] run scoreboard players remove $total bug_tracker_focus 1
$execute if data storage debug:bug_tracker/focus content[{"id":$(id)}] unless entity @e[scores={bug_tracker_focus=$(id)}] run data remove storage debug:bug_tracker/focus content[{"id":$(id)}]

execute if score $total bug_tracker_focus matches -2147483648..-1 run scoreboard players set $total bug_tracker_focus 0

# 更新 Bossbar
$bossbar set bug_tracker:$(id) players @a[scores={bug_tracker_focus=$(id)}]

function debug