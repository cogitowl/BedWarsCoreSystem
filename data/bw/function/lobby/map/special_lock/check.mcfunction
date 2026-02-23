# 尝试解锁地图

$execute if entity @s[tag=map_access_$(special_lock)] run data remove storage bw:map using.lock.special
execute unless data storage bw:map using.lock.special run title @a title {"text":"地图已解锁","color":"green"}
execute unless data storage bw:map using.lock.special run title @a subtitle [{"text":"由 ","color":"white"},{selector:"@s"}," 完成解锁！"]