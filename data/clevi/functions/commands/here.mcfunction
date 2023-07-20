# CMD: 2
execute store result score @s pos_x run data get entity @s Pos[0]
execute store result score @s pos_y run data get entity @s Pos[1]
execute store result score @s pos_z run data get entity @s Pos[2]

tellraw @a [{"selector":"@s"},{"text":"在"},{"nbt":"Dimension","entity":"@s","color":"gold"},": ",{"score":{"name":"@s","objective":"pos_x"},"color":"aqua"},",",{"score":{"name":"@s","objective":"pos_y"},"color":"aqua"},",",{"score":{"name":"@s","objective":"pos_z"},"color":"aqua"},{"text":"打招呼"}]

# 浮点数不能转换成整数，看着很费劲
# tellraw @a [{"selector":"@s"},{"text":"在"},{"nbt":"Dimension","entity":"@s","color":"gold"},": ",{"nbt":"Pos[0]","entity":"@s","color":"aqua"},",",{"nbt":"Pos[1]","entity":"@s","color":"aqua"},",",{"nbt":"Pos[2]","entity":"@s","color":"aqua"},{"text":"打招呼"}]

effect give @s glowing 10 1

# 讨嫌
playsound minecraft:entity.player.burp player @a

scoreboard players reset @s pos_x
scoreboard players reset @s pos_y
scoreboard players reset @s pos_z


# Exit Function
scoreboard players set @s command_panel 0
tag @s remove IsRunningCommand
