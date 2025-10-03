return {
  "akinsho/flutter-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
  },
  config = function()
    require("flutter-tools").setup({
      ui = {
        border = "rounded",
      },
      decorations = {
        statusline = {
          app_version = true,
          device = true,
        },
      },
      debugger = {
        enabled = true,
        run_via_dap = true, -- use dap instead of nvim-dap-ui
        exception_breakpoints = { "all" },
        register_configurations = function(_)
          require("dap").configurations.dart = {
            {
              type = "dart",
              request = "launch",
              name = "Launch Flutter Program",
              dartSdkPath = "/path/to/dart-sdk", -- Adjust this path
              flutterSdkPath = "/path/to/flutter-sdk", -- Adjust this path
              program = "${workspaceFolder}/lib/main.dart",
              cwd = "${workspaceFolder}",
            },
          }
        end,
      },
      fvm = true, -- Use FVM if available
    })
  end,
}
