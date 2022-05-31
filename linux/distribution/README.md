# 额外安装

## arch
- install 基础
  
  ```
  #xorg
  解决 "X Error of failed request:  BadLength (poly request too large or internal Xlib length error)"
  https://gitlab.freedesktop.org/xorg/lib/libxft/-/merge_requests/1#note_388317
  yay -S libxft-bgra lib32-libxft-bgra
  ```

- install WM 
  
  ```
  yay -S picom feb acpi dmenu
  ```

- install ranger
 ```
 #图片预览
 pip install ueberzug
 #视频预览
 yay -S ffmpeg ffmpegthumbnailer
 #pdf预览
 yay -S poppler
 ```

- install dwmblocks
  ```
  #日历
  yay -S calcurse
  #音频
  yay -S pamixer
  #U盘自动挂载
  yay -S udisks
  yay -S udevil
  #亮度
  yay -S light-git
  
  #python3脚本需求
  #pip install requests
  ```

- install 输入法 
  ```
  #fcitx4
  sudo pacman -S fcitx fcitx-im fcitx-sogoupinyin fcitx-configtool
  #fcitx5
  sudo pacman -S fcitx5 fcitx5-configtool fcitx5-qt fcitx5-gtk fcitx5-chinese-addons 
  #皮肤
  sudo pacman -S fcitx5-material-color fcitx5-nord
  #词库
  sudo pacman -S fcitx5-pinyin-moegirl fcitx5-pinyin-zhwiki fcitx5-pinyin-sougou
  ```

- install 蓝牙
  
  `sudo pacman -S bluez bluez-utils blueman pulseaudio-bluetooth`

- install git
  
  ```
  #git
  `yay -S git`
  #lazygit
  `yay -S lazygit`
  ```

- install pip3  
  
  `curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py`

- install qq和微信 
    
    ```
    #官方简陋版本
    yay -S linuxqq
    yay -S wechat-uos
    #wine
    yay -S deepin-wine-tim
    https://github.com/vufa/deepin-wine-tim-arch FQA
    yay -S com.qq.weixin.deepin
    https://github.com/vufa/deepin-wine-wechat-arch FQA
    ```

- install 开发软件
  
  ```
  yay -S vscode jetbrains-toolbox
  # dwm idea的bug [https://blog.csdn.net/u010563350/article/details/104948256](https://blog.csdn.net/u010563350/article/details/104948256)
  
  ```

- install 其他软件   
  ```
  #截图
  yay -S flameshot
  #top
  yay -S bpytop
  #vlc
  yay -S vlc-git
  #wps
  yay -S wps-office-mui-zh-cn wps-office-cn wttf-wps-fonts
  # for pdf reader
  sudo pacman -S zathura zathura-pdf-mupdf
  # 百度云盘
  yay -S electron9-bin
  yay -S baidunetdisk-electron
  ```

- install java环境
  ```
  wget https://raw.githubusercontent.com/luobozz/LBSH/main/package/mini_script/java_installer
  chmod +x ./java_installer
  sudo ./java_installer
  wget https://raw.githubusercontent.com/luobozz/LBSH/main/package/mini_script/maven_installer
  chmod +x ./maven_installer
  sudo ./maven_installer
  
  ```


- 备份系统
  ```
  https://www.jianshu.com/p/b03a51c682a5
  ```