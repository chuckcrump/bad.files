return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
          }
        },
        width = 20
      })
      vim.keymap.set('n', '<C-f>', ':Neotree filesystem toggle right<CR>', {})
      vim.keymap.set('n', '<C-s>', ':Neotree focus<CR>', {})
    end
}
