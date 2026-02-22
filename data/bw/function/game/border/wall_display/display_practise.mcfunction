execute positioned ^ ^-1 ^ run particle dust{color:[1,0,0],scale:2} ^ ^1 ^ 0 0 0 0 1 normal @s[tag=out_of_border]
particle dust{color:[1,0,0],scale:2} ^ ^1 ^ 0 0 0 0 1 normal @s[tag=out_of_border]
execute positioned ^ ^1 ^ run particle dust{color:[1,0,0],scale:2} ^ ^1 ^ 0 0 0 0 1 normal @s[tag=out_of_border]

execute positioned ^ ^-1 ^ run particle dust{color:[0,0.65,1],scale:2} ^ ^1 ^ 0 0 0 0 1 normal @s[tag=!out_of_border]
particle dust{color:[0,0.65,1],scale:2} ^ ^1 ^ 0 0 0 0 1 normal @s[tag=!out_of_border]
execute positioned ^ ^1 ^ run particle dust{color:[0,0.65,1],scale:2} ^ ^1 ^ 0 0 0 0 1 normal @s[tag=!out_of_border]