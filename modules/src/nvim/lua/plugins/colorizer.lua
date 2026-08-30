return{
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {
    options = {
      parsers = {
        -- Disable text color names (e.g., 'red', 'green')
        names = false,
        
        -- Enable standard hex color codes (#RGB, #RRGGBB, #RRGGBBAA)
        hex = { default = true },
        
        -- Enable standard CSS functions (rgb(), rgba(), hsl(), hsla(), oklch())
        css_fn = true,
        
        -- Optional: Disable other advanced parsers to keep it bare
        tailwind = false,
        sass = false,
      },
      display = {
        -- Render as standard background color, removing the virtualtext square
        mode = "background", 
        
        -- Auto-adjust text color for readability against the background highlight
        background = {
          bright_fg = "#000000",
          dark_fg = "#ffffff",
        },
        
        -- Prevent duplicate highlights from Neovim 0.12+ built-in LSP
        disable_document_color = true,
      },
    },
  }
}
