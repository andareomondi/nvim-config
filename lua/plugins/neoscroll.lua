return {
  {
    "karb94/neoscroll.nvim",
    lazy = false,
    config = function()
      require("neoscroll").setup({
        -- Default options
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true,           -- Hide cursor while scrolling
        stop_eof = true,              -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false,    -- Stop scrolling when the cursor reaches the scrolloff margin
        cursor_scrolls_alone = true,  -- Cursor continues scrolling even if the window cannot scroll further
        easing_function = "quadratic", -- Easing function for smooth scrolling
      })
    end,
  },
}
