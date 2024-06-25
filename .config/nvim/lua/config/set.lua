-- enable line numbers
vim.opt.number = true
-- enable relative line numbers
vim.opt.relativenumber = true

-- open horizontal splits at the bottom
vim.opt.splitbelow = true
-- open vertical splits to the right
vim.opt.splitright = true

-- disable line wrapping
vim.opt.wrap = false

-- sets the number of spaces a tab equals
vim.opt.tabstop = 4
-- sets the number of spaces inserted when pressing tab
vim.opt.softtabstop = 4
-- sets the number of spaces used for autoindentation
vim.opt.shiftwidth = 4
-- insert spaces instead of tabs
vim.opt.expandtab = true

-- auto indent when starting new line
vim.opt.smartindent = true

-- sync clipboard with system clipboard
vim.opt.clipboard = "unnamedplus"

-- moves the cursor to the centre when scrolling
vim.opt.scrolloff = 999

-- set the cursor to be positied where there are no characters
-- in visual block mode only
vim.opt.virtualedit = "block"

-- when previewing changes for text replacement show in split window
vim.opt.inccommand = "split"

-- disable highlighting on search
vim.opt.hlsearch = false

-- While typing a search command, show where the pattern, as it was typed so far, matches. 
vim.opt.incsearch = true

-- ignore case when typing commands unless \C or more caps in search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- enable 24-bit colour support
vim.opt.termguicolors = true

-- enable block cursor 
vim.opt.guicursor = ""

-- always show sign column
vim.opt.signcolumn = "yes"

-- if this many milliseconds nothing is typed the swap file will be written to disk
vim.opt.updatetime = 50


--vim.opt.colorcolumn = "80"

-- enable nerd font
vim.g.have_nerd_font = true

-- every wrapped line will continue visually indented
vim.opt.breakindent = true

-- save undo history
vim.opt.undofile = true

-- decrease mapped sequence wait time/ which-key popup
vim.opt.timeoutlen = 300

-- display certain whitespace chars
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- shows which line cursor is on
vim.opt.cursorline = true
