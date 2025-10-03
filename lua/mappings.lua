require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- ============================================
-- GENERAL MAPPINGS (Your existing ones)
-- ============================================
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

-- ============================================
-- LSP MAPPINGS (Work for all LSPs)
-- ============================================
-- These are set in lspconfig.lua's on_attach, but adding global fallbacks here

map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Actions" })
map("v", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Actions (Visual)" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename" })
map("n", "gd", vim.lsp.buf.definition, { desc = "LSP Go to Definition" })
map("n", "gr", vim.lsp.buf.references, { desc = "LSP References" })
map("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })

-- ============================================
-- FLUTTER-SPECIFIC MAPPINGS
-- ============================================
-- Flutter Run & Control
map("n", "<leader>fr", "<cmd>FlutterRun<CR>", { desc = "Flutter Run" })
map("n", "<leader>fq", "<cmd>FlutterQuit<CR>", { desc = "Flutter Quit" })
map("n", "<leader>fR", "<cmd>FlutterReload<CR>", { desc = "Flutter Hot Reload" })
map("n", "<leader>frs", "<cmd>FlutterRestart<CR>", { desc = "Flutter Hot Restart" })
map("n", "<leader>fD", "<cmd>FlutterDevices<CR>", { desc = "Flutter Select Device" })
map("n", "<leader>fe", "<cmd>FlutterEmulators<CR>", { desc = "Flutter Emulators" })

-- Flutter UI & Tools
map("n", "<leader>fo", "<cmd>FlutterOutlineToggle<CR>", { desc = "Flutter Widget Outline" })
map("n", "<leader>fc", "<cmd>FlutterCopyProfilerUrl<CR>", { desc = "Flutter Copy Profiler URL" })
map("n", "<leader>fl", "<cmd>FlutterLspRestart<CR>", { desc = "Flutter LSP Restart" })
map("n", "<leader>fdt", "<cmd>FlutterDevTools<CR>", { desc = "Flutter DevTools" })
map("n", "<leader>fdta", "<cmd>FlutterDevToolsActivate<CR>", { desc = "Flutter DevTools Activate" })

-- Dart/Flutter Log
map("n", "<leader>flog", "<cmd>FlutterLogClear<CR>", { desc = "Flutter Clear Logs" })

-- ============================================
-- DART-SPECIFIC ENHANCEMENTS (Autocmd)
-- ============================================
-- These only activate when you open a Dart file
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dart",
  callback = function()
    local opts = { buffer = true, silent = true }
    
    -- Organize imports (removes unused, sorts)
    map("n", "<leader>oi", function()
      vim.lsp.buf.code_action({
        context = { only = { "source.organizeImports" } },
        apply = true,
      })
    end, vim.tbl_extend("force", opts, { desc = "Organize Imports" }))
    
    -- Fix all auto-fixable issues
    map("n", "<leader>fa", function()
      vim.lsp.buf.code_action({
        context = { only = { "source.fixAll" } },
        apply = true,
      })
    end, vim.tbl_extend("force", opts, { desc = "Fix All Issues" }))
    
    -- Quick save + hot reload (super efficient workflow)
    map("n", "<leader>w", function()
      vim.cmd("write")
      vim.cmd("FlutterReload")
    end, vim.tbl_extend("force", opts, { desc = "Save & Hot Reload" }))
    
    -- Format Dart code
    map("n", "<leader>fm", function()
      vim.lsp.buf.format({ async = true })
    end, vim.tbl_extend("force", opts, { desc = "Format Dart Code" }))
  end,
})

-- ============================================
-- OPTIONAL: WHICH-KEY INTEGRATION
-- ============================================
-- If you use Which-Key (NvChad has it), add Flutter group labels
local ok, wk = pcall(require, "which-key")
if ok then
  wk.add({
    { "<leader>f", group = "Flutter" },
    { "<leader>fd", group = "DevTools" },
  })
end
