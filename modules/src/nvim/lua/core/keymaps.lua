vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- Clear search highlights

-- Window Movement
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move to below window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move to above window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move to right window' })

-- Terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Diagnostics
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Buffer Management
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = '[B]uffer [D]elete' })
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>', { desc = '[B]uffer [N]ext' })
vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<CR>', { desc = '[B]uffer [P]revious' })


-- Arrow key remaps
vim.keymap.set("", "<up>", "<nop>", { noremap = true })
vim.keymap.set("", "<down>", "<nop>", { noremap = true })
vim.keymap.set("i", "<up>", "<nop>", { noremap = true })
vim.keymap.set("i", "<down>", "<nop>", { noremap = true })
vim.api.nvim_create_autocmd("VimEnter", { callback = function() vim.o.mouse = "" end })
