return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons' -- Most compatible option
  },
  ft = { 'markdown' }, -- Only load for markdown files
  config = function()
    require('render-markdown').setup({
      -- Enable the plugin
      enabled = true,
      -- Maximum file size to render (in MB)
      max_file_size = 10.0,
      -- Debounce rendering after text changes (ms)
      debounce = 100,
      -- Preset configurations
      preset = 'lazy', -- or 'obsidian'
      -- Render modes
      render_modes = { 'n', 'c', 't' },
      -- Anti-conceal settings
      anti_conceal = {
        -- Enabled anti-conceal
        enabled = true,
        -- Above and below cursor
        above = 1,
        below = 1,
      },
      -- Heading settings
      heading = {
        -- Turn on / off heading icon & background rendering
        enabled = true,
        -- Turn on / off any sign column related rendering
        sign = true,
        -- Determines how icons fill the available space
        position = 'overlay',
        -- Replaces '#+' of atx headings
        icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
        -- Added to the sign column if enabled
        signs = { '󰫎 ' },
      },
      -- Code block settings
      code = {
        -- Turn on / off code block & inline code rendering
        enabled = true,
        -- Turn on / off any sign column related rendering
        sign = true,
        -- Determines how the top / bottom of code block are rendered
        style = 'full',
        -- Determines where language icon is rendered
        position = 'left',
        -- Amount of padding to add to the left of code blocks
        left_pad = 0,
        -- Amount of padding to add to the right of code blocks
        right_pad = 0,
        -- Width of the code block background
        width = 'full',
        -- Minimum width to use for code blocks
        min_width = 45,
      },
      -- Dash settings
      dash = {
        -- Turn on / off thematic break rendering
        enabled = true,
        -- Replaces '---'
        icon = '─',
        -- Width of the generated line
        width = 'full',
      },
      -- Bullet point settings
      bullet = {
        -- Turn on / off list bullet rendering
        enabled = true,
        -- Replaces '-'|'+'|'*' of unordered list bullets
        icons = { '●', '○', '◆', '◇' },
        -- Replaces '1.' of ordered list bullets
        ordered_icons = {},
        -- Padding to add to the left of bullet point
        left_pad = 0,
        -- Padding to add to the right of bullet point
        right_pad = 0,
      },
      -- Checkbox settings
      checkbox = {
        -- Turn on / off checkbox rendering
        enabled = true,
        -- Determines how icons fill the available space
        position = 'inline',
        unchecked = {
          -- Replaces '[ ]' of unchecked checkboxes
          icon = '󰄱 ',
          -- Highlight for the unchecked icon
          highlight = 'RenderMarkdownUnchecked',
        },
        checked = {
          -- Replaces '[x]' of checked checkboxes
          icon = '󰱒 ',
          -- Highlight for the checked icon
          highlight = 'RenderMarkdownChecked',
        },
      },
      -- Quote settings
      quote = {
        -- Turn on / off block quote & callout rendering
        enabled = true,
        -- Replaces '>' of block quotes
        icon = '▋',
        -- Highlight for the quote icon
        highlight = 'RenderMarkdownQuote',
      },
      -- Pipe table settings
      pipe_table = {
        -- Turn on / off pipe table rendering
        enabled = true,
        -- Determines how the table as a whole is rendered
        style = 'full',
        -- Determines how individual cells are rendered
        cell = 'trimmed',
        -- Characters used to replace table border
        border = {
          '┌', '┬', '┐',
          '├', '┼', '┤',
          '└', '┴', '┘',
          '│', '─',
        },
        -- Highlight for table heading, delimiter, and the line above
        head = 'RenderMarkdownTableHead',
        -- Highlight for everything else, main table rows
        row = 'RenderMarkdownTableRow',
        -- Highlight for table filler
        filler = 'RenderMarkdownTableFill',
      },
      -- Callout settings
      callout = {
        note = { raw = '[!NOTE]', rendered = '󰋽 Note', highlight = 'RenderMarkdownInfo' },
        tip = { raw = '[!TIP]', rendered = '󰌶 Tip', highlight = 'RenderMarkdownSuccess' },
        important = { raw = '[!IMPORTANT]', rendered = '󰅾 Important', highlight = 'RenderMarkdownHint' },
        warning = { raw = '[!WARNING]', rendered = '󰀪 Warning', highlight = 'RenderMarkdownWarn' },
        caution = { raw = '[!CAUTION]', rendered = '󰳦 Caution', highlight = 'RenderMarkdownError' },
      },
      -- Link settings
      link = {
        -- Turn on / off inline link icon rendering
        enabled = true,
        -- Inlined with 'image' elements
        image = '󰥶 ',
        -- Inlined with 'email_autolink' elements
        email = '󰀓 ',
        -- Inlined with 'inline_link' elements
        hyperlink = '󰌹 ',
        -- Applies to anything that does not have a more specific icon
        wiki = { icon = '󰌹 ', highlight = 'RenderMarkdownWikiLink' },
      },
      -- Window options for floating preview
      win_options = {
        -- See :h 'conceallevel'
        conceallevel = {
          -- Used when not being rendered, get user setting
          default = vim.api.nvim_get_option_value('conceallevel', {}),
          -- Used when being rendered, concealed text is completely hidden
          rendered = 3,
        },
        -- See :h 'concealcursor'
        concealcursor = {
          -- Used when not being rendered, get user setting
          default = vim.api.nvim_get_option_value('concealcursor', {}),
          -- Used when being rendered, conceal text in all modes
          rendered = '',
        },
      },
    })
  end,
}
