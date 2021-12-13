# 教程
- [https://zhuanlan.zhihu.com/p/367866550](https://zhuanlan.zhihu.com/p/367866550)
- [https://zhuanlan.zhihu.com/p/137251716](https://zhuanlan.zhihu.com/p/137251716)

# 下载powershell7
[https://github.com/PowerShell/PowerShell/releases](https://github.com/PowerShell/PowerShell/releases)

# 安装oh-my-posh & posh-git
<!-- git存疑问,不安装会报posh的特殊依赖 -->
- Install-Module posh-git -Scope CurrentUser # posh-git
- Install-Module oh-my-posh -Scope CurrentUser -RequiredVersion 2.0.496 # oh-my-posh

# 修改$Profile配置文件
`code $Profile`

```
Import-Module posh-git # 引入 posh-git
Import-Module oh-my-posh # 引入 oh-my-posh

Set-Theme Paradox # 设置主题为 Paradox

Set-PSReadLineOption -PredictionSource History # 设置预测文本来源为历史记录
 
Set-PSReadlineKeyHandler -Key Tab -Function Complete # 设置 Tab 键补全
Set-PSReadLineKeyHandler -Key "Ctrl+d" -Function MenuComplete # 设置 Ctrl+d 为菜单补全和 Intellisense
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo # 设置 Ctrl+z 为撤销
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward # 设置向上键为后向搜索历史记录
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward # 设置向下键为前向搜索历史纪录
```

# 字体
[https://github.com/powerline/fonts](https://github.com/powerline/fonts)