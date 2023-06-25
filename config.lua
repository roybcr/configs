-- LUNARVIM CONFIGURATION ------------------------------------------------------------
-- @author: Roy Bachar
-- @repo: https://github.com/roybcr/configs
--

-- NVIMTREE CONFIGURATION ------------------------------------------------------------
--
-- Disable netrw, as suggested by the nvimtree docs
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- Don't open Markdown preview on entring buffer
vim.g.mkdp_auto_start = 0
-- Don't close Markdown preview on exiting buffer
vim.g.mkdp_auto_close = 0
-- use random port number
vim.g.mkdp_port = ''

-- Hebrew support
vim.cmd('set encoding=utf-8')
vim.cmd('set rightleftcmd=bidi')
--------------------------------------------------------------------------------------

-- LUNARVIM OPTS ---------------------------------------------------------------------
lvim.wrap_lines = false
lvim.auto_close_tree = 0
lvim.auto_complete = true
lvim.format_on_save = true
--------------------------------------------------------------------------------------

-- VIM OPTS --------------------------------------------------------------------------
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
--------------------------------------------------------------------------------------

-- EXPERIMENTAL ----------------------------------------------------------------------
-- SEE: https://sharksforarms.dev/posts/neovim-rust

-- Set completeopt to have a better completion experience (:help completeopt)
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.

vim.o.completeopt = "menuone,noinsert,noselect"

-- Avoid showing extra messages when using completion
vim.opt.shortmess = vim.opt.shortmess + "c"
--------------------------------------------------------------------------------------

-- CUSTOM KEYBINDINGS ----------------------------------------------------------------
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<A-up>"] = ":move -2<CR>"   -- Move line up on Alt + Up
lvim.keys.visual_mode["<A-up>"] = ":move -2<CR>"   -- Move line up on Alt + Up
lvim.keys.visual_mode["<A-down>"] = ":move +1<CR>" -- Move line down on Alt + Down
lvim.keys.normal_mode["<A-down>"] = ":move +1<CR>" -- Move line down on Alt + Down
lvim.keys.normal_mode["<S-x>"] = ":BufferKill<CR>" -- Kill current buffer on Shift + X
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<A-p>"] = ":BufferLineTogglePin<CR>" -- Pin current buffer on Alt + P
lvim.keys.normal_mode["<C-i"] = ":2ToggleTerm direction=horizontal<CR>"
----------------------------------------------------------------------------------------

-- BUILTINS --------------------------------------------------------------------------
lvim.builtin.terminal.shell = "/usr/bin/zsh"
lvim.builtin.max_memory = "10G"
-- ColorScheme:
-- nightfox | lightfox | dawnfox | duskfox | carbonfox
-- lvim.colorscheme = "material"
vim.o.background = "dark"
--
-- To set Tokyonight simply uncomment the line below
lvim.colorscheme = "kanagawa-wave"
-- lvim.colorscheme = "miramare"
-- lvim.colorscheme = "tokyonight-night"
-- lvim.builtin.theme.tokyonight.options.style = "night"
vim.g.tokyonight_italic_keywords = false
vim.g.tokyonight_italic_functions = false
-- lvim.builtin.theme.options.style = "OceanicNext"

-- to disable icons and use a minimalist setup, uncomment the following
lvim.use_icons = true
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- After changing plugin config exit and reopen LunarVim,
-- Run :PackerInstall :PackerCompile
--------------------------------------------------------------------------------------

-- NVIMTREE --------------------------------------------------------------------------
lvim.builtin.alpha.active = true
lvim.builtin.terminal.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.nvimtree.setup.view.width = 40
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.indent_markers.enable = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.renderer.icons.show.folder = false
lvim.builtin.nvimtree.setup.git.ignore = false
lvim.builtin.nvimtree.setup.filters.dotfiles = false
lvim.builtin.nvimtree.setup.git.icons = {
  unstaged = "✗",
  staged = "✓",
  unmerged = "",
  renamed = "➜",
  untracked = "★",
  deleted = "",
  ignored = "◌"
}



-- lvim.builtin.nvimtree.setup.system_open = {
--   cmd = nil,
--   args = {}
-- }
--------------------------------------------------------------------------------------

-- TOGGLE TERM -----------------------------------------------------------------------
lvim.builtin.terminal.direction = "float"
--------------------------------------------------------------------------------------

-- LUALINE ---------------------------------------------------------------------------
--
-- Available Options:
---------------------
-- | everblush | ayu         | ayu_light      |
-- | ayu_dark  | everforest  | iceberg_light  |
-- | base16    | ayu_mirage  | material       |
-- | nightfly  | OceanicNext | nord           |
-- | onedark   | powerline   | solarized_dark |
-- |Tomorrow   | seoul256    |

-- Melange Best Matches: gruvbox-material | gruvbox-light | gruvbox_dark

lvim.builtin.lualine.options.theme = "gruvbox_light"
lvim.builtin.lualine.options.section_separators = { left = '', right = '' }
lvim.builtin.lualine.options.component_separators = { left = '', right = '' }
lvim.builtin.lualine.options.disabled_filetypes = { statusline = {}, winbar = {} }
lvim.builtin.lualine.options.refresh = { statusline = 1000, tabline = 1000, winbar = 1000 }
lvim.builtin.lualine.sections = {
  lualine_a = { "mode" },
  lualine_b = { 'branch', 'diff', 'diagnostics' },
  lualine_c = { 'filename' },
  lualine_x = { 'fileformat', 'filetype' },
  lualine_y = { 'progress' },
  lualine_z = { 'location' }
}
--------------------------------------------------------------------------------------

-- LUASNIP ---------------------------------------------------------------------------

-- Load snippets from my-snippets folder
require("luasnip.loaders.from_vscode").load({ paths = { "./config/my-snippets/" } })

--------------------------------------------------------------------------------------

-- WHICH_KEY -------------------------------------------------------------------------
lvim.builtin.which_key.setup.window.border = "none"

-- Custom Mappings:

-- Space + 'C' = Reload LunarVim
lvim.builtin.which_key.mappings["C"] = { "<cmd>LvimCacheReset<CR>", "Reset Cache" }

-- Space + Q = Quick Actions Panel (Buffer actions)
-- Space + Q + C = Clean Buffer
-- Space + Q + H = Highlight Buffer
-- Space + Q + Y = Yank Buffer Content

lvim.builtin.which_key.mappings.Q = {
  name = "Quick Actions",
  c = { "<cmd>tabdo normal! ggVG$xi<CR>", "Clean Buffer" },
  h = { "<cmd>tabdo normal! ggVG$<CR>", "Highlight Buffer" },
  y = { "<cmd>tabdo normal! ggVG$y<CR>", "Yank Buffer Content" },
  r = { "<cmd>CellularAutomaton make_it_rain<CR>", "Make it Rain" },
}


lvim.builtin.which_key.mappings.t = {
  name = "Todos",
  t = { '<cmd>exec "normal i // TODO: "<CR>', " TODO" },
  h = { '<cmd>exec "normal i // HACK: "<CR>', " HACK" },
  w = { '<cmd>exec "normal i // WARN: "<CR>', " WARN" },
  p = { '<cmd>exec "normal i // PERF: "<CR>', " PERF" },
  n = { '<cmd>exec "normal i // NOTE: "<CR>', "🗲 NOTE" },
  m = { '<cmd>exec "normal i // MARK: "<CR>', " MARK" },
  i = { '<cmd>exec "normal i // HIGHLIGHT: "<CR>', " HIGHLIGHT" },
}

-- Space + R = Rust Tools Panel
-- Space + R + F = Add rustfmt.toml Into Project (Requires a rustfmt.toml file in $HOME/Templates/)

-- lvim.builtin.which_key.mappings.R = {
--   name = "Rust Tools",
--   F = {
--     "<cmd>lua require('my_utils').copy_file('~/Templates/rustfmt.toml', './rustfmt.toml')<CR>",
--     "Add rustfmt.toml"
--   },
-- }
--------------------------------------------------------------------------------------

-- TREESITTER ------------------------------------------------------------------------
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "lua",
  "python",
  "rust",
  "toml",
  "tsx",
  "typescript",
}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.highlight.additional_vim_regex_highlighting = false
lvim.builtin.treesitter.highlight.custom_captures = {
  -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
  -- ["foo.bar"] = "Identifier",
  enable = true,
}
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.indent.enable = true
lvim.builtin.treesitter.textsubjects.enable = true
lvim.builtin.treesitter.textsubjects.keymaps = {
  ['.'] = 'textsubjects-smart',
  [';'] = 'textsubjects-container-outer',
}
-- Enable Auto Treesitter Folding
-- vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
--------------------------------------------------------------------------------------

-- FORMATTERS ------------------------------------------------------------------------
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    extra_args = {
      "--print-width", "80",
      -- "--tab-width", "4",
      "--semi", "true",
      "--single-quotes", "true",
      "--trailing-comma", "all"
    },
    filetypes = { "tsx", "jsx", "typescript", "typescriptreact", "javascript", "javascriptreact" }
  }
}
--------------------------------------------------------------------------------------

-- MARKDOWN PREVIEW ------------------------------------------------------------------
--
--------------------------------------------------------------------------------------

-- PLUGINS ---------------------------------------------------------------------------
--
-- Rust Tools:

-- local rust_tools = require("rust-tools")

-- on attach

-- local function on_attach(_, bufnr)
--   -- This callback is called when the LSP is atttached/enabled for this buffer
--   -- we could set keymaps related to LSP, etc here.
--   vim.keymap.set("n", "<C-space>", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
--   vim.keymap.set({ 'n', 'v' }, "<C-a>", rt.code_action_group.code_action_group, { buffer = bufnr })
--   -- your custom on attach
-- end


-- TEMPORARY DISABLED ---------------------------------------------------------------
--
-- Disabled on: 17.03.23 ------------------------------------------------------------
--
--  { "navarasu/onedark.nvim" },
--  { "EdenEast/nightfox.nvim" },
--  { "shaunsingh/moonlight.nvim" },
--  { "marko-cerovac/material.nvim" },
--  { "NLKNguyen/papercolor-theme" },
--  { "jacoborus/tender.vim" },
--  { "eandrju/cellular-automaton.nvim" },
--  { "junegunn/goyo.vim" },
--  { "junegunn/limelight.vim" },
--  { "glepnir/zephyr-nvim", requires = { 'nvim-treesitter/nvim-treesitter', opt = true } },
--
--
--
-- Disabled on: 00.00.23 ------------------------------------------------------------
-- ...
-- ----------------------------------------------------------------------------------

-- ACTIVE ---------------------------------------------------------------------------

lvim.plugins = {

  { "savq/melange" },          -- colortheme
  { "rebelot/kanagawa.nvim" }, -- colortheme
  { "NvChad/nvim-colorizer.lua" },
  { "lunarvim/colorschemes" },
  { "franbach/miramare" },    -- colortheme
  { "archseer/colibri.vim" }, -- colortheme
  {
    "francoiscabrol/ranger.vim",
    requires = { "rbgrouleff/bclose.vim" }
  },
  { "glepnir/zephyr-nvim", requires = { 'nvim-treesitter/nvim-treesitter', opt = true } }, -- colortheme
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle"
  },
  {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    'Equilibris/nx.nvim',
    requires = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require("nx").setup {}
    end
  },
  {
    -- surround text blocks with whatever
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    -- multi-cursor support
    "mg979/vim-visual-multi",
    branch = "master"
  },
  {
    -- live REPLs for most languages
    "metakirby5/codi.vim",
    cmd = "Codi",
  },
  {
    -- ChatGPT
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup()
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        signs = true,
        keywords = {
          FIX = {
            icon = " ",
            color = "error",
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
          },
          TODO = { icon = " ", color = "cyan" },
          HACK = { icon = " ", color = "purple" },
          WARN = { icon = " ", color = "#f7b9c1", alt = { "WARNING", "XXX" } },
          PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" }, color = "success" },
          NOTE = { icon = "🗲 ", color = "note", alt = { "INFO" } },
          MARK = { icon = " ", color = "#c82b44", alt = { "BOOKMARK" } },
          HIGHLIGHT = { icon = " ", color = "highlight", alt = { "HI", "SECTION", "LINE" } }
        },
        colors = {
          error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#be1d36" },
          warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#f7b9c1" },
          info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
          hint = { "LspDiagnosticsDefaultHint", "#10B981" },
          default = { "Identifier", "#7C3AED" },
          note = { "LspDiagnosticsDefaultNote", "#ff9754" },
          success = { "LspDiagnosticsDefaultInformation", "#9CCC65" },
          highlight = { "LspDiagnosticsDefaultInformation", "#EBBA00" },
          mark = { "LspDiagnosticsDefaultInformation", "#cc0033" },
          purple = { "LspDiagnosticsDefaultPurple", "#7c5295" },
          cyan = { "LspDiagnosticsDefaultCyan", "#269aa5" },
        },

        search = {
          command = "rg",
          args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          -- regex that will be used to match keywords.
          -- don't replace the (KEYWORDS) placeholder
          pattern = [[\b(KEYWORDS):]],
        },
      }
    end
  },
  {
    "max397574/colortils.nvim",
    cmd = "Colortils",
    config = function()
      require("colortils").setup()
    end
  },
  {
    "saecki/crates.nvim",
    tag = 'v0.3.0',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()
    end,
  },
  -- { "gen740/SmoothCursor.nvim",
  --     config = function()
  --       require('smoothcursor').setup {
  --           autostart = true,
  --           threshold = 1,
  --           speed = 12,
  --           type = 'exp',
  --           intervals = 15,
  --           fancy = {
  --               enable = true,
  --               head = { cursor = nil, texthl = 'SCCursor' },
  --               body = {
  --                   { cursor = "●", texthl = "SmoothCursorRed" },
  --                   { cursor = "●", texthl = "SmoothCursorOrange" },
  --                   { cursor = "●", texthl = "SmoothCursorYellow" },
  --                   { cursor = "●", texthl = "SmoothCursorGreen" },
  --                   { cursor = "•", texthl = "SmoothCursorAqua" },
  --                   { cursor = ".",   texthl = "SmoothCursorBlue" },
  --                   { cursor = ".",   texthl = "SmoothCursorPurple" },
  --               },
  --           },
  --       }
  --     end
  -- },
  {
    -- Copilot
    "zbirenbaum/copilot.lua",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup {
          panel = {
            enabled = false,
            auto_refresh = true,
            keymap = {
              jump_prev = "[[",
              jump_next = "]]",
              open = "<M-CR>"
            },
          },
          suggestion = {
            enabled = false,
            auto_trigger = true, -- false is the default
            debounce = 55,       -- 75 is the default
            keymap = {
              accept = "<M-l>",
              next = "<M-]>",
              prev = "<M-[>",
              dismiss = "<C-]>",
            },
          },
          plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
          copilot_node_command = vim.fn.expand("$HOME") .. "/.nvm/versions/node/v16.17.0/bin/node",
        }
      end, 100)
    end,
  },
  {
    "ckipp01/stylua-nvim",
    config = function()
      require("stylua-nvim").setup { config_file = "stylua.toml" }
    end,
  },
}

-- Copilot
lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })
--------------------------------------------------------------------------------------

-- LSP Diagnostics Options Setup -----------------------------------------------------
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    text = opts.text,
    texthl = opts.name,
    numhl = '',
  })
end

sign({ name = 'DiagnosticSignError', text = '' })
sign({ name = 'DiagnosticSignWarn', text = '' })
sign({ name = 'DiagnosticSignHint', text = '' })
sign({ name = 'DiagnosticSignInfo', text = '' })

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = false,
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

-- ADDITIONAL CONFIG OPTIONS ---------------------------------------------------------

-- {
--   "simrat39/rust-tools.nvim",
--   config = function()
--     require("rust-tools").setup {
--       tools = { -- rust-tools options
--         autoSetHints = true,
--         runnables = { use_telescope = true },
--         inlay_hints = {
--           auto                   = false,
--           show_parameter_hints   = true,
--           parameter_hints_prefix = "<- ",
--           other_hints_prefix     = "=> ",
--         },
--         hover_actions = {
--           auto_focus = true,
--         },
--       },
--       server = {
--         on_attach = on_attach,
--         settings = {
--           ["rust-analyzer"] = {
--             checkOnSave = { command = "clippy" },
--             assist = {
--               importGranularity = "module",
--               importPrefix = "by_self",
--             },
--             cargo = { loadOutDirsFromCheck = true },
--             procMacro = { enable = true }
--           }
--         }
--       } -- rust-analyzer options
--     }
--   end
-- },

--------------------------------------------------------------------------------------

-- vim.cmd([[
-- set signcolumn=yes
-- autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
-- ]])

--
-- {
--   -- Copilot
--  "zbirenbaum/copilot-cmp",
--  module = "copilot_cmp",
--  after = { "copilot.lua", "nvim-cmp" },
--  config = function()
--  require("copilot_cmp").setup()
--  end
-- },
--
-- Material Themes
-- vim.g.material_style = "OceanicNext" -- OceanicNext | palenight  |
-- lvim.colorscheme = "tokyonight"
-- Folke's Themes
-- lvim.colorscheme = "tokyonight-night"
-- vim.g.tokyonight_style = "night" -- storm | night | light
--
-- Other Themes
-- lvim.colorscheme = "melange"
-- lvim.colorscheme = "zephyr"
-- lvim.colorscheme = "material"
-- lvim.colorscheme = "habamax"
-- vim.g.material_style = "palenight"
-- lvim.colorscheme = "rose-pine"
-- require "rose-pine".setup {
-- moon | main
-- dark_variant = "moon",
-- }
-- lvim.colorscheme = "catppuccin"
-- vim.g.catppuccin_flavour = "macchiato"
-- vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
--
--
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )
--
--
-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }
--
--
-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }
--
--
-- lvim.builtin.telescope.defaults.initial_mode = "normal"
-- if you don't want all the parsers change this to a table of the ones you want
--
--
--
-- lvim.builtin.treesitter.playground = {
--   -- enable = true,
--   enable = false,
--   disable = {},
--   updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
--   persist_queries = false, -- Whether the query persists across vim sessions
--   keybindings = {
--     toggle_query_editor = 'o',
--     toggle_hl_groups = 'i',
--     toggle_injected_languages = 't',
--     toggle_anonymous_nodes = 'a',
--     toggle_language_display = 'I',
--     focus_language = 'f',
--     unfocus_language = 'F',
--     update = 'R',
--     goto_node = '<cr>',
--     show_help = '?',
--   },
-- }
--
--
-- generic LSP settings
--
--
-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumeko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }
--
--
-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false
--
--
-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)
--
--
-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
--
--
-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
--
--
-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }
--
-- lvim.builtin.telescope.defaults.initial_mode = "normal"
--
-- local has_words_before = function()
-- if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
-- local line, col = unpack(vim.api.nvim_win_get_cursor(0))
-- return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
-- end
--
-- cmp.setup({
-- mapping = {
-- ["<Tab>"] = vim.schedule_wrap(function(fallback)
-- if cmp.visible() and has_words_before() then
-- cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
-- else
-- fallback()
-- end
-- end),
-- },
-- })
--
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
-- --------------------------------------------------------------------------------------
