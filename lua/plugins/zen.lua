return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require("zen-mode").setup({})
    end,
  },
  {
    "folke/twilight.nvim",
    cmd = "Twilight",
    config = function()
      require("twilight").setup({})
    end,
  },
  {
    "echasnovski/mini.surround",
    version = "*",
    config = function()
      require("mini.surround").setup()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}

