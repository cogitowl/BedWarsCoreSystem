# 添加新的维护项
# 传入 名称、说明、类型
#! data get storage debug:bug_tracker/content

# 分配id
execute store result score $content_id bug_tracker_temp run data get storage debug:bug_tracker/content id
scoreboard players add $content_id bug_tracker_temp 1

execute store result storage debug:bug_tracker/content id int 1 run scoreboard players get $content_id bug_tracker_temp

## 检测是否重复
function debug:bug_tracker/content/add_check with storage debug:bug_tracker/content
execute if score $add_check bug_tracker_temp matches 1 run return run say 添加维护事项时出错, 检测到重复id的维护事项. 如果您是玩家, 请在我们的交流群中与我们的管理员取得联系. (function debug:bug_tracker/content/add_trigger.mcfunction)

# 设定基础内容
$data modify storage debug:bug_tracker/content add_trigger set value {"desc":"$(desc)","type":"$(type)","name":"$(name)","reporter":"$(reporter)"}
data modify storage debug:bug_tracker/content add_trigger.id set from storage debug:bug_tracker/content id

# 添加到内部
data modify storage debug:bug_tracker/content detail append from storage debug:bug_tracker/content add_trigger

# 生成 Bossbar
function debug:bug_tracker/content/add_bossbar with storage debug:bug_tracker/content add_trigger

# 清理残留
# data remove storage debug:bug_tracker/content add_trigger/r