return {
  "github/copilot.vim",
  lazy = false, -- Load at startup
  config = function()
    -- Disable default tab mapping
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true
    vim.g.copilot_tab_fallback = ""
    
    -- Accept suggestion with Tab key
    vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept("<CR>")', {
      expr = true,
      silent = true,
      noremap = true,
    })
               
    -- Next suggestion
    vim.api.nvim_set_keymap("i", "<M-]>", 'copilot#Next()', {
      expr = true,
      silent = true,
      noremap = true,
    })
    
    -- Previous suggestion  
    vim.api.nvim_set_keymap("i", "<M-[>", 'copilot#Previous()', {
      expr = true,
      silent = true,
      noremap = true,
    })
    
    -- Dismiss suggestion
    vim.api.nvim_set_keymap("i", "<C-]>", 'copilot#Dismiss()', {
      expr = true,
      silent = true,
      noremap = true,
    })
  end
}
