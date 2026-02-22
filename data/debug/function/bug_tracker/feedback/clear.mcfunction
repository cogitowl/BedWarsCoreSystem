# 清理数据
$data remove storage debug:bug_tracker/feedback player.$(uuid)
scoreboard players reset @s bug_tracker_temp
clear @s written_book[custom_data={"bwtag":["bug_tracker","feedback"]}]
clear @s writable_book[custom_data={"bwtag":["bug_tracker","feedback"]}]