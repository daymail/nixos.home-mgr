local comments_theme = {
  error   = "#FF8A8A",
  warning = "#FFEDB9",
  info    = "#BCCEF8",
  hint    = "#F7C8E0",
  success = "#BFF6C3",
  idea    = "#CDC1FF",
  debug   = "#FFD6A6",
  wip     = "#C0E1D2",   -- Work In Progress
  ref     = "#F9B2D7",   -- references
}

return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = false,
      colors = {
        error   = { comments_theme.error },
        warning = { comments_theme.warning },
        info    = { comments_theme.info },
        hint    = { comments_theme.hint },
        success = { comments_theme.success },
        idea    = { comments_theme.idea },
        debug   = { comments_theme.debug },
        wip     = { comments_theme.wip },
        ref     = {comments_theme.ref},
      },

      keywords = {
        TODO     = { icon = " ", color = "info" },
        MYNOTE   = { icon = " ", color = "info" },
        INFO     = { icon = "󰋽 ", color = "info" },

        FIXME    = { icon = " ", color = "error" },
        BUG      = { icon = " ", color = "error" },
        ISSUE    = { icon = " ", color = "error" },

        WARN     = { icon = " ", color = "warning" },
        WARNING  = { icon = " ", color = "warning" },
        HACK     = { icon = " ", color = "warning" },
        QUESTION = { icon = " ", color = "warning" },
        PERF     = { icon = " ", color = "warning" },

        NOTE     = { icon = "󰎜 ", color = "hint" },
        REVIEW   = { icon = "󰆉 ", color = "hint" },

        DONE     = { icon = "󰄬 ", color = "success" },
        FIXED    = { icon = "󰱒 ", color = "success" },

        IDEA     = { icon = " ", color = "idea" },
        THOUGHT  = { icon = "󰐰 ", color = "idea" },
        PLAN     = { icon = "󰂺 ", color = "idea" },

        DEBUG    = { icon = "󰃤 ", color = "debug" },
        TRACE    = { icon = "✎ ", color = "debug" },

        WIP      = { icon = "󰧑 ", color = "wip" },
        DRAFT    = { icon = "󰗖 ", color = "wip" },
        SOME     = { icon = "󰫢 ", color = "wip" },

        REF      = { icon = " ", color = "ref" },
        SOURCE   = { icon = " ", color = "ref" },
        GOTO     = { icon = " ", color = "ref" },
        LINK     = { icon = " ", color = "ref" },
        SEE      = { icon = " ", color = "ref" },
      }
    }
  }
}
