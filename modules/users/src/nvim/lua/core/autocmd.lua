-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- FORCE CMakeLists.txt to be recognized as cmake (works with all Neovim versions)
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "CMakeLists.txt",
  callback = function()
    vim.bo.filetype = "cmake"
    vim.bo.syntax = "cmake"
  end,
})

-- Also handle when file is already loaded
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "CMakeLists.txt",
  callback = function()
    if vim.bo.filetype ~= "cmake" then
      vim.bo.filetype = "cmake"
      vim.bo.syntax = "cmake"
    end
  end,
})

local src_autocmd = vim.api.nvim_create_augroup('src_autocmd', {clear = true})
-- Auto-create directories when saving a file
vim.api.nvim_create_autocmd('BufWritePre', {
    group = src_autocmd,
    desc = 'Create directories if they dont exist',
    callback = function(event)
        local file = vim.loop.fs_realpath(event.match) or event.match
        local dir = vim.fn.fnamemodify(file, ':h')
        if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, 'p')
        end
    end,
})

-- Auto-detect filetypes for certain extensions
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    group = src_autocmd,
    pattern = '*.txt',
    callback = function()
        vim.bo.filetype = 'text'
    end,
})

-- Remember last cursor position
vim.api.nvim_create_autocmd('BufReadPost', {
    group = src_autocmd,
    desc = 'Remember last cursor position',
    callback = function()
        if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.cmd('normal! g`"')
        end
    end,
})

-- Format options for specific filetypes
vim.api.nvim_create_autocmd('FileType', {
    group = src_autocmd,
    pattern = { 'lua', 'javascript', 'typescript','TelescopePreview' },
    callback = function()
        --vim.opt_local.mouse = 'a'
        if vim.bo.filetype ~= 'TelescopePreview' then
            vim.bo.formatoptions = vim.bo.formatoptions:gsub('a', '')
        end
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    group = src_autocmd,
    pattern = { 'c', 'cpp', 'h' },
    callback = function(ev)
        vim.bo[ev.buf].expandtab = true
        vim.bo[ev.buf].shiftwidth = 2
        vim.bo[ev.buf].tabstop = 4
        vim.bo[ev.buf].softtabstop = 4
        vim.bo[ev.buf].autoindent = true
        vim.bo[ev.buf].cindent = true
        vim.bo[ev.buf].smartindent = false
        vim.schedule(function()
            if vim.api.nvim_buf_is_valid(ev.buf) then
                vim.bo[ev.buf].indentexpr = ""
            end
        end)
    end,
})
