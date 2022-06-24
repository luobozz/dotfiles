# 教程
- [https://zhuanlan.zhihu.com/p/367866550](https://zhuanlan.zhihu.com/p/367866550)
- [https://zhuanlan.zhihu.com/p/137251716](https://zhuanlan.zhihu.com/p/137251716)

# 下载powershell7
[https://github.com/PowerShell/PowerShell/releases](https://github.com/PowerShell/PowerShell/releases)

# 安装oh-my-posh & posh-git

```console
# git存疑问,不安装会报posh的特殊依赖

Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
Install-Module -Name BurntToast
```

# 修改$Profile配置文件
`code $Profile`
> [文件内容](./Microsoft.PowerShell_profile.ps1)
# 字体
[https://github.com/powerline/fonts](https://github.com/powerline/fonts)
> 大于>3.0版本无法识别图标的问题,下载nerd字体安装，并且配置，这里我适用firamono nerd
[https://www.nerdfonts.com/font-downloads](https://www.nerdfonts.com/font-downloads)
>powerShell快捷方式里无法设置字体,通过pwsh.exe启动设置后生效