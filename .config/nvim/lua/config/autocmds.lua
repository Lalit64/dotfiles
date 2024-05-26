-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
vim.cmd([[
 autocmd ColorScheme * highlight BufferLineFill guibg=none
 autocmd ColorScheme * highlight BufferLineBackground guifg=#7a7c9e
 autocmd ColorScheme * highlight BufferLineBufferSelected guifg=white gui=none
]])
