

# 主界面
# name: -356132
# desc: -356131
# type_bug: -356130
# type_suggestions: -356129
# type_support: -356128
# done: -356127

# 触发器数值

## 漏洞类型
execute if score @s about matches -356130 run scoreboard players set @s bug_tracker_temp 0
execute if score @s about matches -356129 run scoreboard players set @s bug_tracker_temp 1
execute if score @s about matches -356128 run scoreboard players set @s bug_tracker_temp 2

## 书与笔
$execute if score @s about matches -356132 run data modify storage debug:bug_tracker/feedback player.$(uuid).name set from entity @s SelectedItem.components.minecraft:written_book_content.title.raw
$execute if score @s about matches -356131 run data modify storage debug:bug_tracker/feedback player.$(uuid).desc set from entity @s SelectedItem.components.minecraft:written_book_content.title.raw

## 完成填写
$execute if score @s about matches -356127 run function debug:bug_tracker/feedback/send with storage debug:bug_tracker/feedback player.$(uuid)

## 重置填写
$execute if score @s about matches -356126 run function debug:bug_tracker/feedback/clear with storage debug:bug_tracker/feedback player.$(uuid)

# 基本内容填写
$execute if score @s bug_tracker_temp matches 0 run data modify storage debug:bug_tracker/feedback player.$(uuid).type set value "漏洞"
$execute if score @s bug_tracker_temp matches 1 run data modify storage debug:bug_tracker/feedback player.$(uuid).type set value "建议"
$execute if score @s bug_tracker_temp matches 2 run data modify storage debug:bug_tracker/feedback player.$(uuid).type set value "支援"

function lib:playerinfo/name
$data modify storage debug:bug_tracker/feedback player.$(uuid).reporter set from storage lib:playerinfo name

# 弹出菜单
function debug:bug_tracker/feedback/trigger