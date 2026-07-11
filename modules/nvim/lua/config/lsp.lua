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
      checkOnSave = true;
      check = {
        command = "clippy",
      },
    },
  },
})

vim.lsp.config("lua_ls", { capabilities = capabilities })
vim.lsp.config("nixd", { capabilities = capabilities })

vim.lsp.enable("lua_ls")
vim.lsp.enable("nixd")
vim.lsp.enable("rust_analyzer")
