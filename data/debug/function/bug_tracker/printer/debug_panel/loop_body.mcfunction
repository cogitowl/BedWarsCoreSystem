# 2nd
#! debug:bug_tracker/printer transfer
#! debug:bug_tracker/printer serial

# 参数内容计算

scoreboard players remove $printer_transfer bug_tracker_temp 1
execute store result storage debug:bug_tracker/printer transfer int 1 run scoreboard players get $printer_transfer bug_tracker_temp

scoreboard players remove $printer_serial bug_tracker_temp 1
execute store result storage debug:bug_tracker/printer serial int 1 run scoreboard players get $printer_serial bug_tracker_temp

function debug:bug_tracker/printer/debug_panel/get_nbt with storage debug:bug_tracker/printer

# 发送参数传递内容
execute if score $printer_transfer bug_tracker_temp matches 0.. run function debug:bug_tracker/printer/debug_panel/message with storage debug:bug_tracker/printer

# loop
execute if score $printer_transfer bug_tracker_temp matches 1.. run function debug:bug_tracker/printer/debug_panel/loop_body