return {
  {
      "anthony-halim/bible-verse.nvim",
      -- Lazy load on plugin commands
      cmd = { "BibleVerse", "BibleVerseQuery", "BibleVerseInsert" },
      dependencies = {
          "MunifTanjim/nui.nvim",
      },
      opts = {
          diatheke = {
              -- (MANDATORY)
              -- Corresponds to the diatheke module; diatheke's -b flag.
              -- In this example, we are using KJV module.
              translation = "KJV",
          },
      },
      -- plugin is not set up by default
      config = true,
  },
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css"
  		},
  	},
  },
  -- ======================
  -- 2. WEB DEV ESSENTIALS
  -- ======================
  { "vuki656/package-info.nvim" }, -- npm/yarn deps
  { "styled-components/vim-styled-components" }, -- CSS-in-JS
  { "windwp/nvim-ts-autotag" }, -- Auto-close JSX tags
  { "pmizio/typescript-tools.nvim" }, -- Better TS than tsserver

  -- ======================
  -- 3. FLUTTER DEV ESSENTIALS
  -- ======================
  { "akinsho/flutter-tools.nvim" }, -- Flutter SDK integration
  { "dart-lang/dart-vim-plugin" }, -- Dart syntax
  { "Neevash/awesome-flutter-snippets" }, -- Widget snippets

  { "iamcco/markdown-preview.nvim", ft = "markdown" }, -- MD preview
  { "prisma/vim-prisma" }, -- Prisma ORM
}

