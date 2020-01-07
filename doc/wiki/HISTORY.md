VimDesktop 2.2.2 (2018-04-23)
=============================
新增功能
--------
- 主程序
    - 添加 `<CancelAlwaysOnTop>`，用于取消窗口置顶。
    - 添加 `<ToggleTitleBar>`，用于显示或隐藏标题栏。

缺陷修复
--------
- 主程序
    - 修复运行时报 CustomInit 函数不存在的问题。

VimDesktop 2.2.1 (2018-04-22)
=============================

新增功能
--------
- 主程序
    - 删除不再维护的 KeePass 和 WizNote 插件。
    - 添加 pause 按键。
    - 添加 `<AppendClipboard>`，用于往剪切板新增内容。
    - 修改 #MaxHotkeysPerInterval 为 200。
    - 添加 `<RunAhkInClipboard>`，用于运行剪切板中的 AHK 代码。
    - 添加 `<SuspendMachine>`，用于待机。
    - 添加 `<AlwaysOnTop>`，用于指定当前窗口。
    - 将 check.ahk 功能整合到主程序中。

- TC插件
    - 添加 `<TC_ThumbsViewSwitchKey>`，切换成缩略图模式后自动修改 h l 键为方向键。
    - 添加新版本 TC 中的 `<cm_GoToFirstEntry>`、`<cm_FocusSrc>` 和 `<cm_FocusTrg>`。

缺陷修复
--------
- 主程序
    - 修复 ScrollLock 错误按键名。
    - 修复编译成的 exe 运行出错（#19）。
    - 关闭 DetectHiddenWindows，以避免一些不符合预期的现象。

VimDesktop 2.2.0 (2017-11-06)
=============================

新增功能
--------
- 主程序
    - 发布 64 位版本。
- TC插件
    - <TC_CreateNewFileNewStyle> 支持从 TC 目录的 ShellNew/icons/ext.ico 加载菜单图标。
    - 定时（每 2 秒）检查一次配置文件是否有改动，如有则重新加载配置文件。

缺陷修复
--------
- TC插件
    - 修复 . 打开资源管理器可能出错的问题。
    - 在 <VimDConfig_EditConfig> 用配置文件里的 editor 来打开配置文件。
    - 新增 <TC_Restart> 用于重启 TC。
    - 修复和 64 位 TC 配合使用的若干问题。

VimDesktop 2.1.5 (2017-09-02)
=============================

新增功能
--------
- TC插件
    - 新增 `<TC_CreateBlankFileNoExt>`，用于创建没有扩展名的空文件，默认映射到 `<c-i>`。
    - 默认映射 `<c-t>` 到 `<cm_OpenDirInNewTab>`，在新标签页打开光标处目录。
    - Esc 键可以关闭新建文件的对话框。
    - <`SuperReturn>` 支持右侧窗口。
    - 新增 custom\_config\_path 配置，可以填写自定义的配置文件路径。
    - 将配置文件转移到 conf 目录。
    - `<PrintScreenAndSave>` 支持 jpg、png、gif、tiff 等多种扩展名。
    - 托盘菜单增加禁用、启用功能。
    - 新增 `<TC_ThumbsView>`，可以在缩略图模式自动重映射 h 和 l 键的功能为左右。

缺陷修复
--------
- TC插件
    - 修复 `<TC_ToggleMenu>` 可能导致 TC 关闭而不重新其他的问题。
    - 修复在热键和插件窗口无法直接用编辑器打开配置文件的问题。
    - 修复 azHistroy 历史菜单不对齐的问题。

VimDesktop 2.1.4 (2016-08-22)
=============================

缺陷修复
--------
- TC插件
    - 修复`<TC_SuperReturn>`在右侧窗口不能用的问题。
    - 修复`<PrintScreenAndSave>`在某些情况不能正常截图的问题（不再调用 mspaint 保存图片）。
    - 将`;`映射为`<cm_DirectoryHotlist>`，把`d`空出来，可以把`d`映射成`<TC_ListMark>`，因为它对目录跳转支持更好。

VimDesktop 2.1.3 (2016-05-12)
=============================
新增功能
--------
- TC插件
    - 按键提示中的大写字母，显示 X 而不是 <S-X>。
    - 查看插件和查看热键窗口隐藏底部滚动条。
    - 打开查看插件窗口时，自动选择第一个插件，并把焦点定位到搜索编辑框。
    - 查看插件和查看热键窗口中，切换插件后自动定位焦点到搜索编辑框。

缺陷修复
--------
- TC插件
    - 修复隐藏菜单栏功能。

VimDesktop 2.1.2 (2016-04-23)
=============================
新增功能
--------
- 主程序
    - 重新布局查看热键和查看插件窗口布局，让其更美观。
    - wshkey 改用 SendLevel, 1 实现
- Explorer插件
    - 调整`<Explorer_GotoTC>`为在TC打开 Explorer 当前或选定目录，默认映射到`F`。
    - 添加`<Explorer_GotoTCInNewTab>`，在TC新标签页打开 Explorer 当前或选定目录，默认映射到`f`。
    - 添加`<Explorer_GotoTCX>`，同`<Explorer_GotoTC>`，但会关闭 Explorer。
    - 添加`<Explorer_GotoTCInNewTabX>`，同`<Explorer_GotoTCINNewTab>`，但会关闭 Explorer。

缺陷修复
--------
- TC插件
    - 修复 TC_CopyNameOnly 不能用的问题。

VimDesktop 2.1.1 (2016-04-17)
=============================
新增功能
--------
- 主程序
    - 新增`<WindowMaxNoTitle>`标签，用于最大化窗口并且隐藏标题栏。
    - 新增`<PrintScreenAndSave>`标签，使用 mspaint 打开全屏或当前窗口截图并保存。
    - 新增`function`类型命令，可带一个参数。
    - 新增`ClickContextMenu()`函数，用于点击右键菜单。
- RunZ工具
    - 在 vimd.ini 里新增 RunZ 路径配置，默认在 ../RunZ，方便后续功能联动。
    - 移除 RunZ 工具，RunZ 地址：https://github.com/goreliu/runz
- TCDialog插件
    - 优化将当前目录返回调用方的实现方法（将文字选上），方便保存文件时改名。（杜立涛）

缺陷修复
--------
- TCDialog插件
    - 分步粘贴路径，避免因为多选文件导致路径字符串过长被截断。（杜立涛）

VimDesktop 2.1.0 (2016-04-13)
=============================
新增功能
--------
- 主程序
    - 添加`tccmd`类型命令，用于在 TC 的命令行运行命令。
    - 增加`<sp-x>=xxx`类型快捷键，空格 + x。
    - 增加`wshkey`类型命令，用`WScript.Shell`的`SendKeys()`来发送按键，解决按键无法传递的问题。
- TC插件
    - 添加`<TC_CreateBlankFile>`用于创建空文件。
    - 添加`TC_Run()`函数，用于在 TC 的命令行运行命令。
    - 添加`<TC_CreateNewFileNewStyle>`，新样式的创建文件菜单，默认映射到`i`。
    - 添加`<TC_PasteFileEx>`，粘贴文件，如果光标下为目录则粘贴进该目录。
    - 添加`<TC_Toggle_50_100Percent_V>`，用于在纵向分割的窗口切换 50% 和 100%，默认映射到`zh`。
- RunZ工具
    - 添加 RunZ 工具，取代之前鸡肋的 GKey，默认配置映射到 `win + j`（老配置需要手动改下，去掉无效标签）。
    - 功能如下（类似 altrun 和 almrun）：
    - 使用 tcmatch.dll 搜索指定目录的指定类型文件，支持拼音搜索等 tcmatch 自带功能。
    - 支持按文件名搜索和按完整路径搜索，支持按正则表达式排除文件（全局）。
    - 支持用 TC 打开搜索到的文件所在路径，显示文件名，和删除文件。
    - 支持调整搜索结果的优先级。
    - 支持用 ahk 的 Run 和 Cmd 运行命令。
    - 支持后台运行命令取回结果并展示。
    - 内置十几个函数，如计算器、显示剪切板内容、用浏览器搜索等。
    - 可以很方便地用 ahk 添加新函数。
    - 更多其他功能不一一列出。

缺陷修复
--------
- TC插件
    - 修复新建文件菜单图标错乱的问题。

VimDesktop 2.0.8 (2016-03-25)
=============================
新增功能
--------
- 主程序
    - 添加`SwitchIME()`和`<SwitchToEngIME>`，用于在插件中切换输入法（代码来自wideweide）。
- TC插件
    - 添加`<TC_ReOpenTab>`用于重新打开之前关闭的标签页，映射到`gr`。
    - 添加`<TC_OpenDirsInFile>`，功能是将光标所在的文件内容中的文件夹在新标签页依次打开。
    - 进入 normal 模式后自动将输入法切换到英文。
- Excel插件
    - 进入单元格编辑状态后自动进入 insert 模式。

缺陷修复
--------
- 主程序
    - 修复按键提示不能显示`run`、`key`和`dir`命令详情的问题。
    - 修复`vimd.ini`文件不能使用中文的问题（因为默认配置是 UTF-8 编码，只支持在 UTF-8 的 vimd.ini 中使用中文）。
    - 修复 vimd 在包含空格的路径下，添加插件会报错的问题。

VimDesktop 2.0.7 (2016-03-11)
=============================
新增功能
--------
- 主程序
    - 增加 dir 类型命令，用 TC 打开目录，用法`xx=dir|c:\test`。
- TC插件
    - 增加`<TC_MarkFile>`和`<TC_UnMarkFile>`功能，可和按标记显示文件颜色配合用于标记文件（如记录上次处理到的文件）。
    - 增加`<TC_SelectCmd>`功能，选择命令来执行，默认映射到`<`。
    - 添加`TC_SetTitle()`函数用于设置 TC 标题栏文字，添加`<TC_ClearTitle>`标签用于清空 TC 标题栏文字。

缺陷修复
--------
- 主程序
    - 修复`<`无法映射的问题（`>`继续无法映射，原因不明）。
- 其他插件
    - 修复 Explorer 插件不能在输入框自动切换成 insert 模式的问题。

VimDesktop 2.0.6 (2016-03-07)
=============================
新增功能
--------
- 主程序
    - 查看插件窗口支持搜索功能，查看热键和查看插件窗口的搜索均实时显示。
- TC插件
    - 添加 Launch 功能，启动 TC 并跳转到指定目录（尚不完善）。

缺陷修复
--------
- TC插件
    - 修复 Mark 标签可能显示 ERROR 的问题。
    - 修复两处 SendPos 错误。

VimDesktop 2.0.5 (2016-03-05)
=============================
新增功能
--------
- 主程序
    - 配置文件`[config]`中新增`enable_log`和`enable_debug`配置，用于调试。
    - 配置文件中，`[=normal]`可以省略，默认模式为 normal。
    - 添加`doc\PluginTemplete.ahk`插件模版，方便写插件。
    - 启动时检查是否有新增插件，如有则自动启用该插件（运行check.ahk，修改配置文件）。

缺陷修复
--------
- 其他
    - 修正`doc\example.ahk`。
    - 插件全部使用自定义名称，热键窗口不再显示难以看懂的 class 名。

VimDesktop 2.0.4 (2016-03-05)
=============================
新增功能
--------
- 主程序
    - 在查看热键窗口双击热键定义，会用vimd.ini中配置的编辑器(config->editor)打开对应的文件（ahk文件或vimd.ini）的相应内容（代码来自★★run）。
    - 查看热键窗口，新增搜索功能（代码来自★★run）。

VimDesktop 2.0.3 (2016-03-04)
=============================
新增功能
--------
- 主程序
    - 调整为更合理的目录结构。
    - 删除默认的配置文件vimd.ini，运行时若无此文件，自动复制vimd.ini.help.txt为此文件。
    - 支持用户自定义功能标签，在vimd.ini所在目录新增custom.ahk，则会自动包含进来，帮助见vimd.ini.help.txt。
    - vimd.exe换成AutoHotkeyU32.exe（原来是编译产生的exe），方便后续的功能改动。
- TC插件
    - 增加来自修为的如下功能标签：
        - `<TC_FileCopyForBak>`将当前光标下的文件复制一份作为作为备份
        - `<TC_FileMoveForBak>`将当前光标下的文件重命名为备份
        - `<TC_MultiFilePersistOpen>`多个文件一次性连续打开
        - `<TC_CopyFileContents>`不打开文件就复制文件内容
        - `<TC_OpenDirAndPaste>`不打开目录，直接把复制的文件贴进去
        - `<TC_MoveAllFilesToPrevFolder>`将当前文件夹下的所有文件移动到上层目录中
        - `<TC_MoveSelectedFilesToPrevFolder>`将当前文件夹下的选定文件移动到上层目录中
        - `<TC_MoveSelectedFilesToPrevFolder>`将当前文件夹下的所有文件移动到上层目录中
        - `<TC_SrcQuickViewAndTab>`预览文件时,光标自动移到对侧窗口里
        - `<TC_CreateFileShortcut>`创建当前光标下文件的快捷方式
        - `<TC_CreateFileShortcutToDesktop>`创建当前光标下文件的快捷方式并发送到桌面
        - `<TC_CreateFileShortcutToStartup>`创建当前光标下文件的快捷方式并发送到启动文件里
        - `<TC_FilterSearchFNsuffix_exe>`在当前目录里快速过滤exe扩展名的文件
        - `<TC_TwoFileExchangeName>`两个文件互换文件名

VimDesktop 2.0.2 (2016-03-03)
=============================
新增功能
--------
- TC插件
    - 增加`SaveMark`配置，如果为0，不读写m键Mark的配置文件。

VimDesktop 2.0.1 (2016-03-03)
=============================
缺陷修复
--------
- 主程序
    - 修复设置`shift + 其他键`绑定后，同时占用`shift + ctrl`、`shift + alt`的问题（ctrl、alt同理）。
- 其他插件
    - 修复Excel插件部分按键映射失效的问题。

VimDesktop 2.0.0 (2016-03-02)
=============================
新增功能
--------
- 主程序
    - `vimd.ahk`、`plugins/General/General.ahk` 和 `lib` 下部分文件改用 linxinhong 最新版本的。
    - 支持使用 `xx=<Default>[=mode]` 取消已有按键绑定，使用 `xx=<>[=mode]` 和 `xx=<Pass>[=mode]`屏蔽按键。
    - 添加全局配置`default_enable_show_info`配置项，用于设置默认是否显示按键补全提示。
    - 支持配置全局快捷键来启动程序，在`[global]`中配置，如 `<w-c>=run|explorer[=normal]`。
    - 插件可以使用`DisplayMode()`函数在进入模式时显示提示。
    - 插件可以使用`<ShowHelp>`标签显示所有按键的帮助提示。
    - 配置文件中的`key`和`run`类型快捷键帮助信息可以在帮助窗口和按键提示中看到了。
    - 默认的配置文件映射lalt系列按键到常用功能。
- TC插件
    - 配置文件中的快捷键使用新的格式。
    - 新增`<TC_ToggleMenu>`标签用于启用、禁用菜单栏，默认配置映射到 `Q` 键（启用需重启TC，禁用无需重启）。
    - `m`标记功能，将标记存入配置文件`TotalCommander软件目录\TCMark.ini`，重启vimd后继续有效。
    - 按`l`、进入`;`的标记、进入`n`的最近历史，都自动定位到第一个文件，跳过`..`（`d`书签除外，难以实现）。
- 其他插件
    - 把Excel插件移植过来，修复一些稳定性问题。
    - Foobar2000插件，使用ahk\_exe判断，添去掉insert模式，添加若干快捷键。
    - 添加Explorer插件（功能不全也有问题，仅供必须使用Explorer时临时使用）。
- 工具
    - 添加`GKey`工具，用于使用快捷功能。
- VimDesktop 2 原 HISTORY
    - 2015-07-05 22:54:00
    - 修复BUG，增加对老版本的支持。
    - 2015-02-11 13:31:04
    - 修改TC插件里的`<TC_GotoDesktop>`的执行方式，防止误操作。
    - 2015-02-09 18:03:12
    - TC插件，增加`<TC_CopyNameNoExt>`复制不含后缀的文件名到剪切板中。
    - 2015-02-09 18:03:12
    - 修复只能执行一次动作的Bug。
    - 2015-02-09 13:31:45
    - 增加[vim.SetModeFunction()](https://github.com/goreliu/VimDesktop/wiki/API#setmodefunctionfuncmodenamewinname)
    - 优化vim.Debug调试界面。
    - 优化判断逻辑。
    - 增加`<cm_SearchStandalone>`独立搜索界面、`<TC_GotoDesktop>`切换到桌面两个功能。
    - 增加check.ahk用于检测管理插件，增加viatc.ico做为VIMD的图标。
    - 修复TC插件对totalcmd64.exe识别出错的问题。
    - 修复任务栏图标右键无法退出的Bug。
    - 移动 `Plugins\Plugins.ahk`到`lib\vimd\_plugins.ahk`，便于管理。
    - 其它若干Bug修复。
    - 2015-02-07 17:49:20
    - 增加对老版本的vimd插件的支持（可以直接迁移）。
    - 增加在映射的热键的时候，Action无效的错误处理（直接添加vim.SetAction）。
    - 修复`<C-Esc>`无法复制Genral模式的问题
    - 其它若干Bug处理。
    - 2015-02-07 10:50:44
    - 修复CapsLock判断的错误。
    - 修复class\_vim 的几个逻辑错误。
    - 2015-02-05 16:44:11
    - 修复增加新特性后，TC插件无法使用的BUG。
    - 修复TC64位与32位不正确的BUG。
    - 修复按下\[Count\]后，不执行afterActionDo对应的函数。
    - 2015-02-05 11:09:11
    - 增加Example.ahk示例
    - 增加SetWin时，使用ahk\_exe判断，如:`vim.setwin("记事本", "Notepad", "notepad.exe")`
    - 修复vim.GetMore()不显示Count的Bug
    - 2015-02-03
    - 初始化


缺陷修复
--------
- 主程序
    - 修复显示快捷键和插件的窗口的部分功能和易用性相关缺陷。
    - 修复`HideInfo()`会导致插件自己的ToolTip信息显示不出来的缺陷。
- TC插件
    - 修复新建文件菜单不显示文件图标以及显示的文件可能重复的缺陷。
    - 修复老版TC插件移植到新的class\_vim.ahk产生的若干兼容性问题。
- 其他
    - 修复若干其他缺陷。

VimDesktop 1.4.0 (2016-02-25)
=============================
新增功能
--------
- 主程序
    - 支持使用`xx=<Pass>[=mode]`屏蔽按键。
    - 支持使用`xx=<>[=mode]`取消已有按键绑定。
- TC插件
    - 代码和配置文件中添加若干快捷键。
    - 整理完所有快捷键的文档（见wiki）。
- TCDialog插件
    - 支持用于保存文件对话框。
- 其他插件
    - 添加foobar2000插件。
    - 添加WizNote插件。
    - 增加WinMerge插件。
    - 添加BeyondCompare4插件。
    - 添加TCCompare插件。

缺陷修复
--------
- TC 插件
    - 修复`azHistroy` 无法打开名称包含&的目录的问题。

VimDesktop 1.2.1 (2013-12-19)
=============================
新增功能
--------
- 主程序
    - 添加 ini 配置文件支持。
    - 添加 API：`vim.Exclude(class)` 为全局热键排除某个窗口下可用。
    - 添加 API：`vim.smap(hotkey,action,class)`，与 `map` 相似，但是映射为保存为超
      级键，在用vim.exclude排除的窗口中可用。
    - 修改每个插件独立目录，以便管理.
- TC插件
    - 增加 totalcommander.ini 用于管理 TC 插件。
    - 增加寻找 TC 路径的界面，如果是安装版，可以通过注册表找到。如果是绿色版，需
      要指定路径。
    - `azHistroy` 修改为加载一次菜单，不会出现闪两次的问题.

缺陷修复
--------
- 主程序
    - 修复当 `capslock` 时，按任意符号键出错的问题。 
- TC 插件
    - 修复 `[count]gg`，跳转到 count 行的错误。 

VimDesktop 1.1.3 (2013-12-13)
=============================
缺陷修复
--------
- 主程序
    - 修复部分热键按下导致脚本崩溃的问题。

VimDesktop 1.1.0 (2013-12-13)
=============================
新增功能
--------
- 主程序
    - 调整 VimDesktop 的目录文件结构。
    - 修改任务栏图标菜单增加"主页"和"提交问题"菜单项。
    - 双击任务栏菜单弹出热键窗口。
    - 热键窗口修改为可调整。
    - 热键窗口数据居左显示。
    - 美化 a-z 历史的视觉效果。闪两次是必须的,没有办法。
    - 添加自动加载插件支持，不用手动 include 和 gosub 了。
- TC插件
    - `<lwin>e` 支持激活／最小化 TC。 

缺陷修复
--------
- 修复`o` 和 `O` 的下拉列表中，无法用字母选择盘符”的问题 。
- 修复一个小的操作逻辑。

VimDesktop 1.0.2 (2013-12-10)
=============================
新增功能
--------
- 基于 2013-12-10 源代码发布初始版本。
