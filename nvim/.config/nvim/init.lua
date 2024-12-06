-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Set wrapping and terminal colors
vim.opt.wrap = true
vim.opt.termguicolors = true

-- [[ Setting options ]]
-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = "unnamedplus"

-- Enable popup transparency
vim.opt.pumblend = 10

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true
vim.opt.undolevels = 1000

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Insert indent automatically
vim.opt.autoindent = true

-- Set tab width to 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true -- Use spaces instead of tabs

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Enable smooth scrolling
vim.opt.smoothscroll = true

-- [[ Basic Keymaps ]]
-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show [d]iagnostic error messages" })
vim.keymap.set("n", "<leader>l", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix [l]ist" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Resize window
vim.keymap.set("n", "<C-w><left>", "10<C-w><", { desc = "Resize window" })
vim.keymap.set("n", "<C-w><right>", "10<C-w>>", { desc = "Resize window" })
vim.keymap.set("n", "<C-w><up>", "10<C-w>+", { desc = "Resize window" })
vim.keymap.set("n", "<C-w><down>", "10<C-w>-", { desc = "Resize window" })

-- Save file
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Delete buffer
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete Buffer" })

vim.keymap.set("n", "<leader>wb", "<C-W>s", { desc = "Split Window Below", remap = true })
vim.keymap.set("n", "<leader>wr", "<C-W>v", { desc = "Split Window Right", remap = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Increment/decrement
vim.keymap.set("n", "+", "<C-a>", { desc = "Increment numbers" })
vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement numbers" })

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- [[ Basic Autocommands ]] Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- add your plugins here
		{ import = "plugins" },
	},
	-- automatically check for plugin updates
	checker = { enabled = true },
})
