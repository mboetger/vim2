My VIM Setup

Setup taken from http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/


To Add a New Plugin:
'''bash
cd ~/.vim
mkdir ~/.vim/bundle
git submodule add http://github.com/<user>/<repo>.git bundle/<repo>
git add .
git commit -m "Install <repo> bundle as submodule"
'''
