# Clement_Levi的原版生存指令系统

## 数据包介绍

### 作者信息

作者：[Clement_Levi](https://github.com/ClementLevi "GitHub")

联系方式：

* 邮箱：clement_levi@qq.com
* QQ交流群：152794569
* 主页：https://github.com/ClementLevi

### 简介

本数据包基于便利MC原版生存体验的原则制作，主要针对单人及多人游戏内的[合成表]( "已独立为CLevi's Recipe数据包")、函数进行了修改，所有功能都可以按需开放给无权限普通玩家。

欢迎交流学习、自行魔改。本数据包基于[CC-BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.zh)协议制作，请保留有关协议内容。

---

## 安装、使用与卸载

### 安装

拖放至存档文件夹下的[datapacks]()，然后/reload即可加载。

首次使用数据包必须运行如下命令：

```mcfunction
function clevi:install/install_minimum
```

该命令用以初始化所有后续需要使用的计分板项，它们将作为环境全局变量和标记位置存在，建议刚安装好后即运行该初始化指令。

而下列指令则会将以下的可选指令也一并安装：

```
function clevi:install/install_all
```

#### *可选*：添加死亡榜统计

输入以下指令即可便捷地添加死亡榜：

```mcfunction
function clevi:install/add_deathcount
```

#### *可选*：添加tab血条

输入以下指令即可便捷地添加血条，并使其在名字下方显示：

```mcfunction
function clevi:install/add_hp_bar
```

### 使用

在游戏中使用 `/trigger command_panel`指令即可调出菜单。鼠标点击菜单按钮以执行对应选项。

因二次开发而没有注册按钮到菜单中的功能，也可以使用 `/trigger command_panel set [一个被监听的CMD值]` 来模拟按钮被点击时的效果。该数据包提供的CMD值为一个整数，例子见后文。

### 卸载

卸载时不会清除死亡榜信息和tab血条，仅仅移除本计分板所使用的全局变量计分板。输入以下指令以卸载：

```
function clevi:install/remove_triggers
```

---

## 功能

#### Show Menu 显示菜单（有状态 有UI）

在聊天栏中使用tellraw命令展示当前可用的指令。如果新添加其他功能，则需要到该功能的具体实现中增加对应的UI，以提供一个可供点击的按钮。

对于有UI功能而言，往往也需要注入本功能的实现。UI对应状态发生变化后，往往需要重新调用该功能以刷新UI。

**CMD：1**

#### Here 打招呼

向服务器内所有玩家打招呼，这会将执行者的当前维度、坐标输出到聊天窗口中，并给予玩家5秒的发光效果以便穿墙发现。

**CMD：2**

#### Ob 旁观模式（有状态 有UI）

切换为旁观者模式，当前功能的状态会反映在主菜单按钮上。当切换回来时，玩家会回到进入旁观者模式时的位置。

**CMD：3（->on）、4（->off）**

#### Pick 捡起周围掉落物（有状态 有UI）

将一定半径内的掉落物传送到执行者身上。出于多人游戏公平考虑，周围32格以内的玩家将会收到字幕提示，且捡起掉落物的玩家也会被高亮3秒。

**CMD：5**

##### Modify Pick Range 修改捡起半径（子功能 有状态 有UI）

修改可以捡起的掉落物范围大小。允许的范围为4~16，步长为2，默认值为8。

**CMD：50（-）、51（+）**

#### Suicide 自杀（危险）

自杀。

**CMD：9**

---

## 二次开发引导

本数据包启发自Javascript（Node JS）的事件循环机制。

### 事件循环驱动的功能注册回调机制

Minecraft游戏提供了[minecraft:tick](./data/minecraft/tags/functions/tick.json)标签，注册于该标签内的函数每gt都会被按顺序执行一次，由此构成了事件循环Event Loop。本数据包通过该接口注册每gt需监听触发事件的函数列表（实际位于[tags/command_registry.json](.\data\clevi\tags\functions\commands_registry.json)文件中），将玩家计分板项command_panel数值作为事件触发判据，确定何回调函数会在本事件循环中触发。

而对于玩家而言，一切都从一个聊天栏中出现的主菜单开始。

### 功能调用链

主菜单UI界面提供了一系列可供点击的按钮，这是通过tellraw命令中的clickEvent与run_command实现的。对于本数据包而言，所有按钮都应当仅仅调用一个形如 `/trigger command_panel [set <一个被监听的CMD值>]` 的函数，让后面的实现交给事件循环机制。哪怕是 `/scoreboard players set @s 计分板名 114514 `或者 `/tp ~ ~1 ~` 这样简单的业务逻辑，也应当尽量避免直接嵌入到UI中。这是因为作者认为，UI应当与具体的业务逻辑实现相分离，不管业务逻辑看似暂时有多么简单。

![事件循环的轮询](docs/images/闲时事件循环示意图.png)

上述按钮导致了计分板项command_panel的数值发生变化，这叫做**回调函数的触发事件**。设置了的数值代表着每个回调函数通过**观察者机制**监听的整数值，我们称其为**命令值（CMD）**，这一整数必须唯一，且作为回调函数监听的目标选择器的参数之一。触发事件发生时，事件循环（表现为我们注入到了minecraft:tick标签中的[clevi:tick.mcfunction](.\data\clevi\functions\tick.mcfunction)）先给导致这一变化的玩家打上IsRunningCommand标签，这使得玩家被认为是当前正在执行命令的实体。这一看似多余的标签也允许了后续玩家延时执行某一回调函数，其command_panel值在一段时间内不为0，但未即刻呼叫处于“挂起”状态（拥有“SkipExecuteCommand”标签）。

回调函数通过观察者被调用。观察者同样是一个函数，它们都位于[trigger_command_panel](.\data\clevi\functions\trigger_command_panel)路径下，唯一的目的就是确保每gt任何符合调用条件玩家的CMD值不为默认值0时调用其对应的业务逻辑函数。对于某些存在状态的业务逻辑而言，观察者同样要负责根据CMD值，判断具体需要调用哪种业务逻辑。(例：Ob功能)

监听机制、回调函数实际执行体与事件循环机制需要解耦，因此具体执行业务逻辑的函数体存放于[commands](.\data\clevi\functions\commands)文件夹下。有状态功能如难以在单文件中编成，可以分状态给出代码，但需要反向修改对应观察者的逻辑（在此，代码不可避免地耦合）。

![一般函数的触发调用链](docs/images/普通命令调用链示意图.png)

### UI重绘

对于有状态函数而言，往往需要刷新UI。我们提供了下列API以重绘主菜单。如果需要刷新其他UI（例如二级菜单，本项目中未制作），也可以采用相似的方法撰写自己的UI重绘函数，只需把API内实际调用的UI绘制函数替换即可。

```
execute as @s run function clevi:apis/refresh_ui_menu
```

### 功能调用结束

任何业务逻辑执行完毕后，都由业务逻辑需要关闭事件（很不优雅地干了别人的事），以免重复调用或死循环，这是通过以下代码实现的：

```mcfunction
# Exit Function
scoreboard players set @s command_panel 0
tag @s remove IsRunningCommand
```

其中，第一行表明该功能执行完毕，回到命令调用的初始状态，而不存在由执行态到执行态的转移（要么延时1gt执行，要么依靠事件循环中回调函数的注册顺序在同一gt内**不可靠**地顺序执行）。无论是否延时执行某功能，最后一行的移除标签命令都是必需的，它表明该玩家没有在这一gt以外点击按钮或使用本数据包功能。

至此，一项功能的调用就完成了，玩家计分板项command_panel回到初始值0，以供下一次调用。

### 重载初始化任务

除事件循环外，数据包也允许注入Minecraft提供的[minecraft:load](.\data\minecraft\tags\functions\load.json)函数标签，使得数据包在reload过后或初次加载过后可以执行一些任务。这常常被用于执行一些初始化操作、启动一系列无条件定时任务，或仅仅向管理员展示数据包已重载。

### 定时任务

定时任务使用schedule命令实现，为了避免干扰其他定时任务的执行，在本数据包中统一使用append模式。

无条件定时任务都通过minecraft:load来调用队列，每次数据包重载时，定时任务的队列都会开始全新一轮执行。

定时任务们的调度器位于[schedulers](.\data\clevi\functions\schedulers)路径下，而业务逻辑位于[scheduled_commands](.\data\clevi\functions\scheduled_commands)路径下。对于每个定时任务，其调度器的内容都与常规回调函数的观察者类似，应当仅仅包含判断调用条件并调用的部分，但其末尾还需要定时递归调用自身。例如对于*scheduler_check_login*调度器而言，其构成如下：

```
execute as @e[type=player] run function clevi:scheduled_commands/check_login
schedule function clevi:schedulers/scheduler_check_login 1s
```

这个调度器在1s后调用它自身，因而不像minecraft:tick那样高频地占用资源，又能持续检查是否有玩家登录事件。

### 功能分类

需要添加功能时，应当明确功能业务逻辑特性，并在文档中注明属于以下哪种功能：

| 功能类别             | 说明                                                                                                             |
| -------------------- | ---------------------------------------------------------------------------------------------------------------- |
| 一般功能             | 面向过程、幂等的函数式功能，即不保留状态，多次执行效果相同，且不产生GUI界面的功能。                              |
| 有状态功能 | 这项功能的具体效果取决于其他可能存在的计分板项、标签、NBT或虚拟实体NBT。<br />这类功能往往会访问或修改状态变量。 |
| 子功能               | 这项功能修改了某个有状态功能需要读取的状态变量。<br />一般作为配置项存在。                                       |
| 有UI功能             | 这项功能会提供一个可供交互的界面，或者其他界面的显示效果会因此功能的执行而发生变化。                             |
| 危险功能             | 该功能在生存模式中往往对玩家甚至存档造成难以补救的损害。<br />这类功能需要使用醒目字体，并放置于不易误触的位置。 |


### 开发建议

1. 所有业务逻辑代码内必须加注释并清晰地空行分段，否则您和您的电脑将面临战术核打击和全面生物武器进攻风险。
2. 建议采用文档驱动开发模式，先完善功能文档（见“功能”节）、再确定CMD监听值和业务逻辑执行链，然后实际编码，最后添加菜单内按钮。
3. 功能文档按照CMD值排序，并且类似的功能CMD值应当紧邻。主菜单UI按钮的实现顺序应当与文档顺序相对应。
4. 按照变量是否私有于某个玩家或实体，自行选择使用计分板项或虚拟实体NBT。计分板名使用下划线命名法，虚拟实体NBT使用大驼峰命名法。
5. tag名称使用大驼峰命名法。
6. 主菜单使用语言可按需求自行本地化，本仓库不再提供其他语言版本。

### 注意到的缺陷

1. 事件循环实际上使用了@r选择器，因此在同一gt内如有多个玩家调用函数，则可能会给玩家按随机顺序依次延迟1gt执行。考虑到1gt的时间长度和网络延迟等因素，这似乎比较难以发生，且并不十分致命，但仍属于未定义错误。
