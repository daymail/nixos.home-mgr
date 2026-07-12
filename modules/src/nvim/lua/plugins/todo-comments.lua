return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = false,
      keywords = {
        TODO = { icon = " ", color = "info" },
        FIXME = { icon = " ", color = "error" },
        REVIEW = { icon = " ", color = "hint" },
        NOTE = { icon = " ", color = "hint" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning" },
        PERF = { icon = " ", color = "warning" },
        MYNOTE = { icon = " ", color = "info" },
        QUESTION = { icon = " ", color = "warning" },
        SOME = { icon ="󰫢", color = "#FF5555"},
        XPLAN = { icon ="", color = "#C1E59F"},
      }
    }
  }
}
