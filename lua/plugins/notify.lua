return {
  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      require("notify").setup({
        -- Customize your notification settings here
        stages = "fade_in_slide_out",
        timeout = 3000,
        background_colour = "#000000",
      })
      vim.notify = require("notify")
    end,
  },
}
