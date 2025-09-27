return 
{
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
          require("catppuccin").setup({
          -- ... other configuration options ...
          custom_highlights = function(colors)
              return {
                  -- This targets local variables using the standard Tree-sitter `@variable` group
                   -- ["@variable"] = { fg = '#BD93F9' },
                   ["@variable"] = { fg = colors.lavender },
                  -- ["@parameter"] = { fg = colors.lavender },
                  -- Add other overrides here
                  -- Comment = { fg = colors.red}
              }
          end,
      })


    -- setup must be called before loading
    vim.cmd.colorscheme "catppuccin"
  end,
}
