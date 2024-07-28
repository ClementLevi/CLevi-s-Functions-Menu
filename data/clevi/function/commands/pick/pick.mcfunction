# CMD: 5
execute as @e[tag=IsRunningCommand, scores={command_panel=5}] if score @s pick_range matches ..4 run tp @e[type=item,distance=..4] @s
execute as @e[tag=IsRunningCommand, scores={command_panel=5}] if score @s pick_range matches 6 run tp @e[type=item,distance=..6] @s
execute as @e[tag=IsRunningCommand, scores={command_panel=5}] if score @s pick_range matches 8 run tp @e[type=item,distance=..8] @s
execute as @e[tag=IsRunningCommand, scores={command_panel=5}] if score @s pick_range matches 10 run tp @e[type=item,distance=..10] @s
execute as @e[tag=IsRunningCommand, scores={command_panel=5}] if score @s pick_range matches 12 run tp @e[type=item,distance=..12] @s
execute as @e[tag=IsRunningCommand, scores={command_panel=5}] if score @s pick_range matches 14 run tp @e[type=item,distance=..14] @s
execute as @e[tag=IsRunningCommand, scores={command_panel=5}] if score @s pick_range matches 16.. run tp @e[type=item,distance=..16] @s


# 以防玩家间冲突，该指令将会高亮执行者并给出屏幕提示
effect give @s glowing 3
execute as @s run title @a[distance=..32] actionbar [{"selector":"@s"},{"text":"捡起了周围的物品"}]

# 吸！
playsound minecraft:entity.villager.celebrate player @e[type=player,distance=..32]


# Exit Function
scoreboard players set @s command_panel 0
tag @s remove IsRunningCommand