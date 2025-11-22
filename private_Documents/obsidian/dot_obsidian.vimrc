imap jk <Esc>
imap JK <Esc>
imap Jk <Esc>
imap jK <Esc>
nnoremap H ^
nnoremap L $
nnoremap J 15j
nnoremap K 15k
set clipboard=unnamedplus
nnoremap j gj
nnoremap k gk
exmap q obcommand workspace:close-tab-group
exmap wq obcommand workspace:close-tab-group
exmap vs obcommand workspace:split-vertical
exmap sp obcommand workspace:split-horizontal
exmap nexttab obcommand workspace:next-tab
exmap prevtab obcommand workspace:previous-tab
exmap lefttoggle obcommand app:toggle-left-sidebar
exmap focusleft obcommand editor:focus-left
exmap focusright obcommand editor:focus-right
exmap focustop obcommand editor:focus-top
exmap focusbottom obcommand editor:focus-bottom
exmap search obcommand global-search:open

nmap <C-u> :nexttab<CR>
nmap <C-y> :prevtab<CR>
nmap <C-n> :lefttoggle<CR>
nmap <C-h> :focusleft<CR>
nmap <C-l> :focusright<CR>
nmap <C-j> :focusbottom<CR>
nmap <C-k> :focustop<CR>
nmap <C-g> :search<CR>
