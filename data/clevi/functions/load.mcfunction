tell Clement_Levi "生存指令面板数据包已重载"

# 重载后初始化
function clevi:install/install_minimum
execute as @a[limit=1] run function clevi:apis/refresh_ui_menu

# 执行定时任务序列
function #clevi:registries/scheduled_tasks_registry