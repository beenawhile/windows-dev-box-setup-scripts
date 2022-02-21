local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local flutter_tools = require'flutter-tools'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true;

local dap = require'dap';

flutter_tools.setup {
	lsp = {
		capabilities = capabilities,
	},
	debugger = { -- integrate with nvim dap + install dart code debugger
    		enabled = true,
    		-- run_via_dap = true, -- use dap instead of a plenary job to run flutter apps 
  	},
}

map('n', '<Leader>fr',':FlutterRun<CR>', opts)
map('n', '<Leader>fc',[[<Cmd>lua require('telescope').extensions.flutter.commands()<CR>]], opts)

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

map('n', '<Leader>ca',':Lspsaga code_action<CR>', opts)
map('x', '<Leader>ca',':Lspsaga code_action<CR>', opts)
map('n', '<Leader>fe',':Lspsaga diagnostic_jump_next<CR>', opts)
map('n', 'K',':Lspsaga hover_doc<CR>"', opts)
map('n', '<leader>gd',[[<cmd>lua vim.lsp.buf.definition()<CR>]], opts)
map('n', '<F2>', ':Lspsaga rename<CR>', opts)
