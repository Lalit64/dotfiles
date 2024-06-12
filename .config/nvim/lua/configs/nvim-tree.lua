require("nvim-tree").setup({
  disable_netrw = true,
  hijack_netrw = true,
  view = {
    adaptive_size = true,
    side = "left",
    width = 36,
    preserve_window_proportions = true,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
})
