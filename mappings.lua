local macro = require "user.util.macro"
local buffer = require "astronvim.utils.buffer"
local astro_utils = require "astronvim.utils"

return {
  n = {
    -- Disable keymaps
    ["gh"] = false,
    ["s"] = false,
    ["Q"] = false,
    -- Movement
    ["<C-o>"] = { "o<ESC>" },
    ["<C-O>"] = { "O<ESC>" },
    ["<M-j>"] = { "10j" },
    ["<M-k>"] = { "10k" },
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },
    ["n"] = { macro.better_search "n", desc = "Next search with center and unfold" },
    ["N"] = { macro.better_search "N", desc = "previous search with center and unfold" },
    ["<M-l>"] = { function() buffer.nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" },
    ["<M-h>"] = { function() buffer.nav(-(vim.v.count > 0 and vim.v.count or 1)) end, desc = "Previous buffer" },
    -- ["<tab>"] = { "<cmd>><cr>", desc = "indent" },
    -- ["<S-tab>"] = { "<cmd><<cr>", desc = "indent" },
    ["<Tab>"] = {
      -- prueba para ver como funciona
      function()
        if #vim.t.bufs > 1 then
          require("telescope.builtin").buffers {
            sort_mru = true,
            ignore_current_buffer = true,
          }
        else
          astro_utils.notify "No other buffers open"
        end
      end,
      desc = "Switch Buffers",
    },
    -- Rename
    ["yrw"] = { "yiw:s/\\C\\<<C-R>0\\>/" },
    ["yrW"] = { "yiW:s/\\C\\<<C-R>0\\>/" },
    ["yre"] = { "yie:s/\\C\\<<C-R>0\\>/" },
    ["yrE"] = { "yiE:s/\\C\\<<C-R>0\\>/" },
    ["<F2>"] = { "y:%s/<C-R>0/" },
    ["<F2><F2>"] = { "y:%s/<C-R>0/" },
    ["<F3>"] = { "<cmd>lua require('spectre').open()<cr>" },
    ["<F3><F3>"] = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>" },
    ["<leader>r"] = { function() require("ssr").open() end, desc = "SSR" },
    -- Telescope
    ["<C-p>"] = { "<cmd>Telescope fd<CR>", desc = "Activates Telescope fd" },
    ["<C-S-p>"] = { "<cmd>Telescope commands<CR>", desc = "Activates Telescope commands" },
    ["<C-f>"] = { "<cmd>Telescope live_grep<CR>", desc = "Activates Telescope live_grep" },
    -- ["<C-b>"] = { "<cmd>Telescope file_browser<CR>" },
    -- ["<C-z>"] = { "<cmd>Telescope undo<CR>" },

    --
    ["<leader>n"] = { "<cmd>ZenMode<CR>", desc = "Centers and mutes code" },
    ["<leader>u1"] = { "<cmd>AerialToggle<CR>", desc = "Toggle Aerial" },
    ["<leader>u2"] = { "<cmd>TroubleToggle<CR>", desc = "Toggle Trouble" },
    ["<leader>u3"] = { "<cmd>TagbarToggle<CR>", desc = "Toggle Tagbar" },
    ["sj"] = { "<cmd>TSJToggle<CR>", desc = "Treesj toggle" },
    -- Others
    ["<F12>"] = { "<cmd>CellularAutomaton make_it_rain<CR>", desc = "Toggle Tagbar" },
    ["<leader>uD"] = { ":lua require('lsp-inlayhints').toggle()<cr>", desc = "Toggle inlay hints" },
    -- Grapple
    ["gt"] = { ":GrappleToggle<cr>", desc = "Tags current buffer" },
    ["gp"] = { ":GrapplePopup tags<cr>", desc = "Grapple tag popup menu" },
    -- neogen
    ["<leader>a"] = { desc = "󰏫 Annotate" },
    ["<leader>a<cr>"] = { function() require("neogen").generate() end, desc = "Current" },
    ["<leader>ac"] = { function() require("neogen").generate { type = "class" } end, desc = "Class" },
    ["<leader>af"] = { function() require("neogen").generate { type = "func" } end, desc = "Function" },
    ["<leader>at"] = { function() require("neogen").generate { type = "type" } end, desc = "Type" },
    ["<leader>aF"] = { function() require("neogen").generate { type = "file" } end, desc = "File" },
    -- telescope plugin mappings
    ["<leader>fB"] = { "<cmd>Telescope bibtex<cr>", desc = "Find BibTeX" },
    ["<leader>fe"] = { "<cmd>Telescope file_browser<cr>", desc = "File explorer" },
    ["<leader>fp"] = { function() require("telescope").extensions.projects.projects {} end, desc = "Find projects" },
    ["<leader>fT"] = { "<cmd>TodoTelescope<cr>", desc = "Find TODOs" },
    -- octo plugin mappings
    ["<leader>G"] = { name = " GitHub" },
    ["<leader>Gi"] = { "<cmd>Octo issue list<cr>", desc = "Open Issues" },
    ["<leader>GI"] = { "<cmd>Octo issue search<cr>", desc = "Search Issues" },
    ["<leader>Gp"] = { "<cmd>Octo pr list<cr>", desc = "Open PRs" },
    ["<leader>GP"] = { "<cmd>Octo pr search<cr>", desc = "Search PRs" },
    ["<leader>Gr"] = { "<cmd>Octo repo list<cr>", desc = "Open Repository" },
  },
  v = {
    ["r"] = { "y:s/\\C\\<<C-R>0\\>/" },
    ["<F2>"] = { "'<'>%s/\\C<C-R>0/" },
    ["<F2><F2>"] = { "'<'>s/\\C<C-R>0/" },
    -- ["\\"] = { ToggleKeySet, desc = "Toggles Key Set" },

    -- Rename
    ["<leader>r"] = { function() require("ssr").open() end, desc = "SSR" },
  },
  i = {
    ["<C-o>"] = { "<C-o>o" },
    ["<C-O>"] = { "<C-o>O" },
    ["<M-l>"] = { "<cmd>><cr>", desc = "indent" },
    ["<M-h>"] = { "<cmd><<cr>", desc = "indent" },
  },
  c = {
    -- ["<CR>"] = { function() return vim.fn.getcmdtype() == '/' and '<CR>zzzv' or '<CR>' end }
  },
}
