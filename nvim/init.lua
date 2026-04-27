-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
vim.wo.number = true
require("lazy").setup({

  -- 🎨 TEMAS (vários para testar)

  { "folke/tokyonight.nvim", priority = 1000 },
  { "catppuccin/nvim", name = "catppuccin" },
  { "ellisonleao/gruvbox.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },
  { "navarasu/onedark.nvim" },
  { "rebelot/kanagawa.nvim" },

  -- 🌲 File tree
  { "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-tree").setup()
    end
  },

  -- 🔎 Fuzzy finder
  { "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- 🎨 Syntax highlight
  { "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },

  -- ✍️ Autocomplete
  { "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-buffer" },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "buffer" },
        }
      })
    end
  },

-- autocomplete de parenteses e colchetes

{ "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({})
  end
},

{
 "lewis6991/gitsigns.nvim",
 config = function()
   require("gitsigns").setup()
 end
},

{
 "nvim-lualine/lualine.nvim",
 dependencies = {"nvim-tree/nvim-web-devicons"},
 config = function()
   require("lualine").setup()
 end
},

})

-- ⌨️ Keymaps úteis

vim.g.mapleader = " "  -- Leader = espaço

-- 🌲 File tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- 🔎 Buscar arquivos
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")

-- 🔍 Buscar texto no projeto
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")

-- 🌙 Defina um tema padrão inicial (pode trocar depois)
vim.cmd.colorscheme("tokyonight")

-- ⬆️⬇️ Mover linha atual (modo normal)
vim.keymap.set("n", "<S-Up>", ":m .-2<CR>==")
vim.keymap.set("n", "<S-Down>", ":m .+1<CR>==")

-- ⬆️⬇️ Mover seleção (modo visual)
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv")

-- setinhas para vim
vim.keymap.set("", "<Up>", "k")
vim.keymap.set("", "<Down>", "j")
vim.keymap.set("", "<Left>", "h")
vim.keymap.set("", "<Right>", "l")

-- Atalho para sair do terminal mode com ESC
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })

-- para copypaste 
vim.opt.clipboard = "unnamedplus"

