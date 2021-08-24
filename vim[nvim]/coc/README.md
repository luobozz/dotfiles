##### 安装node( >= 12.12)
   1. 可以直接安装(!!不同的node版本源不同)
   ```
   apt/yum/brew install node
   ```
   2. nvm安装(zsh案例)
   ```
   cd ~/ - -切到主目录
   git clone https://github.com/creationix/nvm.git .nvm - -克隆代码到文件夹 .nvm
   cd ~/.nvm - -进入nvm代码目录
   git checkout v0.33.11 - -切换到v0.33.11版本
   sudo chmod +x ./nvm.sh
   ./nvm.sh - -执行命令
   #shrc追加
   export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
   #npm切源
   npm config -g set registry https://registry.npm.taobao.org
   ```