let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_min_chars = 1
let g:lsp_signature_help_enabled = 0
let g:lsp_completion_documentation_enabled = 0

if executable('typescript-language-server')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'javascript support using typescript-language-server',
				\ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
				\ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
				\ 'whitelist': ['javascript', 'javascript.jsx', 'javascriptreact']
				\ })
endif

if executable('html-languageserver')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'html-languageserver',
				\ 'cmd': {server_info->[&shell, &shellcmdflag, 'html-languageserver --stdio']},
				\ 'whitelist': ['html'],
				\ })
endif

if executable('css-languageserver')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'css-languageserver',
				\ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
				\ 'whitelist': ['css', 'less', 'sass'],
				\ })
endif
