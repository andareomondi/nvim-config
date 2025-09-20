require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Add Copilot tab acceptance mapping with fallback
map("i", "<Tab>", function()
  if vim.fn["copilot#GetDisplayedSuggestion"]().text ~= "" then
    return vim.fn["copilot#Accept"]("<CR>")
  else
    return "<Tab>"
  end
end, { expr = true, replace_keycodes = false })
