local plugins = {
  -- ============================================
  -- FLUTTER TOOLS (Essential for refactoring)
  -- ============================================
  {
    "akinsho/flutter-tools.nvim",
    ft = "dart", -- Lazy load on Dart files
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- Better UI for code actions
    },
    opts = {
      ui = {
        border = "rounded",
        notification_style = "native",
      },
      decorations = {
        statusline = {
          app_version = true,
          device = true,
          project_config = true,
        }
      },
      widget_guides = {
        enabled = true,
      },
      closing_tags = {
        highlight = "Comment",
        prefix = "// ",
        enabled = true,
      },
      dev_log = {
        enabled = true,
        notify_errors = true,
        open_cmd = "tabedit",
      },
      lsp = {
        color = {
          enabled = true,
          background = false,
          virtual_text = true,
          virtual_text_str = "■",
        },
        -- Let our lspconfig.lua handle the LSP setup
        on_attach = nil, -- We handle this in lspconfig.lua
        capabilities = nil, -- We handle this in lspconfig.lua
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          renameFilesWithClasses = "prompt",
          enableSnippets = true,
          updateImportsOnRename = true,
        },
      },
    },
  },

  -- ============================================
  -- BETTER UI FOR CODE ACTIONS
  -- ============================================
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      input = {
        enabled = true,
        default_prompt = "➤ ",
        win_options = {
          winblend = 0,
        },
      },
      select = {
        enabled = true,
        backend = { "telescope", "builtin" },
        builtin = {
          win_options = {
            winblend = 0,
          },
        },
      },
    },
  },

  -- ============================================
  -- SNIPPETS (stless, stful, etc.)
  -- ============================================
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      
      -- Custom Flutter snippets (optional)
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node
      
      ls.add_snippets("dart", {
        s("stless", {
          t({"class "}), i(1, "WidgetName"), t({" extends StatelessWidget {", 
            "  const "}), i(2), t({"({super.key});", "", 
            "  @override", 
            "  Widget build(BuildContext context) {",
            "    return "}), i(0, "Container()"), t({";",
            "  }",
            "}"}),
        }),
      })
    end,
  },
}

return plugins
