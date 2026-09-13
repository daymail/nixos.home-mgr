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
    },
    nhk_dark = {
        dark = {
            c0 = "#1E1F29", c1 = "#2A2B36", c2 = "#44444E", c3 = "#6B728E",
            c4 = "#BFC6C4", c5 = "#E8EDF2", c6 = "#FAF0E6", c7 = "#618764",
            c8 = "#81A6C6", c9 = "#9BCEC1", c10 = "#AACDDC", c11 = "#BB8493",
            c12 = "#FFDF82", c13 = "#5C5470", c14 = "#EAB2A0", c15 = "#E5B8F4",
        },
        light = {
            c0 = "#FAF0E6", c1 = "#EFE3CA", c2 = "#D8CDB5", c3 = "#7F8487",
            c4 = "#4F4557", c5 = "#35374B", c6 = "#040D12", c7 = "#285A48",
            c8 = "#433D8B", c9 = "#408A71", c10 = "#686D76", c11 = "#872341",
            c12 = "#AF3A03", c13 = "#4B4376", c14 = "#A0153E", c15 = "#AF0171",
        }
    },
    dim_express = {
        dark = {
            c0 = "#2F2F2F", c1 = "#242424", c2 = "#404040", c3 = "#555555",
            c4 = "#DCE0D9", c5 = "#BFC6C4", c6 = "#EAEFEF", c7 = "#8FAF9E",
            c8 = "#81A6C6", c9 = "#9BCEC1", c10 = "#B4E1EB", c11 = "#F49097",
            c12 = "#FFE761", c13 = "#F8AD9D", c14 = "#78C6A3", c15 = "#E0CEFD",
        },
        light = {
            c0 = "#F1F9F9", c1 = "#E1F2FB", c2 = "#D8EFD3", c3 = "#7E938F",
            c4 = "#677A77", c5 = "#384744", c6 = "#506B67", c7 = "#4E9B79",
            c8 = "#4A90A0", c9 = "#69A399", c10 = "#5B9CBE", c11 = "#EB6383",
            c12 = "#8A74C4", c13 = "#B376A5", c14 = "#3B9483", c15 = "#D47783",
        }
    },
    dim_cold = {
        dark = {
            c0 = "#222222", c1 = "#222222", c2 = "#3E3E3E", c3 = "#5C6366",
            c4 = "#D4DCDE", c5 = "#A2AEB3", c6 = "#EDF5F7", c7 = "#7BE3A7",
            c8 = "#6EB5FF", c9 = "#4FD3D8", c10 = "#8BE5FF", c11 = "#FF7B92",
            c12 = "#95D5B2", c13 = "#FF9F84", c14 = "#69D29F", c15 = "#C0B2FF",
        },
        light = {
            c0 = "#EBF1F5", c1 = "#DFE6ED", c2 = "#D2DCE5", c3 = "#7A8791",
            c4 = "#2A3033", c5 = "#40494E", c6 = "#14181A", c7 = "#2B7A4D",
            c8 = "#2F69A3", c9 = "#237A7C", c10 = "#156D85", c11 = "#B8374D",
            c12 = "#3B825B", c13 = "#B55338", c14 = "#22784E", c15 = "#5E4994",
        }
    },
    pastel_ice = {
        dark = {
            c0 = "#1c1c21", c1 = "#1A1A1A", c2 = "#3D3D3D", c3 = "#646464",
            c4 = "#8C9C9A", c5 = "#D0D9D7", c6 = "#C9D6D3", c7 = "#95D5B2",
            c8 = "#90E0F3", c9 = "#78C6A3", c10 = "#B4E1EB", c11 = "#CE96A6",
            c12 = "#DAFFEF", c13 = "#E0CEFD", c14 = "#89C8BD", c15 = "#F5CCD4",
        },
        light = {
            c0 = "#F4F6F6", c1 = "#E9ECEC", c2 = "#D5DCDA", c3 = "#A0A8A6",
            c4 = "#697573", c5 = "#3A4240", c6 = "#45524F", c7 = "#3B8863",
            c8 = "#2A7C94", c9 = "#2E7958", c10 = "#457E8A", c11 = "#A54F65",
            c12 = "#308264", c13 = "#7C5DB4", c14 = "#2C7B6D", c15 = "#B45466",
        }
    },
    pastel_dark = {
        dark = {
            c0 = "#181818", c1 = "#1A1A1A", c2 = "#3D3D3D", c3 = "#646464",
            c4 = "#8C9C9A", c5 = "#D0D9D7", c6 = "#98A6A3", c7 = "#95D5B2",
            c8 = "#90E0F3", c9 = "#78C6A3", c10 = "#B4E1EB", c11 = "#CE96A6",
            c12 = "#DAFFEF", c13 = "#E0CEFD", c14 = "#82B8A9", c15 = "#F5CCD4",
        },
        light = {
            c0 = "#E8F5E9", c1 = "#DCECDD", c2 = "#C9DEC9", c3 = "#8B9A8F",
            c4 = "#76867B", c5 = "#3E4A42", c6 = "#536358", c7 = "#408A64",
            c8 = "#468B9E", c9 = "#49967A", c10 = "#59859E", c11 = "#C4596F",
            c12 = "#7564A8", c13 = "#9E5E8A", c14 = "#328775", c15 = "#BD6A75",
        }
    },
}
M.active = M.palettes.nhk_dark.dark

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
        complete = function(CmdLine, CursorPos)
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

