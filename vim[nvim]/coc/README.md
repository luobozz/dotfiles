## 1. 安装node( >= 12.12)

#### 可以直接安装(!!不同的node版本源不同)

```
apt/yum/brew install node
```
#### nvm安装(zsh案例)

- 官方安装
```

cd ~/ - -切到主目录

git clone https://github.com/creationix/nvm.git .nvm 

cd ~/.nvm - -进入nvm代码目录

git checkout v0.33.11 - -切换到v0.33.11版本

sudo chmod +x ./nvm.sh

./nvm.sh - -执行命令

```
- zsh插件安装
```

git clone https://github.com/lukechilds/zsh-nvm ~/.h-my-zsh/
ustom/plugins/zsh-nvm

~/.zshrc --plug中添加zsh-nvm

source ~/.zshrc

```
- 最后
```
#shrc追加
export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/irrors/node

#npm切源
npm config -g set registry https://registry.npm.taobao.org

```

## 2. 安装vim-plug
```
#raw下载源暂时无法使用，通过git安装方式
git clone git@github.com:junegunn/vim-plug.git ~/.config/nvim/.vim-plug

cp ~/.config/nvim/.vim-plug/plug.vim ~/.config/nvim/autoload/plug.vim

#到nv下安装
nv
:PlugInstall

#推出重新nv checkhealth
:checkhealth
#安装LSP support.
:CocInstall coc-json coc-tsserver

```