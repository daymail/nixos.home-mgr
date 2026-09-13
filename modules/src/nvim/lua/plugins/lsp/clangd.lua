return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      clangd = {
        keys = {
          { "<leader>ch", "<cmd>LspClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
        },
        root_markers = {
          "compile_commands.json",
          "compile_flags.txt",
          "configure.ac",
          "Makefile",
          "configure.in",
          "config.h.in",
          "meson.build",
          "meson_options.txt",
          "build.ninja",
          ".git",
        },
        capabilities = {
          offsetEncoding = { "utf-16" },
        },
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
        },
        init_options = {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
        },
      },

      cmake = {
        cmd = { "cmake-language-server" },
        filetypes = { "cmake" },
        root_markers = {
          "CMakeLists.txt",
          "CMakeCache.txt"
        },
        init_options = {
          buildDirectory = "build",
        },
      },

      mesonlsp = {
        cmd = { "mesonlsp", "--lsp" },
        filetypes = { "meson" },
        root_markers = {
          "meson.build",
          "meson_options.txt"
        },
      },
    },
  },
  config = function(_, opts)
    -- Load lspconfig so it registers default configurations with Neovim
    require("lspconfig")

    for server, server_opts in pairs(opts.servers) do
      if vim.fn.has("nvim-0.11") == 1 then
        -- Neovim 0.11+ native LSP configuration (Silences the deprecation warning)
        vim.lsp.config(server, server_opts)
        vim.lsp.enable(server)
      else
        -- Fallback for Neovim 0.10 and older
        require("lspconfig")[server].setup(server_opts)
      end
    end
  end,
}
