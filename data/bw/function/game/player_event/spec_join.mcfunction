# 进入旁观模式

# 数据操控
gamemode spectator @s
tag @s add spec
team join spec @s[team=!red,team=!blue,team=!yellow,team=!green]

# 刷新 Bossbar
bossbar set countdown:red players @a[team=red]
bossbar set countdown:blue players @a[team=blue]
bossbar set countdown:green players @a[team=green]
bossbar set countdown:yellow players @a[team=yellow]
bossbar set countdown:spec players @a[team=spec]