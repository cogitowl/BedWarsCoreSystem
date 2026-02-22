# 完成填写
$function debug:bug_tracker/content/add_trigger {"name":"$(name)","desc":"$(desc)","reporter":"$(reporter)","type":"$(type)"}

# 清理数据
function debug:bug_tracker/feedback/clear with storage debug:bug_tracker/feedback

# 发送提示
title @s title "数据已提交给服务器!"