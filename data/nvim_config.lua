require "nvchad.options"

-- Get the user's identity from git config
local identity = vim.fn.system('git config user.identity'):gsub("\n", "")

-- Define user variables
if identity == "42" then
	vim.g.user42 = vim.fn.system('git config user.name'):gsub("\n", "")
	vim.g.mail42 = vim.fn.system('git config user.email'):gsub("\n", "")
end

local filename = vim.fn.expand('%:t')

-- Set options
vim.opt.wrap = false
vim.opt.autoindent = true
vim.opt.tabstop = 4 -- Size of tabs

if identity == "epitech" then
    vim.opt.shiftwidth = 4 -- Autoindent size
    if filename ~= "Makefile" then
        vim.opt.expandtab = true -- Use spaces instead of tabs
    end
    vim.opt.softtabstop = 4 -- Group delete spaces in tabs
elseif identity == "42" then
    vim.opt.shiftwidth = 4 -- Autoindent size
    vim.opt.expandtab = false -- Use tabs instead of spaces
end

-- Set colorcolumn based on identity
if identity == "epitech" then
    vim.opt.colorcolumn = "80"
elseif identity == "42" then
    vim.opt.colorcolumn = "81"
end

