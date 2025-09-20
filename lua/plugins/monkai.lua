return {
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("monokai-pro").setup({
        filter = "machine", -- available: classic | octagon | pro | machine | ristretto | spectrum
        transparent_background = false,
        terminal_colors = true,
        devicons = true, -- enable nvim-web-devicons
      })

    end,
  },
}
