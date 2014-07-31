cd ~/.vim
mkdir ~/.vim/bundle
git submodule add http://github.com/<user>/<repo>.git bundle/<repo>
git add .
git commit -m "Install <repo> bundle as submodule"
