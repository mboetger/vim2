My VIM Setup

Setup taken from http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

To Install in New Environment
```bash
cd ~
git clone http://github.com/mboetger/vim2.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
```

To Add a New Plugin:
```bash
cd ~/.vim
mkdir ~/.vim/bundle
git submodule add http://github.com/<user>/<repo>.git bundle/<repo>
git add .
git commit -m "Install <repo> bundle as submodule"
```
