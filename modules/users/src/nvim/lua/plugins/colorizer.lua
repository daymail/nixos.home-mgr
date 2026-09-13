return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {
    options = {
      parsers = {
        names = { enable = false },
        hex = { default = true },
        css_fn = true,
        tailwind = { enable = false },
        sass = { enable = false },
      },
      display = {
        mode = "background",
        background = {
          bright_fg = "#000000",
          dark_fg = "#ffffff",
        },
        disable_document_color = true,
      },
    },
  }
}
