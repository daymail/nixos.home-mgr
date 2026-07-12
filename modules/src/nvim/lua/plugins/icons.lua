return{
  'nvim-tree/nvim-web-devicons',
  config = function()
    require('nvim-web-devicons').setup({
        override = {
          xl = {
            icon = "󱎧",
            color = "#FF3737",
            cterm_color = "45",
            name = "XLConfig",
          }
        },
        default = true,
      })
  end,
}
