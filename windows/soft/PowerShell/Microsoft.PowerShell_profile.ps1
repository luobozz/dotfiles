oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/zash.omp.json" | Invoke-Expression

Set-PSReadLineOption -PredictionSource History # 设置预测文本来源为历史记录
 
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete # 设置 Tab 键补全
Set-PSReadlineKeyHandler -Key "Ctrl+d" -Function ViExit

#$env:HTTP_PROXY="http://localhost:10809"
#$env:HTTPS_PROXY="http://localhost:10809"

Set-Alias -Name c clear
Set-Alias -Name sc scoop
Set-Alias -Name nf neofetch