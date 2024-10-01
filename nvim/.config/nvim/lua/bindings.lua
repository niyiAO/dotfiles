vim.g.mapleader = " "

map('<Space>', '<Leader>')
nmap('+', 'ddp')
nmap('-', 'ddkP')
nmap('<C-n>', '<CMD>set relativenumber!<CR>')
nmap(';', ':')
nmap('<Leader>-', '<CMD>split<CR>')
nmap('<Leader>\\', '<CMD>vsplit<CR>')
nmap('<Leader>q', '<CMD>close<CR>')
nmap('<Leader><Leader>w', '<CMD>x<CR>')
nmap('<Leader><Leader>q', '<CMD>q!<CR>')
nmap('<Leader>w', '<CMD>w<CR>')
nmap('<C-\\>', '<Esc><CMD>Vex<CR>')
nmap('<Leader>l', '<CMD>noh<CR>')

nmap('<silent> <C-[>', '<CMD>bprev<CR>')
nmap('<silent> <C-]>', '<CMD>bnext<CR>')

nmap('<Leader><Right>', '<C-w><Right><CR>')
nmap('<Leader><Left>', '<C-w><Left><CR>')
nmap('<Leader><Up>', '<C-w><Up><CR>')
nmap('<Leader><Down>', '<C-w><Down><CR>')
nmap('<C-h>', 'b')
nmap('<C-l>', 'w')
nmap('<C-k>', '{')
nmap('<C-j>', '}')

nmap('<Leader>y', '"+y')
nmap('<Leader>p', '"+p')
nmap('<Leader><Leader>p', '"*p')
nmap('<Leader>z', 'za')
nmap('<Leader><Leader>s', '<CMD>source $MYVIMRC<CR>')
nmap('<Leader><Leader><Leader>', '<nop>')
nmap('<Leader><Tab>', '<C-^>')

vmap('*', 'y/<C-r>"<CR>')

nmap('<BS>', '<CMD>Oil<CR>')

