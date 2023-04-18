# nvimrc

run this code:

```
cd && \
mkdir -p .config && \
git clone git@github.com:pgonee/nvimrc.git ~/.config/nvim && \
sh -c 'git clone --depth 1 https://github.com/wbthomason/packer.nvim\
       ~/.local/share/nvim/site/pack/packer/start/packer.nvim' && \
nvim +PackerInstall +qall && \
git config --global core.editor "nvim"
```
