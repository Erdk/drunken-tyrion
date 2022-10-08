set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua <<EOF
require("mason").setup()
require("mason-lspconfig").setup()

local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()
EOF
