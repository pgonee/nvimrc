# nvimrc

run this code:

```
cd && \
mkdir -p .config && \
git clone git@github.com:pgonee/nvimrc.git ~/.config/nvim && \
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' && \
nvim +PlugInstall +qall && \
git config --global core.editor "nvim"
```
