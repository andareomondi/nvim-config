-- Load NvChad defaults (MUST keep this!)
require("nvchad.configs.lspconfig").defaults()

-- Add your custom LSPs + extras
local on_attach = function(client, bufnr)
  -- Keybinds (optional but recommended)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Your LSPs (html/css + extras)
local servers = { "html", "cssls", "ts_ls", "pyright", "eslint", "tailwindcss", } -- Add more as needed

-- Configure each LSP
for _, lsp in ipairs(servers) do
  require("lspconfig")[lsp].setup({
    on_attach = on_attach,  -- Optional: Only if you want keybinds
    capabilities = capabilities,
  })
end
