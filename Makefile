VIM_PLUG_PATH ?= "${HOME}/.local/share"

install:
	sh -c 'curl -fLo "$(VIM_PLUG_PATH)"/nvim/site/autoload/plug.vim --create-dirs \
	   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	nvim +PlugInstall +qall
	nvim +"CocInstall coc-pyright" +"CocInstall coc-json" +"CocInstall coc-tsserver" +"CocInstall coc-prettier"
