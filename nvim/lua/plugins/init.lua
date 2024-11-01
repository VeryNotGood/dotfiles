-- All plugins have lazy=true by default,to load a plugin on startup just lazy=false
-- List of all default plugins & their definition
local default_plugins = {
  {
    "RRethy/vim-illuminate",
    lazy = false,
  },
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    opts = {
      disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil" },
      disable_mouse = true,
    },
  },
  {
    "utilyre/barbecue.nvim",
    lazy = false,
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
  -- {
  --   'sainnhe/gruvbox-material',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     -- Optionally configure and load the colorscheme
  --     -- directly inside the plugin declaration.
  --     vim.g.gruvbox_material_enable_italic = true
  --     vim.cmd.colorscheme('gruvbox-material')
  --     vim.g.gruvbox_material_background = 'hard'
  --     vim.g.gruvbox_better_performance = 1
  --   end
  -- },
  {
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-completion",
    "kristijanhusak/vim-dadbod-ui",
    lazy = false,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    config = function()
      require("gruvbox").setup {
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "",  -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      }
      vim.cmd "colorscheme gruvbox"
    end,
  },
  {
    "EdenEast/nightfox.nvim",
  },
  {
    "folke/noice.nvim",
    event = "BufEnter",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      opts = {
        -- options
      },
    },
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    lazy = false,
  },
  {
    "mbbill/undotree",
    lazy = false,
  },
  --   {
  --   "debugloop/telescope-undo.nvim",
  --   dependencies = { -- note how they're inverted to above example
  --     {
  --       "nvim-telescope/telescope.nvim",
  --       dependencies = { "nvim-lua/plenary.nvim" },
  --     },
  --   },
  --   keys = {
  --     { -- lazy style key map
  --       "<leader>u",
  --       "<cmd>Telescope undo<cr>",
  --       desc = "undo history",
  --     },
  --   },
  --   opts = { -- don't use `defaults = { }` here, do this in the main telescope spec
  --     extensions = {
  --       undo = {
  --         -- telescope-undo.nvim config, see below
  --       },
  --       -- no other extensions here, they can have their own spec too
  --     },
  --   },
  --   config = function(_, opts)
  --     -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
  --     -- configs for us. We won't use data, as everything is in it's own namespace (telescope
  --     -- defaults, as well as each extension).
  --     require("telescope").setup(opts)
  --     require("telescope").load_extension("undo")
  --   end,
  -- },
  {
    "fcpg/vim-fahrenheit",
  },
  -- you're not good enough at coding to use AI yet
  -- {
  --   "Exafunction/codeium.vim",
  --   lazy = false,
  --   event = "BufEnter"
  -- },
  { "machakann/vim-highlightedyank", lazy = false },
  { "ianding1/leetcode.vim",         lazy = false },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
  },
  {
    "MunifTanjim/eslint.nvim",
    lazy = "false",
  },
  {
    "ggandor/leap.nvim",
    lazy = false,
    enabled = true,
    keys = {
      { "s",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S",  mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      local leap = require "leap"
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },
  { "tpope/vim-repeat",      lazy = false },
  { "tpope/vim-surround",    lazy = false },
  { "junegunn/vim-peekaboo", lazy = false },
  { "romainl/vim-cool",      lazy = false },
  { "wfxr/minimap.vim",      "wfxr/code-minimap", lazy = false },
  --{ "f-person/git-blame",
  --  lazy = false
  --},
  {
    "mattn/emmet-vim",
    lazy = false,
  },
  --- { "neoclide/coc.nvim",
  ---   lazy = false
  ---},
  {
    "ludovicchabant/vim-gutentags",
    lazy = false,
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "preservim/tagbar",
    lazy = false,
  },
  {
    "nvim-lua/plenary.nvim",
    lazy = false,
  },
  {
    "fatih/vim-go",
    lazy = false,
  },
  {
    "NvChad/base46",
    lazy = false,
    branch = "v2.0",
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  {
    "NvChad/ui",
    branch = "v2.0",
    lazy = false,
  },

  {
    "NvChad/nvterm",
    lazy = false,
    init = function()
      require("core.utils").load_mappings "nvterm"
    end,
    config = function(_, opts)
      require "base46.term"
      require("nvterm").setup(opts)
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    lazy = false,
    event = "User FilePost",
    config = function(_, opts)
      require("colorizer").setup(opts)

      -- execute colorizer as soon as possible
      vim.defer_fn(function()
        require("colorizer").attach_to_buffer(0)
      end, 0)
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
    opts = function()
      return { override = require "nvchad.icons.devicons" }
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "devicons")
      require("nvim-web-devicons").setup(opts)
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    version = "2.20.7",
    event = "User FilePost",
    opts = function()
      return require("plugins.configs.others").blankline
    end,
    config = function(_, opts)
      require("core.utils").load_mappings "blankline"
      dofile(vim.g.base46_cache .. "blankline")
      require("indent_blankline").setup(opts)
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return require "plugins.configs.treesitter"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- git stuff
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    event = "User FilePost",
    opts = function()
      return require("plugins.configs.others").gitsigns
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "git")
      require("gitsigns").setup(opts)
    end,
  },

  -- lsp stuff
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = function()
      return require "plugins.configs.mason"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "mason")
      require("mason").setup(opts)

      -- custom nvchad cmd to install all mason binaries listed
      vim.api.nvim_create_user_command("MasonInstallAll", function()
        if opts.ensure_installed and #opts.ensure_installed > 0 then
          vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
        end
      end, {})

      vim.g.mason_binaries_list = opts.ensure_installed
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = false,
    ft = "go",
    opts = function()
      return require "null-ls"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    lazy = false,
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! sudo GoInstallDeps]]
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    event = "User FilePost",
    config = function()
      require "plugins.configs.lspconfig"
    end,
  },

  -- load luasnips + cmp related in insert mode only
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("plugins.configs.others").luasnip(opts)
        end,
      },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        lazy = false,
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
      },
    },
    lazy = false,
    opts = function()
      return require "plugins.configs.cmp"
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },

  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n",          desc = "Comment toggle current line" },
      { "gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc",  mode = "x",          desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n",          desc = "Comment toggle current block" },
      { "gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb",  mode = "x",          desc = "Comment toggle blockwise (visual)" },
    },
    init = function()
      require("core.utils").load_mappings "comment"
    end,
    config = function(_, opts)
      require("Comment").setup(opts)
    end,
  },

  -- file managing , picker etc
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    init = function()
      require("core.utils").load_mappings "nvimtree"
    end,
    opts = function()
      return require "plugins.configs.nvimtree"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "nvimtree")
      require("nvim-tree").setup(opts)
    end,
  },

  {
    "sharkdp/fd",
    lazy = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter", "sharkdp/fd" },
    cmd = "Telescope",
    init = function()
      require("core.utils").load_mappings "telescope"
    end,
    opts = function()
      return require "plugins.configs.telescope"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "telescope")
      local telescope = require "telescope"
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },

  -- Only load whichkey after all the gui
  {
    "folke/which-key.nvim",
    lazy = false,
    keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    init = function()
      require("core.utils").load_mappings "whichkey"
    end,
    cmd = "WhichKey",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "whichkey")
      require("which-key").setup(opts)
    end,
  },
}

local config = require("core.utils").load_config()

if #config.plugins > 0 then
  table.insert(default_plugins, { import = config.plugins })
end

require("lazy").setup(default_plugins, config.lazy_nvim)
