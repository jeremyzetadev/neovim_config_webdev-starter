# To Start (LINUX/WSL)
git clone https://github.com/jeremyzetadev/neovim_config_webdev-starter ~/.config/nvim

# Add nerd-fonts to have icons

.ttf install (prefer JetBrainsMono)
![image](https://github.com/user-attachments/assets/20c30055-e9ec-41a2-b872-82bc59d12250)

# To run node in wsl
sudo apt install npm****

# LSP Configs
check init.lua if server names match mason
:checkhealth mason     -> for diagnostic of mason

[setting up LSP]
||for ts_ls||
npm install -g typescript typescript-language-server
at lsp.lua or 'neovim/nvim-lspconfig'
require('lspconfig').ts_ls.setup{
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
        languages = {"javascript", "typescript", "vue"},
      },
    },
  },



## Need to fix refactor(doesn't work)
## Need to fix autocompletion first suggest using enter clicks suggestion - use tab for autocomplete
