return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "mfussenegger/nvim-dap",
    init = function()
      vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line"})

      vim.keymap.set("n", "<leader>dus",
        function()
          local widgets = require('dap.ui.widgets');
          local sidebar = widgets.sidebar(widgets.scopes);
          sidebar.open();
        end,
        { desc = "Open debugging sidebar" }
      )
      end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)

      vim.keymap.set("n", "<leader>dgt",
        function()
          require('dap-go').debug_test()
        end,
        { desc = "Debug go test" }
      )

      vim.keymap.set("n", "<leader>dgl",
        function()
          require('dap-go').debug_last()
        end,
        { desc = "Debug last go test"}
      )
      end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    ft = "go",
    opts = function()
      return require "configs.none-ls"
    end,
  },

  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      vim.keymap.set("n", "<leader>gsj", "<cmd> GoTagAdd json <CR>",
        { desc = "Add json struct tags"}
      )

      vim.keymap.set("n", "<leader>gsy", "<cmd> GoTagAdd yaml <CR>",
        { desc = "Add yaml struct tags"}
      )
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
