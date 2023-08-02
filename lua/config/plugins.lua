return {
  -- Themes
  {
    "arturgoms/moonbow.nvim",
    lazy = true,
    priority = 1000,
    -- config = function()
    --   -- load the colorscheme here
    --   vim.cmd([[colorscheme moonbow]])
    --   require("config.colorscheme")
    -- end,
  },
  {
    "hachy/eva01.vim",
    lazy = true,
    -- priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme "eva01"
    -- or
    -- vim.cmd.colorscheme "eva01-LCL"
    -- end,
  },
  {
    'nyngwang/nvimgelion',
    -- lazy = false,
    -- priority = 1000,
    -- config = function()
    --   -- load the colorscheme here
    --   vim.cmd([[colorscheme nvimgelion]])
    --   require("config.colorscheme")
    -- end,
  },
  {
    'Jorengarenar/vim-darkness',
    -- lazy = false,
    -- priority = 1000,
    -- config = function()
    --   -- load the colorscheme here
    --   vim.cmd([[colorscheme darkness]])
    --   -- require("config.colorscheme")
    -- end,
  },
  {
    "mcchrish/zenbones.nvim",
    -- lazy = false,
    -- priority = 1000,
    -- dependencies = {
    --   "rktjmp/lush.nvim"
    -- },
    -- config = function()
    --   vim.cmd([[colorscheme zenwritten]])
    -- end,
  },
  {
    'He4eT/desolate.nvim',
    lazy = false,
    priority = 1000,
    dependencies = {
      "rktjmp/lush.nvim"
    },
    config = function()
      -- vim.g.desolate_h = 119
      -- vim.g.desolate_s = 100
      -- vim.g.desolate_l = 1
      -- vim.g.desolate_contrast = 100

      vim.g.desolate_fg = '#66ff66'
      vim.g.desolate_bg = '#000000'

      vim.g.desolate_constant = '#6200eb'
      vim.g.desolate_identifier = '#66ff66'
      --#6200eb purp
      --#66ff66 green
      vim.g.desolate_statement = '#ffffff'
      vim.cmd([[colorscheme desolate]])
    end,
  },
  {
    "xero/miasma.nvim",
    lazy = true,
    -- priority = 1000,
    -- config = function()
    --   vim.cmd("colorscheme miasma")
    -- end,
  },
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({ default = true })
    end,
  },
  {
    "goolord/alpha-nvim",
    lazy = false,
    config = function()
      require("plugins.alpha")
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
    lazy = false,
    config = function()
      require("plugins.treesitter")
    end,
    dependencies = {
      "hiphish/rainbow-delimiters.nvim",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-textsubjects",
    },
  },

  -- Navigating (Telescope/Tree/Refactor)
  { "nvim-pack/nvim-spectre" },
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    config = function()
      require("plugins.telescope")
    end,
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "cljoly/telescope-repo.nvim" },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = {
      "NvimTreeOpen",
      "NvimTreeClose",
      "NvimTreeToggle",
      "NvimTreeFindFile",
      "NvimTreeFindFileToggle",
    },
    keys = {
      { "<C-e>", "<cmd>lua require('nvim-tree.api').tree.toggle()<CR>", desc = "NvimTree" },
    },
    config = function()
      require("plugins.tree")
    end,
  },
  {
    "gbprod/stay-in-place.nvim",
    lazy = false,
    config = true, -- run require("stay-in-place").setup()
  },

  -- LSP Base
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    servers = nil,
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = {
      { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
    },
  },

  -- LSP Cmp
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require("plugins.cmp")
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-calc",
      "saadparwaiz1/cmp_luasnip",
      { "L3MON4D3/LuaSnip", dependencies = "rafamadriz/friendly-snippets" },
      {
        cond = EcoVim.plugins.ai.tabnine.enabled,
        "tzachar/cmp-tabnine",
        build = "./install.sh",
      },
      {
        "David-Kunz/cmp-npm",
        config = function()
          require("plugins.cmp-npm")
        end,
      },
      {
        "zbirenbaum/copilot-cmp",
        cond = EcoVim.plugins.ai.copilot.enabled,
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
  },

  -- LSP Addons
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
      require("plugins.dressing")
    end,
  },
  { "onsails/lspkind-nvim" },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require("plugins.trouble")
    end,
  },
  { "nvim-lua/popup.nvim" },
  {
    "SmiteshP/nvim-navic",
    config = function()
      require("plugins.navic")
    end,
    dependencies = "neovim/nvim-lspconfig",
  },
  {
    "pmizio/typescript-tools.nvim",
    event = { "BufReadPre", "BufNewFile" },
    ft = { "typescript", "typescriptreact" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("plugins.typescript-tools")
    end,
  },
  {
    "axelvc/template-string.nvim",
    event = "InsertEnter",
    ft = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
    },
    config = true, -- run require("template-string").setup()
  },
  {
    "dmmulroy/tsc.nvim",
    cmd = { "TSC" },
    config = true,
  },
  {
    "dnlhc/glance.nvim",
    config = function()
      require("plugins.glance")
    end,
    cmd = { "Glance" },
    keys = {
      { "gd", "<cmd>Glance definitions<CR>",      desc = "LSP Definition" },
      { "gr", "<cmd>Glance references<CR>",       desc = "LSP References" },
      { "gm", "<cmd>Glance implementations<CR>",  desc = "LSP Implementations" },
      { "gy", "<cmd>Glance type_definitions<CR>", desc = "LSP Type Definitions" },
    },
  },
  {
    "antosha417/nvim-lsp-file-operations",
    event = "LspAttach",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "kyazdani42/nvim-tree.lua" },
    },
    config = function()
      require("lsp-file-operations").setup()
    end
  },

  -- General
  { "AndrewRadev/switch.vim",      lazy = false },
  {
    "Wansmer/treesj",
    lazy = true,
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    keys = {
      { "gJ", "<cmd>TSJToggle<CR>", desc = "Toggle Split/Join" },
    },
    config = function()
      require("treesj").setup({
        use_default_keymaps = false,
      })
    end,
  },
  {
    "numToStr/Comment.nvim",
    lazy = false,
    branch = "jsx",
    config = function()
      require("plugins.comment")
    end,
  },
  { "LudoPinelli/comment-box.nvim" },
  {
    "akinsho/nvim-toggleterm.lua",
    lazy = false,
    branch = "main",
    config = function()
      require("plugins.toggleterm")
    end,
  },
  { "tpope/vim-repeat",           lazy = false },
  { "tpope/vim-speeddating",      lazy = false },
  { "dhruvasagar/vim-table-mode", ft = { "markdown" } },
  -- {
  -- 	"mg979/vim-visual-multi",
  -- 	keys = {
  -- 		"<C-Up>",
  -- 		"<C-Down>",
  -- 		"<S-Up>",
  -- 		"<S-Down>",
  -- 		"<S-Left>",
  -- 		"<S-Right>",
  -- 	},
  -- 	config = function()
  -- 		vim.g.VM_leader = ";"
  -- 	end,
  -- },
  {
    "nacro90/numb.nvim",
    lazy = false,
    config = function()
      require("plugins.numb")
    end,
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    event = "BufEnter",
    config = function()
      require("plugins.todo-comments")
    end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    config = function()
      require("plugins.zen")
    end,
    cond = EcoVim.plugins.zen.enabled,
  },
  {
    "folke/twilight.nvim",
    config = true,
    cond = EcoVim.plugins.zen.enabled,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
      },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    lazy = true,
    config = function()
      require("plugins.which-key")
    end,
  },
  {
    "ecosse3/galaxyline.nvim",
    config = function()
      require("plugins.galaxyline")
    end,
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.bufremove",
    version = "*",
    config = function()
      require("mini.bufremove").setup({
        silent = true,
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "echasnovski/mini.bufremove",
    },
    version = "*",
    config = function()
      require("plugins.bufferline")
    end,
  },
  { "antoinemadec/FixCursorHold.nvim" }, -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
      })
    end,
    init = function()
      local banned_messages = {
        "No information available",
        "LSP[tsserver] Inlay Hints request failed. Requires TypeScript 4.4+.",
        "LSP[tsserver] Inlay Hints request failed. File not opened in the editor.",
      }
      vim.notify = function(msg, ...)
        for _, banned in ipairs(banned_messages) do
          if msg == banned then
            return
          end
        end
        return require("notify")(msg, ...)
      end
    end,
  },
  {
    "vuki656/package-info.nvim",
    event = "BufEnter package.json",
    config = function()
      require("plugins.package-info")
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "airblade/vim-rooter",
    setup = function()
      vim.g.rooter_patterns = EcoVim.plugins.rooter.patterns
    end,
  },
  {
    "Shatur/neovim-session-manager",
    lazy = false,
    config = function()
      require("plugins.session-manager")
    end,
  },
  { "kylechui/nvim-surround",         lazy = false, config = true },
  {
    "sunjon/shade.nvim",
    config = function()
      require("shade").setup()
      require("shade").toggle()
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
      vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
    end,
  },
  {
    "echasnovski/mini.align",
    lazy = false,
    version = "*",
    config = function()
      require("mini.align").setup()
    end,
  },
  {
    "echasnovski/mini.ai",
    lazy = false,
    version = "*",
    config = function()
      require("mini.ai").setup()
    end,
  },
  {
    "rareitems/printer.nvim",
    event = "BufEnter",
    ft = {
      "lua",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
    },
    config = function()
      require("plugins.printer")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = function()
      require("plugins.indent")
    end,
  },
  {
    "folke/noice.nvim",
    cond = EcoVim.plugins.experimental_noice.enabled,
    lazy = false,
    config = function()
      require("plugins.noice")
    end,
  },
  {
    "chrisgrieser/nvim-spider",
    cond = EcoVim.plugins.jump_by_subwords.enabled,
    lazy = true,
    keys = { "w", "e", "b", "ge" },
    config = function()
      vim.keymap.set({ "n", "o", "x" }, "W", "w", { desc = "Normal w" })
      vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
      vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
      vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
      vim.keymap.set(
        { "n", "o", "x" },
        "ge",
        "<cmd>lua require('spider').motion('ge')<CR>",
        { desc = "Spider-ge" }
      )
    end,
  },

  -- Snippets & Language & Syntax
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("plugins.autopairs")
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("plugins.colorizer")
    end,
  },
  {
    "js-everts/cmp-tailwind-colors",
    config = true,
  },
  {
    "razak17/tailwind-fold.nvim",
    opts = {},
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "html", "svelte", "astro", "vue", "typescriptreact" },
  },

  -- AI
  {
    "jcdickinson/codeium.nvim",
    cond = EcoVim.plugins.ai.codeium.enabled,
    event = "InsertEnter",
    cmd = "Codeium",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = true,
  },
  {
    "zbirenbaum/copilot.lua",
    cond = EcoVim.plugins.ai.copilot.enabled,
    event = "InsertEnter",
    config = function()
      require("plugins.copilot")
    end,
  },
  {
    "Bryley/neoai.nvim",
    cond = EcoVim.plugins.ai.chatgpt.enabled,
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    cmd = {
      "NeoAI",
      "NeoAIOpen",
      "NeoAIClose",
      "NeoAIToggle",
      "NeoAIContext",
      "NeoAIContextOpen",
      "NeoAIContextClose",
      "NeoAIInject",
      "NeoAIInjectCode",
      "NeoAIInjectContext",
      "NeoAIInjectContextCode",
    },
    keys = {
      { "<leader>as", desc = "summarize text" },
      { "<leader>ag", desc = "generate git message" },
    },
    config = true,
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.git.signs")
    end,
  },
  {
    "sindrets/diffview.nvim",
    lazy = true,
    enabled = false,
    event = "BufRead",
    config = function()
      require("plugins.git.diffview")
    end,
  },
  {
    "akinsho/git-conflict.nvim",
    lazy = false,
    config = function()
      require("plugins.git.conflict")
    end,
  },
  {
    "ThePrimeagen/git-worktree.nvim",
    keys = {
      "<Leader>gwc",
      "<Leader>gww",
    },
    config = function()
      require("plugins.git.worktree")
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitCurrentFile",
      "LazyGitFilterCurrentFile",
      "LazyGitFilter",
    },
    config = function()
      vim.g.lazygit_floating_window_scaling_factor = 1
    end,
  },

  -- Testing
  {
    "rcarriga/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
    },
    config = function()
      require("plugins.neotest")
    end,
  },
  {
    "andythigpen/nvim-coverage",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = {
      "Coverage",
      "CoverageSummary",
      "CoverageLoad",
      "CoverageShow",
      "CoverageHide",
      "CoverageToggle",
      "CoverageClear",
    },
    config = function()
      require("coverage").setup()
    end,
  },

  -- DAP
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("plugins.dap")
    end,
    keys = {
      "<Leader>da",
      "<Leader>db",
      "<Leader>dc",
      "<Leader>dd",
      "<Leader>dh",
      "<Leader>di",
      "<Leader>do",
      "<Leader>dO",
      "<Leader>dt",
    },
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "mxsdev/nvim-dap-vscode-js",
    },
  },
  {
    "LiadOz/nvim-dap-repl-highlights",
    config = true,
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-treesitter/nvim-treesitter",
    },
    build = function()
      if not require("nvim-treesitter.parsers").has_parser("dap_repl") then
        vim.cmd(":TSInstall dap_repl")
      end
    end,
  },

  -- {
  --   "jay-babu/mason-null-ls.nvim",
  --   event = "BufReadPre",
  --   dependencies = { "mason.nvim" },
  --   config = function()
  --     local mnls = require("mason-null-ls")
  --     mnls.setup({
  --       automatic_setup = true,
  --       ensure_installed = { "stylua", "jq", "prettierd" },
  --     })
  --   end,
  -- },
  --
  {
    "epwalsh/obsidian.nvim",
    lazy = false,
    config = function()
      local obs = require("obsidian")
      obs.setup({
        dir = "~/Documents/notes",
        completion = {
          nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
        },
      })
    end,
  },

  {
    "tpope/vim-dadbod",
    lazy = false,
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    lazy = false,
  },

  {
    "da-moon/telescope-toggleterm.nvim",
    lazy = false,
    event = "TermOpen",
    dependencies = {
      "akinsho/nvim-toggleterm.lua",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope-toggleterm").setup()
    end,
  },

  {
    "JellyApple102/easyread.nvim",
    lazy = false,
    opts = {
      hlValues          = {
        ['1'] = 1,
        ['2'] = 1,
        ['3'] = 2,
        ['4'] = 2,
        ['fallback'] = 0.4
      },
      hlgroupOptions    = { link = 'Bold' },
      fileTypes         = { 'text' },
      saccadeInterval   = 0,
      saccadeReset      = false,
      updateWhileInsert = true
    }
  },


  {
    "nullchilly/fsread.nvim",
    lazy = false
  },


  {
    "Fildo7525/pretty_hover",
    event = "LspAttach",
    opts = {}
  },

  {
    'dmmulroy/tsc.nvim',
    config = function()
      require('tsc').setup()
    end
  },

  {
    'numToStr/Navigator.nvim',
    lazy = false,
    config = function()
      require('Navigator').setup()
    end
  },
  {
    'AckslD/muren.nvim',
    lazy = false,
    config = function()
      require('muren').setup({
        keys = {
          toggle_options_focus = '<C-d>'
        }
      })
    end
  },
  {
    'MeF0504/vim-pets',
    lazy = false,
    config = function()
      vim.g.pets_default_pet = 'cat'
      vim.g.pets_lifetime_enable = 0
      vim.g.pets_birth_enable = 0
      vim.g.pets_garden_width = 8
      vim.g.pets_garden_height = 8
      vim.cmd([[Pets cat Linux]])
      vim.cmd([[PetsJoin cat Zustand]])
      vim.cmd([[PetsJoin cat Iggy]])
    end
  },
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   lazy = false,
  --   opts = {},
  --   config = function()
  --     require("typescript-tools").setup {
  --       on_attach = function()
  --       end,
  --       settings = {
  --         tsserver_file_preferences = {
  --           includeInlayParameterNameHints = "all",
  --           includeCompletionsForModuleExports = true,
  --           quotePreference = "auto",
  --         },
  --         tsserver_format_options = {
  --           allowIncompleteCompletions = false,
  --           allowRenameOfImportPath = false,
  --         }
  --       },
  --     }
  --   end,
  -- }
  {
    'tomiis4/Hypersonic.nvim',
    cmd = "Hypersonic",
    lazy = false,
    config = function()
      require('hypersonic').setup({
        ---@type 'none'|'single'|'double'|'rounded'|'solid'|'shadow'|table
        border = 'rounded',
        ---@type number 0-100
        winblend = 0,
        ---@type boolean
        add_padding = true,
        ---@type string
        hl_group = 'Keyword',
        ---@type string
        wrapping = '"'
      })
    end
  },
  {
    "HampusHauffman/block.nvim",
    lazy = false,
    config = function()
      require("block").setup({})
    end
  },
  {
    "cseickel/diagnostic-window.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" }
  },
  {
    "davidosomething/format-ts-errors.nvim",
    lazy = false
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Flash Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
  {
    'sbdchd/neoformat',
    lazy = false
  }
}
