# ======
# 全局前置
# ======

# command_panel控制器整体需要
scoreboard objectives add command_panel trigger "命令属性"
scoreboard players set @a command_panel 0
scoreboard players enable @a command_panel

# display_item侧边栏
scoreboard objectives add display_item trigger "侧边HUD"
# scoreboard players enable @a display_item



# ======
# 功能
# ======

# Here
scoreboard objectives add pos_x dummy "x"
scoreboard objectives add pos_y dummy "y"
scoreboard objectives add pos_z dummy "z"


# OB
## OB状态指示
scoreboard objectives add is_observing dummy "正在旁观"
scoreboard players set @a[gamemode=!spectator] is_observing 0
scoreboard players set @a[gamemode=spectator] is_observing 1
## OB位置记录
scoreboard objectives add pos_x_b4_ob dummy "旁观时x"
scoreboard objectives add pos_y_b4_ob dummy "旁观时y"
scoreboard objectives add pos_z_b4_ob dummy "旁观时z"


scoreboard objectives add global_place_marker_count dummy "退出ob位置恢复标记ID列表"
scoreboard players set #clevi:global_ob global_place_marker_count 0
## OB人数计量表
scoreboard objectives add place_marker_ID dummy "全局观察模式位置恢复标记ID"
scoreboard objectives add gamemode_b4_ob dummy "进旁观前游戏模式"


# Pick
scoreboard objectives add pick_range dummy "Pick 捡拾范围"
scoreboard players set @a pick_range 8

# check_login
scoreboard objectives add is_online dummy
