Import-Module posh-git # 引入 posh-git
Import-Module oh-my-posh # 引入 oh-my-posh

Set-PoshPrompt powerlevel10k_lean

Set-PSReadLineOption -PredictionSource History # 设置预测文本来源为历史记录
 
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete # 设置 Tab 键补全
Set-PSReadlineKeyHandler -Key "Ctrl+d" -Function ViExit