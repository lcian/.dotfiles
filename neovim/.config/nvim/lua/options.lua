-- Configures all the basic vim options

-- General
-- Basic
vim.opt.compatible = false
vim.opt.encoding = "utf-8"
-- Leader key
vim.g.mapleader = " "
-- Normal backspace behavior
vim.opt.backspace = "indent,eol,start"
-- Timeout for key sequences in ms
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 100
-- Autocompletion
vim.opt.completeopt = { "menu", "menuone", "noselect" }
-- Use system clipboard for yanking and pasting
vim.opt.clipboard = "unnamedplus"
-- Use an undofile and no swapfile
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- Show matching bracket when inserting a new one
vim.opt.showmatch = true
-- Display current command
vim.opt.showcmd = true
-- Display matches and effects of substitutions in a split
vim.opt.inccommand = "split"
-- Command completion
vim.opt.wildmenu = true
vim.opt.wildmode = "full"
-- Avoid "written" message on writing a file
vim.opt.shortmess:append("W")
-- Disable questionable feature
vim.opt.modeline = false

-- Appearence
-- Make cursor always appear as a block
vim.cmd([[ set guicursor=n-v-c-i:block ]])
-- Show relative line numbers
vim.opt.number = true
vim.wo.relativenumber = true
-- Wrap long lines
vim.opt.linebreak = true
vim.opt.showbreak = [[↪ ]]
-- Split direction
vim.opt.splitbelow = true
vim.opt.splitright = true
-- Time interval for CursorHold events in ms, relied on by some plugins
-- People say that setting this too low (<1000) breaks things, but 250 works fine for me
vim.opt.updatetime = 250
-- Always keep 9 lines below/above cursor when moving outside view
vim.opt.scrolloff = 9
-- Sometimes you might need to use the mouse
vim.opt.mouse = "nvi"
-- Black magic that ensures colors are rendered correctly in my terminal
vim.cmd([[ let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" ]])
vim.cmd([[ let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum" ]])
vim.opt.termguicolors = true

-- Indentation
-- A tab is 4 spaces, 1 indent level is 4 spaces, expand tabs to spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- Keep current indentation when starting a new line
vim.opt.autoindent = true
-- Increase and decrease indentation automatically based on rules
vim.opt.smartindent = true
-- Always hide buffers when they're abandoned
vim.opt.hidden = true
vim.opt.bufhidden = "hide"

-- Search
-- Don't highlight matches
vim.opt.hlsearch = false
-- Highlight partial matches when typing search
vim.opt.incsearch = true
-- Normally, ignore case
vim.opt.ignorecase = true
-- If an uppercase character is present, don't ignore case
vim.opt.smartcase = true
