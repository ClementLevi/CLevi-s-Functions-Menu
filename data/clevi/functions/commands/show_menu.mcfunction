# CMD: 1 (Root)

# https://minecraft.tools/en/tellraw.php

# Title
tellraw @s [{"text":"==== "},{"text":"CL","color":"gold"},{"text":"'s Commands ====\n| Type '"},{"text":"/trigger command_panel","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger command_panel"}},{"text":"' to invoke this menu.\n"},{"text":"| Click the buttons to run commands.","color":"white"},{"text":"\n| ---------------------"}]


# Command List
## Here
tellraw @s [{"text":"| "},{"text":"[ here ]","bold":true,"color":"aqua","clickEvent":{"action":"run_command","value":"/trigger command_panel set 2"},"hoverEvent":{"action":"show_text","contents":"click to run"}},{"text":" Say Hi to everyone and show current position."}]

## Ob
### (Off)
    tellraw @s[scores={is_observing=0}] [{"text":"| "},{"text":"[ ob ]","bold":true,"color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger command_panel set 3"},"hoverEvent":{"action":"show_text","contents":"click to run"}},{"text":" ","bold":true,"clickEvent":{"action":"run_command","value":"/trigger command_panel set 3"},"hoverEvent":{"action":"show_text","contents":"click to run"}},{"text":"(off)","bold":true,"color":"grey","clickEvent":{"action":"run_command","value":"/trigger command_panel set 3"},"hoverEvent":{"action":"show_text","contents":"click to run"}},{"text":" Toggle to observe mode."}]
### (On)
    tellraw @s[scores={is_observing=1}] [{"text":"| "}, {"text":"[ ob ]","bold":true,"color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger command_panel set 4"},"hoverEvent":{"action":"show_text","contents":"click to run"}},{"text":" ","bold":true,"clickEvent":{"action":"run_command","value":"/trigger command_panel set 4"},"hoverEvent":{"action":"show_text","contents":"click to run"}},{"text":"(on)","bold":true,"color":"green","clickEvent":{"action":"run_command","value":"/trigger command_panel set 4"},"hoverEvent":{"action":"show_text","contents":"click to run"}},{"text":" Toggle to observe mode."}]

## Pick
tellraw @s [{"text":"| "},{"text":"[ pick ]","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger command_panel set 5"},"hoverEvent":{"action":"show_text","contents":"Click to run"},"bold":true},{"text":" (","bold":true},{"text":" - ","color":"red","clickEvent":{"action":"run_command","value":"/trigger command_panel set 50"},"hoverEvent":{"action":"show_text","contents":"-2"},"bold":true},{"text":"[ ","bold":true},{"score":{"name":"@s","objective":"pick_range","bold":true},"color":"yellow","hoverEvent":{"action":"show_text","contents":"Current range","bold":true}},{"text":" ]","bold":true},{"text":" + ","color":"green","clickEvent":{"action":"run_command","value":"/trigger command_panel set 51"},"hoverEvent":{"action":"show_text","contents":"+2"},"bold":true},{"text":")"},{"text": " Pick up nearby item within specified range. "}]

# Critical Command List

## Suicide
tellraw @s [{"text":"| \n| ----\n| "},{"text":" "},{"text":"[ Suicide ]","color":"red","clickEvent":{"action":"run_command","value":"/trigger command_panel set 9"},"hoverEvent":{"action":"show_text","contents":{"text":"Be Careful, Be Valuable","color":"red"}}},{"text":" !! Commit suicide !!"}]

# Ending
tellraw @s [{"text":"| ----\n==== "},{"text":"CL","color":"gold"},{"text":"'s Commands End==== "}]

# Exit Function
scoreboard players set @s command_panel 0
tag @s remove IsRunningCommand
