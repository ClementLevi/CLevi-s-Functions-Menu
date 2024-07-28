# CMD: 3
# 记录进入旁观模式前的位置
execute store result score @s pos_x_b4_ob run data get entity @s Pos[0]
execute store result score @s pos_y_b4_ob run data get entity @s Pos[1]
execute store result score @s pos_z_b4_ob run data get entity @s Pos[2]


# 记录进入之前的游戏模式
execute store result score @s gamemode_b4_ob run data get entity @s playerGameType

# 切旁观
execute as @s run gamemode spectator
scoreboard players set @s is_observing 1

# 噗！
playsound minecraft:entity.enderman.teleport player @e[type=player,distance=..16]

# 涉及状态切换，刷新菜单UI
execute as @s run function clevi:apis/refresh_ui_menu

# Exit Function
scoreboard players set @s command_panel 0
tag @s remove IsRunningCommand