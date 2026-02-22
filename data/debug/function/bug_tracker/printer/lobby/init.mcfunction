# 信息计算
$execute store result score $printer_transfer bug_tracker_temp run data get storage $(storage) $(nbt)
scoreboard players operation $printer_serial bug_tracker_temp = $printer_transfer bug_tracker_temp
scoreboard players add $printer_serial bug_tracker_temp 1

$data modify storage debug:bug_tracker/printer storage set value "$(storage)"
$data modify storage debug:bug_tracker/printer nbt set value "$(nbt)"


# 文本打印
function debug:bug_tracker/printer/lobby/loop_body

# 收尾
scoreboard players reset $printer_serial bug_tracker_temp
scoreboard players reset $printer_transfer bug_tracker_temp