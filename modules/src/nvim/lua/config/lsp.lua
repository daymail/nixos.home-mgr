local has_blink, blink = pcall(require, "blink.cmp")
local capabilities = has_blink and blink.get_lsp_capabilities() or {}

vim.lsp.config("rust_analyzer",{
  capabilities = capabilities,
  cmd = {"rust-analyzer"},
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
        loadOutDirsFromCheck = true,
        runBuildScripts = true,
      },
      procMacro = {
        enable = true,
      },
      checkOnSave = true,
      check = {
        command = "clippy",
      },
    },
  },
})

vim.lsp.config("lua_ls",{capabilities = capabilities})
vim.lsp.config("nixd",{capabilities = capabilities})

vim.lsp.config("clangd",{
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--compile-commands-dir=build",
    "--query-driver=gcc",
  },
  filetypes = {"c", "cpp", "objc", "objcpp"}
})

vim.lsp.config("mesonlsp",{
  capabilities = capabilities,
  cmd = { "mesonlsp", "--lsp" }
})

vim.lsp.config("cmake",{
  capabilities = capabilities,
  cmd = { "cmake-language-server" }
})

vim.lsp.config("qmlls",{
  capabilities = capabilities,
  cmd = {
    "qmlls",
    "--build-dir",
    "build"
  }
})

vim.lsp.config("pyright", {
  capabilities = capabilities,
  cmd = { "pyright-langserver", "--stdio" },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      },
    },
  },
})

vim.lsp.config("ts_ls", {
  capabilities = capabilities,
  cmd = { "typescript-language-server", "--stdio" },
})

vim.lsp.enable("rust_analyzer")
vim.lsp.enable("lua_ls")
vim.lsp.enable("nixd")
vim.lsp.enable("clangd")
vim.lsp.enable("mesonlsp")
vim.lsp.enable("cmake")
vim.lsp.enable("qmlls")
vim.lsp.enable("pyright")
vim.lsp.enable("ts_ls")

-- LSP KEYMAPS
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {desc = "  LSP: Go to [d]efinition"})
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {desc = "  LSP: Go to [D]eclaration"})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {desc = "  LSP: Go to [I]mplementation"})
vim.keymap.set('n', 'gr', vim.lsp.buf.references, {desc = "  LSP: Go to [r]eferences"})
vim.keymap.set('n', '<C-t>', '<C-o>', { desc = "  Jump back in tag stack (where you were before)" })
