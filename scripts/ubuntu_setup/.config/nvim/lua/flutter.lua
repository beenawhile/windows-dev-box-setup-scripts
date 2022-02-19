local flutter_tools = require'flutter-tools'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true;

flutter_tools.setup {
	lsp = {
		capabilities = capabilities,
	}
}

vim.api.nvim_set_keymap('n', '<Leader>fr',':FlutterRun<CR>'
, { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fc',
[[<Cmd>lua require('telescope').extensions.flutter.commands()<CR>]],
{ noremap = true, silent = true })

-- snippet path
vim.g.vsnip_snippet_dir = '~/.config/nvim/vsnip_snippets/';

-- autoformat on save
vim.cmd 'au BufWritePre *.dart :DartFmt'

-- LSP Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        underline = true,
        signs = true,
        update_in_insert = false
})

-- LSP Code Action
local saga = require 'lspsaga'
saga.init_lsp_saga {
  error_sign = '➤',
  warn_sign = '➤',
  hint_sign = '➤',
  infor_sign = '➤',
  code_action_icon = '',
  code_action_keys = {
    quit = '<ESC>',exec = '<CR>'
  },
}

vim.api.nvim_set_keymap('n', '<Leader>ca',':Lspsaga code_action<CR>',
{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fe',':Lspsaga diagnostic_jump_next<CR>',
{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F2>', ':Lspsaga rename<CR>', { noremap = true, silent = true })
