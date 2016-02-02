filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let vundle manage vundle
Plugin 'gmarik/vundle'

" utilities
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-sleuth' " detect indent style (tabs vs. spaces)
Plugin 'tpope/vim-bundler'

Plugin 'benmills/vimux'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'airblade/vim-gitgutter'
Plugin 'Chiel92/vim-autoformat'

Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

Plugin 'jiangmiao/auto-pairs'

" colorschemes
Plugin 'chriskempson/base16-vim'

" JavaScript
Plugin 'marijnh/tern_for_vim'
" HTML
Plugin 'mattn/emmet-vim'
call vundle#end()
filetype plugin indent on
