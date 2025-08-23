return {
  -- Default format-on-save
  format_on_save = {
    timeout_ms = 500,  -- Save delay
    lsp_fallback = true,  -- Fallback to LSP if no formatter
  },
  -- Formatter configurations
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black", "isort" },
    javascript = { { "prettierd", "prettier" } },
    dart = { "dart_format" },
    -- htmldjango = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
  },
  -- Custom formatters (optional)
  formatters = {
    dart_format = {
      command = "dart",
      args = { "format" },
      stdin = true,
    },
  },
}
