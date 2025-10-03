-- Load NvChad defaults (MUST keep this!)
require("nvchad.configs.lspconfig").defaults()

-- ============================================
-- KEYBINDS & CAPABILITIES SETUP
-- ============================================
local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, silent = true }
  
  -- Navigation
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  
  -- Information
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
  
  -- Code Actions (THE IMPORTANT ONES for Flutter)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  
  -- Diagnostics
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- ============================================
-- LSP SERVERS CONFIG (New API)
-- ============================================

-- HTML
vim.lsp.config.html = {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  root_markers = { ".git" },
}

-- CSS
vim.lsp.config.cssls = {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  root_markers = { ".git" },
}

-- TypeScript/JavaScript
vim.lsp.config.ts_ls = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "package.json", "tsconfig.json", ".git" },
}

-- Python
vim.lsp.config.pyright = {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", ".git" },
}

-- ============================================
-- DART/FLUTTER LSP (THE STAR OF THE SHOW)
-- ============================================
vim.lsp.config.dartls = {
  cmd = { "dart", "language-server", "--protocol=lsp" },
  filetypes = { "dart" },
  root_markers = { "pubspec.yaml", ".git" },
  init_options = {
    closingLabels = true,
    flutterOutline = true,
    onlyAnalyzeProjectsWithOpenFiles = false,
    outline = true,
    suggestFromUnimportedLibraries = true,
  },
  settings = {
    dart = {
      analysisExcludedFolders = {
        vim.fn.expand("$HOME/.pub-cache"),
        vim.fn.expand("$HOME/flutter"),
      },
      updateImportsOnRename = true,
      completeFunctionCalls = true,
      showTodos = true,
      enableSnippets = true,
      enableSdkFormatter = true,
    },
  },
}

-- ============================================
-- ENABLE ALL LSPs
-- ============================================
local servers = { "html", "cssls", "ts_ls", "pyright", "dartls" }

for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end

-- ============================================
-- DART-SPECIFIC ENHANCEMENTS
-- ============================================
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dart",
  callback = function()
    -- Additional Dart-specific keymaps
    local opts = { buffer = true, silent = true }
    
    -- Organize imports (super useful!)
    vim.keymap.set("n", "<leader>oi", function()
      vim.lsp.buf.code_action({
        context = { only = { "source.organizeImports" } },
        apply = true,
      })
    end, opts)
    
    -- Fix all fixable issues
    vim.keymap.set("n", "<leader>fa", function()
      vim.lsp.buf.code_action({
        context = { only = { "source.fixAll" } },
        apply = true,
      })
    end, opts)
  end,
})
