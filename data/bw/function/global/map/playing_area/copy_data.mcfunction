$data modify storage bw:map using set from storage bw:map maps[{id:$(id)d}]
execute unless data storage bw:map using.name run data modify storage bw:map using.name set value {"text":"暂无资料"}
execute unless data storage bw:map using.desc run data modify storage bw:map using.desc set value {"text":"暂无资料"}
execute if score $sel map matches 0 run data modify storage bw:map using.name set value {"text":"随机地图"}
execute if score $sel map matches 0 run data modify storage bw:map using.desc set value {"text":"随便吧, 我都行."}