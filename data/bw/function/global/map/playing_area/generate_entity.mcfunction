# 生成地图必要实体

# 生成游玩区域中心点
kill @e[type=marker,tag=playing_center]
execute summon marker run function bw:global/map/playing_area/init_entity