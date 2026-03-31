-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1) end
end
vim.opt.rtp:prepend(lazypath)

-- Leader key (must be before keymaps)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic settings (ported from vimrc)
vim.opt.number = true
vim.opt.hidden = true
vim.opt.history = 100
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.swapfile = true
vim.opt.directory = "~/.vim/vimtemp"
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0
vim.opt.backspace = "indent,eol,start"
vim.opt.termguicolors = true

-- Strip trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- Restore cursor position on file open
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Plugins
require("lazy").setup({
  -- Theme
  "dracula/vim",

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "dracula",
        },
      })
    end,
  },

  -- LSP configs (Neovim 0.11+ uses vim.lsp.enable/config API)
  "neovim/nvim-lspconfig",

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
      })
    end,
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  -- Comments
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Modern motion (Sneak replacement)
  {
    "folke/flash.nvim",
    config = function()
      require("flash").setup()
    end,
  },

  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("neo-tree").setup({
        source_selector = {
          sources = {
            { source = "filesystem", display_name = " 󰉓 Files " },
            { source = "buffers", display_name = " 󰈚 Buffers " },
            { source = "git_status", display_name = " 󰊢 Git " },
          },
        },
        default_component_configs = {
          preview = {
            preview_command = function(bufnr, config)
              local ft = vim.bo[bufnr].filetype
              if ft == "markdown" then
                require("lazy").load({ plugins = { "glow.nvim" } })
                require("glow").open_preview()
              else
                vim.api.nvim_win_set_buf(config.window, bufnr)
              end
            end,
            use_float = false,
          },
        },
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
      })
    end,
  },

  -- Markdown preview (rendered)
  {
    "ellisonleao/glow.nvim",
    ft = { "markdown" },
    config = function()
      require("glow").setup({
        style = "dark",
        width = 120,
        height = 40,
      })
    end,
  },
}, {
  install = {
    colorscheme = { "dracula" },
  },
})

-- Colorscheme (must be after lazy.setup)
vim.cmd.colorscheme("dracula")

-- Native LSP configuration (Neovim 0.11+ with nvim-lspconfig)
vim.lsp.enable("rust_analyzer")
vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = false,
      },
    },
  },
})
-- Enable other language servers as needed:
-- vim.lsp.enable("pyright")
-- vim.lsp.enable("clangd")
-- vim.lsp.enable("lua_ls")

-- Keymaps
local map = vim.keymap.set
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
map("n", "<leader><space>", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })

-- Neo-tree
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle neo-tree" })
map("n", "<leader>b", "<cmd>Neotree buffers<cr>", { desc = "Buffers" })
map("n", "<leader>g", "<cmd>Neotree git_status<cr>", { desc = "Git status" })

-- Diagnostic navigation
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics" })

-- Flash keymap
map({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, { desc = "Flash" })

-- Markdown preview (glow)
map("n", "<leader>mp", function()
  require("lazy").load({ plugins = { "glow.nvim" } })
  vim.cmd("Glow")
end, { desc = "Markdown Preview" })
map("n", "<leader>mc", function()
  require("lazy").load({ plugins = { "glow.nvim" } })
  vim.cmd("GlowClose")
end, { desc = "Markdown Close" })

-- Comment keymap (gcc to toggle, gc for motion)
-- Comment.nvim sets these up automatically
