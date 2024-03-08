"set langmap=йЙцЦуУкКеЕнНгГшШщЩзЗхХъЪфФыЫвВаАпПрРоОлЛдДжЖэЭяЯчЧсСмМиИтТьЬбБюЮ\\,;qQwWeErRtTyYuUiIoOpP[{]}aAsSdDfFgGhHjJkKlL;:'\"zZxXcCvVbBnNmM\\,<.>/?
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

set mouse=a  " enable mouse
set encoding=utf-8
set number
set noswapfile
set clipboard+=unnamed
set scrolloff=2
set tabstop=4

set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
filetype indent on      " load filetype-specific indent files

" for tabulation
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2

call plug#begin('~/.vim/plugged')
Plug 'kevinhwang91/nvim-ufo'
Plug 'kevinhwang91/promise-async'
Plug 'tpope/vim-repeat'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'svermeulen/vim-cutlass'
" https://github.com/gbprod/cutlass.nvim
Plug 'tpope/vim-surround'
Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'terryma/vim-multiple-cursors'
Plug 'rlane/pounce.nvim'
Plug 'hoffs/theme-sunset.nvim'
Plug 'mg979/vim-visual-multi'
Plug 'nvim-lua/plenary.nvim'
Plug 'rest-nvim/rest.nvim'
Plug 'karb94/neoscroll.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'tamago324/nlsp-settings.nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'rcarriga/nvim-notify'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'arp242/jumpy.vim'
Plug 'fedepujol/move.nvim'
" up/down move
Plug 'vim-scripts/move_until_char_changes.vim'

" color schemas
Plug 'morhetz/gruvbox'  " colorscheme gruvbox
Plug 'ulwlu/elly.vim'  " colorscheme gruvbox
Plug 'sainnhe/everforest'  " colorscheme gruvbox

Plug 'xiyaowong/nvim-transparent'

" JS/JSX/TS
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'
" TS from here https://jose-elias-alvarez.medium.com/configuring-neovims-lsp-client-for-typescript-development-5789d58ea9c
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'nvim-lua/plenary.nvim'

Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

Plug 'bmatcuk/stylelint-lsp'

Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Convenient floating terminal window
"Plug 'voldikss/vim-floaterm'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

call plug#end()


let mapleader = '<space>'

" Netrw file explorer settings
let g:netrw_banner = 0 " hide banner above files
let g:netrw_liststyle = 3 " tree instead of plain view
let g:netrw_browse_split = 3 " vertical split window when Enter pressed on file

" Automatically format frontend files with prettier after file save
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:transparent_enabled = v:true

" Disable quickfix window for prettier
let g:prettier#quickfix_enabled = 0

" Turn on vim-sneak
let g:sneak#label = 1

"colorscheme gruvbox 

"coc
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
vnoremap > >gv
vnoremap < <gv
vnoremap y ygv
 
lua <<EOF
  require("pounce").setup({
    accept_keys = "QWERTYUIOPASDFGHJKLZXCVBNM",
    accept_best_key = "<enter>",
    multi_window = true,
    debug = false,
  })
  require("rest-nvim").setup({
    -- Open request results in a horizontal split
    result_split_horizontal = false,
    -- Keep the http file buffer above|left when split horizontal|vertical
    result_split_in_place = false,
    -- Skip SSL verification, useful for unknown certificates
    skip_ssl_verification = false,
    -- Encode URL before making request
    encode_url = true,
    -- Highlight request on run
    highlight = {
      enabled = true,
      timeout = 150,
    },
    result = {
      -- toggle showing URL, HTTP info, headers at top the of result window
      show_url = true,
      show_http_info = true,
      show_headers = true,
      -- executables or functions for formatting response body [optional]
      -- set them to nil if you want to disable them
      formatters = {
        json = "jq",
        html = function(body)
          return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
        end
      },
    },
    -- Jump to request line on run
    jump_to_request = false,
    env_file = '.env',
    custom_dynamic_variables = {},
    yank_dry_run = true,
  })
EOF

lua <<EOF
require('neoscroll').setup({
  mappings = {'<C-u>', '<C-d>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
  pre_hook = function(info) if info == "cursorline" then vim.wo.cursorline = false end end,
  post_hook = function(info) if info == "cursorline" then vim.wo.cursorline = true end end,
  hide_cursor = false,
  stop_eof = false,
  use_local_scrolloff = false,
  respect_scrolls_alone = false,
  easing_function = nil,
})

local t = {}
  t['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '50', 'sine', [['sine']] } }
  t['<C-d>'] = { 'scroll', {  'vim.wo.scroll', 'true', '50', 'sine', [['sine']] } }
  t['<C-y>'] = {'scroll', { '10', 'true', '10'}}
  t['<C-e>'] = {'scroll', { '-10', 'true', '10'}}
  t['zt'] = { 'zt', {'10'} }
  t['zz'] = { 'zz', {'10'} }
  t['zb'] = { 'zb', {'10'} }
  require('neoscroll.config').set_mappings(t)

EOF
nmap <C-s> <cmd>Pounce<CR>
nmap <C-S-s> <cmd>PounceRepeat<CR>
vmap <C-s> <cmd>Pounce<CR>
omap <C-S-s> <cmd>PounceRepeat<CR>

highlight PounceMatch gui=bold guifg=#555555 guibg=#dddddd
highlight PounceGap gui=bold guifg=#555555 guibg=#aaaaaa
highlight PounceAccept gui=bold guifg=#111111 guibg=#eeeeee

lua << EOF
  require'lspconfig'.gopls.setup{
     init_options = { usePlaceholders = true }
  }
EOF

lua <<EOF
vim.o.foldcolumn = '1'
vim.o.foldlevel = 10 
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:▿,foldsep: ,foldclose:▹]]
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = false
}
require('ufo').setup()
EOF

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

if exists('g:vscode')
  " nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR> | :call VSCodeNotify('editor.toggleFold')<CR>
  
  nnoremap <silent> h <Cmd>call VSCodeNotify('cursorLeft')<CR>
  nnoremap <silent> j <Cmd>call VSCodeNotify('cursorDown')<CR>
  nnoremap <silent> k <Cmd>call VSCodeNotify('cursorUp')<CR>
  nnoremap <silent> l <Cmd>call VSCodeNotify('cursorRight')<CR>

  nnoremap <silent> za <Cmd>call VSCodeNotify('editor.toggleFold')<CR>
  nnoremap <silent> zR <Cmd>call VSCodeNotify('editor.unfoldAll')<CR>
  nnoremap <silent> zM <Cmd>call VSCodeNotify('editor.foldAll')<CR>
  nnoremap <silent> zo <Cmd>call VSCodeNotify('editor.unfold')<CR>
  nnoremap <silent> zO <Cmd>call VSCodeNotify('editor.unfoldRecursively')<CR>
  nnoremap <silent> zc <Cmd>call VSCodeNotify('editor.fold')<CR>
  nnoremap <silent> zC <Cmd>call VSCodeNotify('editor.foldRecursively')<CR>

  nnoremap <silent> z1 <Cmd>call VSCodeNotify('editor.foldLevel1')<CR>
  nnoremap <silent> z2 <Cmd>call VSCodeNotify('editor.foldLevel2')<CR>
  nnoremap <silent> z3 <Cmd>call VSCodeNotify('editor.foldLevel3')<CR>
  nnoremap <silent> z4 <Cmd>call VSCodeNotify('editor.foldLevel4')<CR>
  nnoremap <silent> z5 <Cmd>call VSCodeNotify('editor.foldLevel5')<CR>
  nnoremap <silent> z6 <Cmd>call VSCodeNotify('editor.foldLevel6')<CR>
  nnoremap <silent> z7 <Cmd>call VSCodeNotify('editor.foldLevel7')<CR>
  xnoremap <silent> zV <Cmd>call VSCodeNotify('editor.foldAllExcept')<CR>
  nnoremap <silent> zj <Cmd>call VSCodeNotify('editor.gotoNextFold')<CR>
  nnoremap <silent> zk <Cmd>call VSCodeNotify('editor.gotoPreviousFold')<CR>
  vnoremap <Space> zf
endif


silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" Visual-mode commands
vnoremap <silent> <A-j> :MoveBlock(1)<CR>
vnoremap <silent> <A-k> :MoveBlock(-1)<CR>

nnoremap U u
nnoremap u <Nop>


