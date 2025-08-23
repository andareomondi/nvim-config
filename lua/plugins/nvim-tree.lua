
return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    filters = {
      git_ignored = false,
      dotfiles = false,
      exclude = { ".env" },
    },
  },
}
