return 
{
  "folke/tokyonight.nvim",
  name="tokyonight",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("tokyonight").setup()

    -- setup must be called before loading
    vim.cmd.colorscheme "tokyonight-storm"
  end,
}
