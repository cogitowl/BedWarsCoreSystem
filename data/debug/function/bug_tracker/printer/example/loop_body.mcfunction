# 2nd
#! debug:bug_tracker/printer transfer
#! debug:bug_tracker/printer serial

# 记分板计算

scoreboard players remove $printer_transfer bug_tracker_temp 1
execute store result storage debug:bug_tracker/printer transfer int 1 run scoreboard players get $printer_transfer bug_tracker_temp

scoreboard players add $printer_serial bug_tracker_temp 1
execute store result storage debug:bug_tracker/printer serial int 1 run scoreboard players get $printer_serial bug_tracker_temp

# 发送参数传递内容
execute if score $printer_transfer bug_tracker_temp matches 0.. run function debug:bug_tracker/printer/example/message with storage debug:bug_tracker/printer

# loop
execute if score $printer_transfer bug_tracker_temp matches 1.. run function debug:bug_tracker/printer/example/loop_body