return {
  "fedepujol/move.nvim",
  config = function()
    require("move").setup({})
    local opts = { noremap = true, silent = true }
    -- Normal-mode commands
    vim.keymap.set("n", "<S-Down>", ":MoveLine(1)<CR>", opts)
    vim.keymap.set("n", "<S-Up>", ":MoveLine(-1)<CR>", opts)
    vim.keymap.set("n", "<M-h>", ":MoveHChar(-1)<CR>", opts)
    vim.keymap.set("n", "<M-l>", ":MoveHChar(1)<CR>", opts)
    vim.keymap.set("n", "<leader>wf", ":MoveWord(1)<CR>", opts)
    vim.keymap.set("n", "<leader>wb", ":MoveWord(-1)<CR>", opts)

    -- Visual-mode commands
    vim.keymap.set("v", "<S-Down>", ":MoveBlock(1)<CR>", opts)
    vim.keymap.set("v", "<S-Up>", ":MoveBlock(-1)<CR>", opts)
    vim.keymap.set("v", "<M-h>", ":MoveHBlock(-1)<CR>", opts)
    vim.keymap.set("v", "<M-l>", ":MoveHBlock(1)<CR>", opts)
  end,
}
