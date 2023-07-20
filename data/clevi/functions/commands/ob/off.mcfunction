# CMD: 4
# 传送回观察之前的位置
summon minecraft:marker ~ ~ ~ {Tags:["tp_target"]}
execute as @e[type=player,tag=IsRunningCommand,scores={command_panel=4},limit=1] store result entity @e[tag=tp_target,limit=1] Pos[0] double 1 run scoreboard players get @s pos_x_b4_ob
execute as @s store result entity @e[tag=tp_target,limit=1] Pos[1] double 1 run scoreboard players get @s pos_y_b4_ob
execute as @s store result entity @e[tag=tp_target,limit=1] Pos[2] double 1 run scoreboard players get @s pos_z_b4_ob


# dbg
# tellraw @a [{"nbt":"Pos", "entity":"@e[type=marker,limit=1,tag=tp_target]"}]
# tellraw @a [{"nbt":"Rotation", "entity":"@e[type=marker,limit=1,tag=tp_target]"}]
# tellraw @a [{"nbt":"Pos", "entity":"@e[type=player,tag=IsRunningCommand,scores={command_panel=4},limit=1]"}]
# tellraw @a [{"nbt":"Rotation", "entity":"@e[type=player,tag=IsRunningCommand,scores={command_panel=4},limit=1]"}]



tp @s @e[tag=tp_target,limit=1]
kill @e[type=marker,tag=tp_target,limit=1]

# 切回之前的模式

execute as @s[scores={gamemode_b4_ob=0, is_observing=1}] run gamemode survival
execute as @s[scores={gamemode_b4_ob=1, is_observing=1}] run gamemode creative
execute as @s[scores={gamemode_b4_ob=2, is_observing=1}] run gamemode adventure
execute as @s[scores={gamemode_b4_ob=3, is_observing=1}] run gamemode spectator
scoreboard players set @s is_observing 0

# 清空进入前记录
execute as @s[tag=IsRunningCommand, scores={command_panel=4, is_observing=1}] run scoreboard players set @s pos_x_b4_ob 0
execute as @s[tag=IsRunningCommand, scores={command_panel=4, is_observing=1}] run scoreboard players set @s pos_y_b4_ob 64
execute as @s[tag=IsRunningCommand, scores={command_panel=4, is_observing=1}] run scoreboard players set @s pos_z_b4_ob 0
execute as @s[tag=IsRunningCommand, scores={command_panel=4, is_observing=1}] run scoreboard players set @s rot_yaw 0
execute as @s[tag=IsRunningCommand, scores={command_panel=4, is_observing=1}] run scoreboard players set @s rot_pitch 0

# 噗！
playsound minecraft:entity.enderman.teleport player @e[type=player,distance=..16]

# 涉及状态切换，刷新菜单UI
execute as @s run function clevi:apis/refresh_ui_menu

# Exit Function
scoreboard players set @s command_panel 0
tag @s remove IsRunningCommand