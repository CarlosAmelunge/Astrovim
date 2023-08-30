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
    ["<M-j>"] = { "10j" },
    ["<M-k>"] = { "10k" },
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },
    ["x"] = { '"_x' },
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
    -- Telescope
    ["<C-p>"] = { "<cmd>Telescope fd<CR>", desc = "Activates Telescope fd" },
    ["<C-S-p>"] = { "<cmd>Telescope commands<CR>", desc = "Activates Telescope commands" },
    ["<C-f>"] = { "<cmd>Telescope live_grep<CR>", desc = "Activates Telescope live_grep" },
    -- ["<C-b>"] = { "<cmd>Telescope file_browser<CR>" },
    -- ["<C-z>"] = { "<cmd>Telescope undo<CR>" },

    -- Grapple
    ["gt"] = { ":GrappleToggle<cr>", desc = "Tags current buffer" },
    ["gp"] = { ":GrapplePopup tags<cr>", desc = "Grapple tag popup menu" },
    -- neogen
    ["<leader>a"] = { desc = "󰏫 Annotate" },
    ["<leader>ac"] = { function() require("neogen").generate { type = "class" } end, desc = "Class" },
    ["<leader>af"] = { function() require("neogen").generate { type = "func" } end, desc = "Function" },
    ["<leader>at"] = { function() require("neogen").generate { type = "type" } end, desc = "Type" },
    ["<leader>aF"] = { function() require("neogen").generate { type = "file" } end, desc = "File" },
    -- telescope plugin mappings
    ["<leader>fB"] = { "<cmd>Telescope bibtex<cr>", desc = "Find BibTeX" },
    ["<leader>fe"] = { "<cmd>Telescope file_browser<CR>", desc = "File explorer" },
    ["<leader>fp"] = { function() require("telescope").extensions.projects.projects {} end, desc = "Find projects" },
    ["<leader>fT"] = { "<cmd>TodoTelescope<cr>", desc = "Find TODOs" },
    -- octo plugin mappings
    ["<leader>G"] = { name = " GitHub" },
    ["<leader>Gi"] = { "<cmd>Octo issue list<cr>", desc = "Open Issues" },
    ["<leader>GI"] = { "<cmd>Octo issue search<cr>", desc = "Search Issues" },
    ["<leader>Gp"] = { "<cmd>Octo pr list<cr>", desc = "Open PRs" },
    ["<leader>GP"] = { "<cmd>Octo pr search<cr>", desc = "Search PRs" },
    ["<leader>Gr"] = { "<cmd>Octo repo list<cr>", desc = "Open Repository" },
    --Harpoons module
    ["<C-m>"] = { ":lua require('harpoon.mark').add_file()<cr>", desc = "Mark file" },
    ["<C-t>"] = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Toggle UI" },
    ["<M-1>"] = { ":lua require('harpoon.ui').nav_file(1)<cr>", desc = "Goto mark 1" },
    ["<M-2>"] = { ":lua require('harpoon.ui').nav_file(2)<cr>", desc = "Goto mark 2" },
    ["<M-3>"] = { ":lua require('harpoon.ui').nav_file(3)<cr>", desc = "Goto mark 3" },
    ["<M-4>"] = { ":lua require('harpoon.ui').nav_file(4)<cr>", desc = "Goto mark 4" },
    ["<M-5>"] = { ":lua require('harpoon.ui').nav_file(5)<cr>", desc = "Goto mark 5" },
    ["<M-6>"] = { ":lua require('harpoon.ui').nav_file(6)<cr>", desc = "Goto mark 6" },
    ["<M-7>"] = { ":lua require('harpoon.ui').nav_file(7)<cr>", desc = "Goto mark 7" },
    ["<M-8>"] = { ":lua require('harpoon.ui').nav_file(8)<cr>", desc = "Goto mark 8" },
    ["<M-9>"] = { ":lua require('harpoon.ui').nav_file(9)<cr>", desc = "Goto mark 9" },
    ["<C-n>"] = { ":lua require('harpoon.ui').nav_next()<cr>", desc = "Next file" },
    ["<C-b>"] = { ":lua require('harpoon.ui').nav_prev()<cr>", desc = "Prev file" },
  },
  v = {
    ["r"] = { "y:s/\\C\\<<C-R>0\\>/" },
    ["<F2>"] = { "'<'>%s/\\C<C-R>0/" },
    ["<F2><F2>"] = { "'<'>s/\\C<C-R>0/" },
    -- ["\\"] = { ToggleKeySet, desc = "Toggles Key Set" },
    ["x"] = { '"_x' },
    -- Rename
    ["<leader>r"] = { function() require("ssr").open() end, desc = "SSR" },
  },
  i = {
    ["<C-o>"] = { "<C-o>o" },
    ["<M-l>"] = { "<cmd>><cr>", desc = "indent" },
    ["<M-h>"] = { "<cmd><<cr>", desc = "indent" },
  },
  c = {
    -- ["<CR>"] = { function() return vim.fn.getcmdtype() == '/' and '<CR>zzzv' or '<CR>' end }
  },
}
