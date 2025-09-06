-- Keymaps for better default experience


-- Setting mapleader
--vim.keymap.set('n',"[", "/{<Enter>")
--vim.keymap.set('n',"]", "/{<Enter>")
vim.keymap.set('n',"'f1", [[:cd /mnt/c/Users/Senpai/Desktop/Practice/<cr>]])
vim.keymap.set('n',"'f2", [[:cd /mnt/c/Users/Senpai/Desktop/Practice/HTML_CSS/test2/HTML_CSS<cr>]])
vim.keymap.set('n',"'f3", [[:cd C:\Users\Senpai\Desktop\Practice\React<cr>]])
--vim.keymap.set('n',"'fd", [[:!start explorer /select,%:p<cr>]])
vim.keymap.set('n',"tn", [[:tabnew<CR> <esc>]])
vim.keymap.set('n',"tt", [[:bd<CR> <esc>]])
vim.keymap.set('n',"tq", [[:q!<CR> <esc>]])
vim.keymap.set('n',"<A-q>", [[:bprev<CR>]])
vim.keymap.set('n',"<A-e>", [[:bnext<CR>]])
vim.keymap.set('n',"eo", [[:!start explorer /select,%:p<CR>]])
vim.keymap.set('n',"k", "kzz")
vim.keymap.set('n',"j", "jzz")
vim.keymap.set('n',"}", "}zz")
vim.keymap.set('n',"{", "{zz")
-- Set ctrl+z to undo to avoid quitting vim
vim.keymap.set('n',"<C-z>","u")
-- remove highlight from / ? (find command highlights)
vim.keymap.set('n',"'n", [[:nohl<cr>]])
-- Set bracket adder and set inside cursor
--vim.keymap.set('n',"<A-[>", [[a{}<left><cr><esc>O]])
vim.keymap.set('i',"<A-[>", [[{}<left><cr><esc>O]], {noremap =true, silent=true})


-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- For conciseness
local opts = { noremap = true, silent = true }

-- Copy current path to clipboard
-- need xclip - install at linux cli
vim.opt.clipboard = "unnamedplus"
-- if vim.fn.has('wsl')==1 then
--     vim.api.nvim_create_autocmd('TextYankPost',{
--         group = vim.api.nvim_create_augroup('Yank',{ clear = true }),
--         callback = function()
--             vim.fn.system('clip.exe',vim.fn.getreg('"'))
--         end,
--     })
-- end
local function insertFullPath()
    local filepath = vim.fn.expand('%:p')
    vim.fn.setreg('+',filepath) --  write to clipboard
end
vim.keymap.set('n', "<leader>pc", insertFullPath, opts)

-- nvim tree 
-- vim.keymap.set('n',"<Leader>t", ":NvimTreeToggle<Return>", opts)
-- vim.keymap.set('n',"<Leader>tf", ":NvimTreeFindFile<Return", opts)

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Allow moving the cursor through wrapped lines with j, k
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- clear highlights
vim.keymap.set('n', '<Esc>', ':noh<CR>', opts)

-- save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- save file without auto-formatting
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':Bdelete!<CR>', opts)   -- close buffer
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

-- Increment/decrement numbers
vim.keymap.set('n', '<leader>+', '<C-a>', opts) -- increment
vim.keymap.set('n', '<leader>-', '<C-x>', opts) -- decrement

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts)   -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts)     --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts)     --  go to previous tab

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Press jk fast to exit insert mode
-- vim.keymap.set('i', 'jk', '<ESC>', opts)
--vim.keymap.set('i', 'kj', '<ESC>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Move text up and down
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==',opts)
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==',opts)
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv",opts)
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv",opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Replace word under cursor
vim.keymap.set('n', '<leader>j', '*``cgn', opts)

-- Explicitly yank to system clipboard (highlighted and entire row)
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- Toggle diagnostics
local diagnostics_active = true

vim.keymap.set('n', '<leader>do', function()
  diagnostics_active = not diagnostics_active

  if diagnostics_active then
    vim.diagnostic.enable(0)
  else
    vim.diagnostic.disable(0)
  end
end)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Save and load session
vim.keymap.set('n', '<leader>ss', ':mksession! .session.vim<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>sl', ':source .session.vim<CR>', { noremap = true, silent = false })
