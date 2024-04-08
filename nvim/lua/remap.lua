-- All key maps moved to mappings.lua
  config = function ()
    -- Change '<C-g>' here to any keycode you like.
    vim.keymap.set('i', '<c-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    vim.keymap.set('i', '<A-]>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
    vim.keymap.set('i', '<A-[>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
    vim.keymap.set('i', '<A-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
end
-- vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")

-- next greatest remap ever : asbjornHaland
-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])


-- This is going to get me cancelled
-- vim.keymap.set("i", "<C-c>", "<Esc>")

-- vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

