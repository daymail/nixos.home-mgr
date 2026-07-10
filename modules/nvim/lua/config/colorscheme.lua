local M = {}

M.palettes = {
    my_gruv = {
        dark = {
            c0 = "#212120", c1 = "#252524", c2 = "#3C3836", c3 = "#665C54",
            c4 = "#A89984", c5 = "#D5C4A1", c6 = "#FAF2D2", c7 = "#A9B665",
            c8 = "#7DAEA3", c9 = "#89B482", c10 = "#83A598", c11 = "#D78787",
            c12 = "#D8A657", c13 = "#E78A4E", c14 = "#A9B665", c15 = "#D3869B",
        },
        light = {
            c0 = "#FAF2D2", c1 = "#F4ECD0", c2 = "#E5DBBA", c3 = "#928374",
            c4 = "#665C54", c5 = "#504945", c6 = "#282828", c7 = "#79740E",
            c8 = "#076678", c9 = "#427B58", c10 = "#076678", c11 = "#9D0006",
            c12 = "#B57614", c13 = "#AF3A03", c14 = "#79740E", c15 = "#8F3F71",
        }
    },
    my_dark = {
        dark = {
            c0 = "#1a1b26", c1 = "#1f2335", c2 = "#24283b", c3 = "#414868",
            c4 = "#787c99", c5 = "#a9b1d6", c6 = "#c0caf5", c7 = "#9ece6a",
            c8 = "#7aa2f7", c9 = "#73daca", c10 = "#2ac3de", c11 = "#f7768e",
            c12 = "#e0af68", c13 = "#ff9e64", c14 = "#9ece6a", c15 = "#bb9af7",
        },
        light = {
            c0 = "#f2f3f7", c1 = "#e1e2e7", c2 = "#d5d6db", c3 = "#9699a3",
            c4 = "#565a6e", c5 = "#383a47", c6 = "#1f2335", c7 = "#485e30",
            c8 = "#34548a", c9 = "#166e61", c10 = "#0f4b6e", c11 = "#8c4351",
            c12 = "#8f5e15", c13 = "#964c1e", c14 = "#485e30", c15 = "#5a3f8c",
        }
    }
}

M.active = M.palettes.my_gruv.dark

function M.set_theme(name, variant)
    variant = variant or "dark"
    local theme_group = M.palettes[name]
    if not theme_group then
        vim.notify("Theme grouping '" .. tostring(name) .. "' not found!", vim.log.levels.WARN)
        return
    end

    local target_palette = theme_group[variant]
    if not target_palette then
        vim.notify("Variant '" .. tostring(variant) .. "' not found for theme " .. name, vim.log.levels.WARN)
        return
    end

    vim.opt.background = variant
    M.active = target_palette
    require('config.highlight').apply(target_palette)
    vim.api.nvim_exec_autocmds("User", { pattern = "ThemeChanged" })
end

function M.setup()
    vim.api.nvim_create_user_command("MyTheme", function(opts)
        local args = vim.split(opts.args, "%s+")
        M.set_theme(args[1], args[2])
    end, {
        nargs = "+",
        complete = function(ArgLead, CmdLine, CursorPos)
            local args = vim.split(CmdLine:sub(1, CursorPos), "%s+")
            if #args <= 2 then
                return vim.tbl_keys(M.palettes)
            elseif #args == 3 then
                return { "dark", "light" }
            end
        end
    })
end

return M
