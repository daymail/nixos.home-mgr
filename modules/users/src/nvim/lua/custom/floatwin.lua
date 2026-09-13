local M = {}
local function get_dimensions(width_ratio, height_ratio)
    local screen_width = vim.o.columns
    local screen_height = vim.o.lines
    local win_width = math.floor(screen_width * width_ratio)
    local win_height = math.floor(screen_height * height_ratio)

    local row = math.floor((screen_height - win_height) / 2) - 1
    local col = math.floor((screen_width -win_width) / 2)

    return{
        relative = "editor",
        width = win_width,
        height = win_height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
    }
end

local function apply_highlights()
    local hl = vim.api.nvim_get_hl(0, { name = "TelescopeBorder" })
    local fg_color = vim.api.nvim_get_hl(0, { name = "Comment" }).fg or "#7fbbb3"
    local bg_color = hl.bg or vim.api.nvim_get_hl(0, { name = "NormalFloat" }).bg
    vim.api.nvim_set_hl(0, "CustomFloatBorder", { fg = fg_color, bg = bg_color, bold = false })
end
apply_highlights()

M.terminal_buf = nil
M.terminal_win = nil

function M.toggle_terminal()
    if M.terminal_win and vim.api.nvim_win_is_valid(M.terminal_win) then
        vim.api.nvim_win_close(M.terminal_win, true)
        M.terminal_win = nil
        return
    end

    if not M.terminal_buf or not vim.api.nvim_buf_is_valid(M.terminal_buf) then
        M.terminal_buf = vim.api.nvim_create_buf(false, true)
    end

    local win_opts = get_dimensions(0.8, 0.7)
    M.terminal_win = vim.api.nvim_open_win(M.terminal_buf, true, win_opts)
    apply_highlights()
    vim.wo[M.terminal_win].winhl = "FloatBorder:CustomFloatBorder"

    vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], {buffer = M.terminal_buf, desc = "Float-term normal mode"})
    vim.keymap.set('n', '<Esc>', function()
        if M.terminal_win and vim.api.nvim_win_is_valid(M.terminal_win) then
            vim.api.nvim_win_close(M.terminal_win, true)
            M.terminal_win = nil
        end
    end, {buffer = M.terminal_buf, desc = "Close floating terminal"})

    if vim.bo[M.terminal_buf].buftype ~= "terminal" then
        vim.fn.termopen(os.getenv("SHELL") or "fish")
        vim.cmd("startinsert")
    else
        vim.cmd("startinsert")
    end
end

function M.reset_terminal()
    if M.terminal_win and vim.api.nvim_win_is_valid(M.terminal_win) then
        vim.api.nvim_win_close(M.terminal_win, true)
        M.terminal_win = nil
    end

    if M.terminal_buf and vim.api.nvim_buf_is_valid(M.terminal_buf) then
        vim.api.nvim_buf_delete(M.terminal_buf, {force = true})
        M.terminal_buf = nil
    end
    M.toggle_terminal()
end
vim.keymap.set('n', '<leader>tt', M.toggle_terminal, {desc = "Toggle Floating Terminal"})
vim.keymap.set('n', '<leader>tr', M.reset_terminal, {desc = "Reset Floating Terminal"})

M.todo_win = nil
function M.open_project_todo()
    if M.todo_win and vim.api.nvim_win_is_valid(M.todo_win) then
        vim.api.nvim_win_close(M.todo_win, true)
        M.todo_win = nil
        return
    end

    local root_markers = {".git", "Makefile", "Cargo.toml", "package.json"}
    local project_root = vim.fs.dirname(vim.fs.find(root_markers, {upward = true})[1]) or vim.fn.getcwd()
    local todo_path = project_root .. "/todo.md"
    local win_opts = get_dimensions(0.3, 0.6)

    local todo_buf = vim.api.nvim_create_buf(false, false)
    vim.api.nvim_buf_set_name(todo_buf, todo_path)

    local lines = {}
    if vim.fn.filereadable(todo_path) == 1 then
        lines = vim.fn.readfile(todo_path)
    end
    table.insert(lines, 1, "#TODO -> " .. todo_path)

    for i = 2, #lines do
        if lines[i]:match("^%s*%[%]") then
            lines[i] = lines[i]:gsub("%[%]", "[ ]", 1)
        end
    end

    vim.api.nvim_buf_set_lines(todo_buf, 0, -1, false, lines)
    vim.api.nvim_set_hl(0, "TodoHeader", { fg = "#89b4fa", bold = true, underline = true })
    vim.api.nvim_set_hl(0, "TodoTask", { fg = "#a6e3a1", bold = true })
    vim.api.nvim_set_hl(0, "TodoNotes", { fg = "#a6adc8", italic = true })

    vim.bo[todo_buf].filetype = "markdown"
    vim.bo[todo_buf].modifiable = true

    M.todo_win = vim.api.nvim_open_win(todo_buf, true, win_opts)
    apply_highlights()
    vim.wo[M.todo_win].winhl = "FloatBorder:CustomFloatBorder"
    vim.wo[M.todo_win].number = true
    vim.wo[M.todo_win].relativenumber = true

    vim.api.nvim_buf_call(todo_buf, function()
        vim.cmd([[
            syntax clear
            syntax match TodoHeader /\%1l.*/ containedin=ALL
            syntax match TodoTask /^\s*\[[ xX-]\].*/ containedin=ALL
            syntax match TodoNotes /^\s*[^#%[ \t].*/ containedin=ALL
            highlight link TodoHeader TodoHeader
            highlight link TodoTask TodoTask
            highlight link TodoNotes TodoNotes
        ]])
    end)

    local close_todo_opts = {buffer = todo_buf, silent = true, desc = "Close TODO window"}
    vim.keymap.set({'n', 'i'}, '<Esc><Esc>', function()
        if M.todo_win and vim.api.nvim_win_is_valid(M.todo_win) then
            local buffer_lines = vim.api.nvim_buf_get_lines(todo_buf, 0, -1, false)
            if #buffer_lines > 0 then
                table.remove(buffer_lines, 1)
            end

            vim.fn.writefile(buffer_lines, todo_path)
            vim.api.nvim_win_close(M.todo_win, true)
            vim.api.nvim_buf_delete(todo_buf, {force = true})
            M.todo_win = nil
        end
    end, close_todo_opts)
end
vim.keymap.set('n', '<leader>td', M.open_project_todo, {desc = "Toggle Project Todo Buffer"})

return M
