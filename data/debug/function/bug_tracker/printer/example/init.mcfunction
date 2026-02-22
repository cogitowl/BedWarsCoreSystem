# 信息计算
scoreboard players set $printer_serial bug_tracker_temp 0
$execute store result score $printer_transfer bug_tracker_temp run data get storage $(storage) $(nbt)

$data modify storage debug:bug_tracker/printer storage set value "$(storage)"
$data modify storage debug:bug_tracker/printer nbt set value "$(nbt)"
$data modify storage debug:bug_tracker/printer message set value "$(nbt)"


# 文本打印
function debug:bug_tracker/printer/example/loop_body

# 收尾
scoreboard players reset $printer_serial bug_tracker_temp
scoreboard players reset $printer_transfer bug_tracker_temp